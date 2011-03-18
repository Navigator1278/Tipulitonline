<?php

class Student_Model_MailExchange extends Zend_Db_Table_Abstract{

  protected $_name = 'privat_messages';


  /*
   * Getting all messages sent by teacher to the sudent
   *
   */

  public function getAllMessagesFromTeacher($studentId){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('privat_messages')
                    ->order('spm_datetime DESC')
                    ->where("spm_to_user_id=$studentId OR spm_from_user_id=$studentId");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res;
  }


  public function getTeacherNameById($teacherId){
      
      $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('teachers')
                    ->where("t_id=$teacherId");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res[0]['t_first_name']." ".$res[0]['t_last_name'];
  }

  public function sendMessageFromStudentToTeacher($studentId, $teacherId, $subj, $text){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $data = array(
          'spm_from_user_id' => $studentId,
          'spm_from_teacher_id' => null,
          'spm_to_user_id' => null,
          'spm_to_teacher_id' => $teacherId,
          'spm_subject' => stripslashes($subj),
          'spm_body' => stripslashes($text),
          'spm_datetime' => date('Y-m-d H:i:s'),
          'spm_is_new' => 0,
        );
        return $db->insert('privat_messages',$data);
  }
  
    
}