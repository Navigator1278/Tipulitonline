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

    public function getNameByEmail($email){

       $db = Zend_Db_Table_Abstract::getDefaultAdapter();
       $stmp = $db->query("
           SELECT u_name FROM users WHERE u_email='".$email."'");
       $record = $stmp->fetchAll();
       if ($record)
            return $record[0]['u_name'];
       else return false;
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
        $body = $body."<br/>";
        $body = $body."Heשלום רב,<br/>";
        $body = $body."ברוכים הבאים לטיפולית אונליין";
        $body = $body."מייל זה נשלח באופן אוטומטי לאחר מילוי פרטים אישיים באתר tipulitonline.co.il ";
        $body = $body."בכדי להמשיך את תהליך הרישום לחצו על הלינק הבא:";
        $body = $body."<br/><a href='";
        $body = $body."http://www.tipulitonline.co.il/user/registration/validate-email/email/".$email."/code/".$code."";
        $body = $body."'>VALIDATE</a>.<br/>";
        $body = $body."<br/>";
        $body = $body."או העתיקו את שורת הכתובת הבאה לדפדפן בשביל להמשיך את תהליך הרישום למערכת:<br/>";
        $body = $body."www.tipulitonline.co.il/user/registration/validate-email/email/".$email."/code/".$code."<br>";
        $body = $body."אל תענו לכתובת מייל זו – היא נשלחה באופן אוטומטי. במידה ונתקלתם בבעיה בתהליך";
        $body = $body."<br/>";
        $body = $body."הרישום פנו אלינו בטלפון: 03-6470326 לצוות טיפולית אונליין.";
        $body = $body."<br/>";
        $body = $body."בברכה,";
        $body = $body."<br/>";
        $body = $body."צוות טיפולית אונליין";

        $mail = new Zend_Mail();
        $mail->setBodyHtml($body)
                ->setFrom("no-reply@tipulitonline.co.il", "טיפולית אונליין")
                ->addTo($email)
                ->setSubject("בבקשה אשרו כתובת אימייל להמשך הרישום");
        $mail->send();
    }

    public function sendWelcomeMail($email,$username){

        $body = "";
        $body .= "$username";
        $body .= "שלום";
        $body .= "<br/>";
        $body .= "אנו מודים לך על הצטרפותך למרכז הלמידה והתרגול של טיפולית אונליין. הצוות שלנו ייצור ";
        $body .= "<br/>";
        $body .= "עימך קשר בזמן הקרוב בכדי להתאים לך תרגול יוגה אישי.";
        $body .= "<br/><br/>";
        $body .= "מרכז הלמידה שנפתח בעבורך הוא חלון לעולם של ידע אודות היוגה. מטרתו של מרכז ";
        $body .= "<br/>";
        $body .= "הלמידה הוא לעודד וללמד יוגה בבית וליישם את עקרונותיה בחיי היום יום. באמצעות מרכז ";
        $body .= "<br/>";
        $body .= "הלמידה אפשר להיות בקשר עם מדריכנו ולספק משוב על איכות התרגול, העדפות ובקשות ";
        $body .= "<br/>";
        $body .= "מיוחדות.";
        $body .= "<br/><br/>";
        $body .= "במרכז הלמידה מחכה לך עתה סרטון הסבר ראשון. את/ה מוזמנ/ת לצפות בסרטון וליישם  ";
        $body .= "<br/>";
        $body .= "את עקרונות היוגה כבר בתרגול הראשון.";
        $body .= "<br/><br/>";
        $body .= "חשוב: עליך להודיע לנו על כל שינוי במצבך הבריאותי או על כל עניין גופני אחר הקשור ";
        $body .= "<br/>";
        $body .= "לתרגול כמו קושי מיוחד בביצוע התרגילים, כאב או מגבלה אחרת. נבקש ממך לדווח על כל ";
        $body .= "<br/>";
        $body .= "שיפור שחל בעקבות התרגול. היוגה שאנו מלמדים מעוררת כוחות ריפוי פנימיים. את/ה  ";
        $body .= "<br/>";
        $body .= "מוזמנים לתרגל בקביעות ולהיעזר במרכז הלמידה.";
        $body .= "<br/><br/>";
        $body .= "צוות טיפולית אונליין עומד לרשותך במייל: ";
        $body .= "<a href='info@tiupulitonline.co.il'>info@tiupulitonline.co.il</a>";
        $body .= "<br/>";
        $body .= "כתובת האינטרנט שלנו היא: ";
        $body .= "<a href='http://www.tipulitonline.co.il'></a>'";
        $body .= "<br/><br/>";
        $body .= "בברכה,";
        $body .= "<br/><br/>";
        $body .= "צוות טיפולית אונליין";

        $mail = new Zend_Mail();
        $mail->setBodyHtml($body)
                ->setFrom("no-reply@tipulitonline.co.il", "טיפולית אונליין")
                ->addTo($email)
                ->setSubject("ברוכים הבאים לטיפולית אונליין");
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

