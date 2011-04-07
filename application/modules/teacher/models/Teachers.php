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
        );
        return $db->insert('chat', $data);
    }

    public function getAllOfflineMessages($stid,$tid){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('chat')
                    ->where("chat_isread_t=0")
                    ->where("chat_to_teacher_id=$tid");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res;
    }
   
}
