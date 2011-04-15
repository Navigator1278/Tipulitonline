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
          'spm_subject' => stripslashes(trim(strip_tags($subj))),
          'spm_body' => stripslashes(strip_tags($text,"<br><br/><br /><strong><p><em><u><font><img><span><a>")),
          'spm_datetime' => date('Y-m-d H:i:s'),
          'spm_is_new' => 0,
        );
        return $db->insert('privat_messages',$data);
  }
  
  public function sendMessageFromTeacherToStudent($studentId, $teacherId, $subj, $text){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $data = array(
          'spm_from_user_id' => null,
          'spm_from_teacher_id' => $teacherId,
          'spm_to_user_id' => $studentId,
          'spm_to_teacher_id' => null,
          'spm_subject' => stripslashes(trim($subj)),
          'spm_body' => stripslashes(trim($text)),
          'spm_datetime' => date('Y-m-d H:i:s'),
          'spm_is_new' => 0,
        );
        return $db->insert('privat_messages',$data);
  }
  /*
   * setting up the flag after user reads the email
   */
  public function setReadEmailFlag($emailId,$side){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('privat_messages')
                    ->where("spm_id=$emailId");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        if (($res[0]['spm_from_user_id']&&($side=='student'))||($res[0]['spm_from_teacher_id']&&($side=='teacher'))) return;//
        $data = array(
            'spm_is_new' => 1,
        );
        $db->update('privat_messages', $data, "spm_id=$emailId");
  }

  public function sendNewUserInformation($userId){
      

      $teacherMail = new Teacher_Model_Teachers();
      $teacherMail = $teacherMail->getTeacherMainData(1);

      $body = "";
      $body = $body."<br/>";
      $body = $body."The new <a href='/teacher/dashboard/view-student/stid/$userId'>user</a> was registered at the site";
      $body = $body."<br/>";
      $mail = new Zend_Mail('UTF-8');
      $mail->setHeaderEncoding(Zend_Mime::ENCODING_BASE64);
      $mail->setBodyHtml($body)
                ->setFrom("no-reply@tipulitonline.co.il", "System Alert")
                ->addTo($email)
                ->setSubject("New user was registered");
     //$mail->send();
      $this->sendMessageFromStudentToTeacher(0, 1, 'New user was registered', $body);
      
      $db = Zend_Db_Table_Abstract::getDefaultAdapter();
              $alert = array(
              'sa_id' => null,
              'sa_student_id' => $userId,
              'sa_teacher_id' => null,
              'sa_alert_type_id' => 1,
            );
        $db->insert('system__alerts', $alert);
  }


  public function sendExternalMailToStudent($studentId, $subj, $text){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('users')
                    ->where("u_id=$studentId");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        $external = $res[0]['u_external_emails'];
        if (!$external) return;
        $username = $res[0]['u_name'];
        $userfamilyname = $res[0]['u_family_name'];
        $email = $res[0]['u_email'];
        $mail = new Zend_Mail('UTF-8');
        $mail->setHeaderEncoding(Zend_Mime::ENCODING_BASE64);
        $mail->setBodyHtml($text)
                ->setFrom("no-reply@tipulitonline.co.il", "Admin")
                ->addTo($email)
                ->setSubject($subj);
       // $mail->send();
  }


  public function sendFeedbackFromStudent($stid, $video, $improvement, $level, $difficulty, $suggestions){
      
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $data = array(
          'f_user_id' => $stid,
          'f_video_id' => $video,
          'f_improvement' => $improvement, 
          'f_difficulty' => stripslashes($level),
          'f_difficulty_text' => stripslashes($difficulty),
          'f_suggestions' => $suggestions,
        );
        $db->insert('feedback',$data);

        $student = new Student_Model_Students();
        $teachers = new Teacher_Model_Teachers();
        $studentData = $student->getStudentMainData($stid);
        $studentName = $studentData['u_name'];
        $studentLastName = $studentData['u_family_name'];
        $teacherMail = $teachers->getTeacherMainData(1);

        $alert = array(
              'sa_id' => null,
              'sa_student_id' => $stid,
              'sa_teacher_id' => null,
              'sa_alert_type_id' => 4,
            );
        $db->insert('system__alerts', $alert);

        $body = "";
        $body = $body."<br/>";  
        $body = $body."You've got following feedback from $studentName $studentLastName according to the video: $video:";
        $body = $body."<br/><br/>";
        $body = $body."Improvement: $improvement";
        $body = $body."<br/>";
        $body = $body."Difficulty: $level";
        $body = $body."<br/><br/>";
        $body = $body."His comments to the difficulty: $difficulty";
        $body = $body."<br/>";
        $body = $body."His suggestions: $suggestions";
        $body = $body."<br/><br/>";
        $mail = new Zend_Mail();
        $mail->setBodyHtml($body)
                ->setFrom("no-reply@tipulitonline.co.il", "Feedback from $studentLastName")
                ->addTo($teacherMail['t_email'])
                ->setSubject("You ve got new feedback from student at tipulitonline.co.il");
        //$mail->send();
        $this->sendMessageFromStudentToTeacher($stid, 1, "משוב על תרגול", $body);
  }
}