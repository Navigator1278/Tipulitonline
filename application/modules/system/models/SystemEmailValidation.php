<?php

class System_Model_SystemEmailValidation extends Zend_Db_Table_Abstract
{
    protected $_name = 'system__email_validation';

    private function getIdByEmail($email){

       $db = Zend_Db_Table_Abstract::getDefaultAdapter();
       $stmp = $db->query("
           SELECT u_id FROM users WHERE u_email='".$email."'");
       $record = $stmp->fetchAll();
       echo $record[0]['u_id'];
       return $record[0]['u_id'];
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
        
        $mail = new Zend_Mail();
        $confirmationUrl = "www.tipulit-online.local/user/registration/
                        validate-email/code/{$code}/email/{$email}";
        $confirmationLink = "<a href='".$confirmationUrl."'>validate</a>";
        echo $confirmationLink;
        $mail->setBodyText($confirmationLink)
                ->setFrom("someone@somewhere.com", "Dima")
                ->addTo("tenhi@mail.ru")
                ->setSubject("Please confirm your Account at Tipulitonline!
                ");
        $mail->send();
    }

    public function checkValidationCode($code, $email){
       $db = Zend_Db_Table_Abstract::getDefaultAdapter();
       $stmp1 = $db->query("SELECT * FROM system__email_validation WHERE sev_validation_code='$code'");
       $row1 = $stmp1->fetchAll();
       $stmp2 = $db->query("SELECT * FROM users WHERE u_email='$email'");
       $row2 = $stmp2->fetchAll();
       if ($row1&&$row2) return true;
            else return false;
    }

}

