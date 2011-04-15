<?php

class Teacher_Model_Teachers extends Zend_Db_Table_Abstract{

    protected $_name = 'teachers';

    /*
     * getting data from the table teachers
     */
    public function getTeacherMainData($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('teachers')
                    ->where("t_id=$id");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res[0];
    }

    /*
     * Teacher saves paymeny info with the help of texteditor
     * This info will be showing when student upgrades his account
     */
    public function savePaymentInfo($data){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $data = array(
              'p_value' => stripcslashes($data),
            );
            $db->update('system__properties', $data, "p_name='payment_info'");
            return $data;
    }

    public function getPaymentInfo(){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('system__properties')
                    ->where("p_name='payment_info'");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res[0]['p_value'];
    }

    /*
     * Teacher send chat request to student
     * Returning if the request was already sent
     */
    public function sendChatRequestToStudent($stid, $tid=1){
        
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('chat')
                    ->where("chat_from_teacher_id=$tid")
                    ->where("chat_to_user_id=$stid")
                    ->where("chat_isread_s=0");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        if ($res) return; //some unread messages found = request was already sent

        $data = array(
            'chat_from_teacher_id' => $tid,
            'chat_to_user_id' => $stid,
            'chat_message' => 'New chat request',
            'chat_datetime' => null,
            'chat_isread_s' => 0,
            'chat_isread_t' => 1,
        );
        return $db->insert('chat', $data);
    }
    /*
     * Getting all offline messages
     */
    public function getAllOfflineMessages($tid){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('chat')
                    ->join('users', "u_id=chat_from_user_id","u_family_name")
                    ->where("chat_isread_t=0")
                    ->where("chat_to_teacher_id=$tid");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res;
    }
    
    /*
     * Checking visibility of the teacher
     */
    
    public function checkTeacherVisibility($tid){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('teachers')
                    ->where("t_id=$tid");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        if (!$res) return false;
        if ($res[0]['t_visible']==1) return true;
            else return false;
    }

    public function changeVisibility($tid, $visibility){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $data = array(
            't_visible' => $visibility,
        );
        $db->update('teachers', $data, "t_id=$tid");
    }


    /*
     * Getting all status
     */
    public function getAllStatuses(){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('user__status');
        $stmp = $select->query();
        return $stmp->fetchAll();
    }

    /*
     * getting the student's status, returns the status ID
     */
    public function getStudentStatus($stid){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('user__status')
                    ->join('users', "users.u_status_id=user__status.us_id",null)
                    ->where("u_id=$stid");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res[0]['us_type'];
    }

    /*
     * setting up new student's status
     */
    public function changeStudentStatus($stid,$statusId){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $data = array(
          'u_status_id'=>  $statusId,
        );
        $db->update('users', $data, "u_id=$stid");
    }

    /*
     * Counting days from last login
     */
    public function calculateDaysDifference($fromDate){
        
        return intval((time() - strtotime($fromDate))/86400);
    }
   
}
