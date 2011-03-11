<?php

class System_Model_SystemEmailValidation extends Zend_Db_Table_Abstract
{
    protected $_name = 'system__email_validation';

    private function getIdByEmail($email){

       $db = Zend_Db_Table_Abstract::getDefaultAdapter();
       $stmp = $db->query("
           SELECT u_id FROM users WHERE u_email='".$email."'");
       $record = $stmp->fetchAll();
       if ($record)
            return $record[0]['u_id'];
       else return false;
    }

    public function getId($email){
        return $this->getIdByEmail($email);
    }


    public function checkIfRecordExists($email){

       $userId = $this->getIdByEmail($email);
       $db = Zend_Db_Table_Abstract::getDefaultAdapter();
       $stmp = $db->query("SELECT * FROM system__email_validation WHERE sev_user_id=$userId");
       $row = $stmp->fetchAll();
       if ($row) return true;
            else return false;
    }

    public function insertEmailValidationRecord($email, $password, $code){

        $userId = $this->getIdByEmail($email);
        $data = array(
          'sev_id' => null,
          'sev_reg_request_time' => null,
          'sev_user_id' => $userId,
          'sev_validation_code' => $code,
          'sev_pass' => $password,
        );
        return $this->insert($data);
    }

    public function updateEmailValidationRecord($email, $code){
        $userId = $this->getIdByEmail($email);
        $data = array(
         'sev_user_id' => $userId,
         'sev_validation_code' => $code,
        );
        return $this->update($data, "sev_user_id=$userId");
    }

    public function sendMail($email, $code){
        $body = "";
        $body = $body."Hello!<br/>";
        $body = $body."You need validate your email. Press - <a href='";
        $body = $body."http://www.tipulitonline.co.il/user/registration/validate-email/email/".$email."/code/".$code."";
        $body = $body."'>VALIDATE</a>.<br/>";
        $body = $body."<br/>";
        $body = $body."If you could not see the link please open the following string:<br/>";
        $body = $body."www.tipulitonline.co.il/user/registration/validate-email/email/".$email."/code/".$code."";
        $body = $body."<br/>in your favorite browser:<br/>";
        $body = $body."Thank you!";


        $mail = new Zend_Mail();
        $mail->setBodyHtml($body)
                ->setFrom("no-reply@tipulitonline.co.il", "Admin")
                ->addTo($email)
                ->setSubject("Please confirm your Account at Tipulitonline!");
        $mail->send();
    }

    public function sendWelcomeMail($email){
        
        $body = "";
        $body = $body."<br \>Welcome to the Tipuliteonline!";

        $mail = new Zend_Mail();
        $mail->setBodyHtml($body)
                ->setFrom("no-reply@tipulitonline.co.il", "Admin")
                ->addTo($email)
                ->setSubject("Your Account at Tipulitonline was regitered!");
        $mail->send();
    }




    public function checkValidationCode($code, $email){
       $db = Zend_Db_Table_Abstract::getDefaultAdapter();
       $stmp1 = $db->query("SELECT * FROM system__email_validation WHERE sev_validation_code='".$code."'");
       $row1 = $stmp1->fetchAll();
       $stmp2 = $db->query("SELECT * FROM users WHERE u_email='".$email."'");
       $row2 = $stmp2->fetchAll();
       if ($row1&&$row2) return true;
            else return false;
    }

}

