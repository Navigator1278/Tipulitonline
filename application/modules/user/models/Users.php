<?php

class User_Model_Users extends Zend_Db_Table_Abstract{

    protected $_name = 'users';

    private function resolveUserCountry($ip){

        $userLocation = new User_Model_UserLocation();
        return $userLocation->getCountry($ip);
    }


    public function addUser($data){

        /*
         * Adding a new user to the system, userdata will be inserted
         * to 2 Tables: 'users' and after that some data goes to user__health_table
         */
        
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $resolveLocation =$this->resolveUserCountry($_SERVER['REMOTE_ADDR']);
        $userdata = array(
          'u_id' => null,
          'u_name' => $data['firstname'],
          'u_family_name' => $data['familyname'],
          'u_sex_id' => $data['sex'],
          'u_status_id' => 5,
          'u_ip' => $_SERVER['REMOTE_ADDR'],
          'u_ip_country' => $resolveLocation['countryName'],
          'u_registraion_date' => date('Y-m-d'),
          'u_address' => $data['address'],
          'u_state_id' => 1,
          'u_zip' => $data['zip'], 
          'u_country_id' => 1,
          'u_password' => $data['password1'],
          'u_email' => $data['email'],
          'u_date_of_birth' => $data['datepicker'],
          'u_external_emails' => 'Yes',
          'u_visits_amount' => 1,
          'u_picture' => $data['userimage'],
          'u_registration_stamp' => '3333',
          'u_objectives' => $data['objectives'],
        );
        $db->insert($this->_name, $userdata);
        $systemEmailValidation = new System_Model_SystemEmailValidation();
        $userId = $systemEmailValidation->getId($data['email']);
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
      $userdata2 = array(
          'uht_user_id' => $userId,
          'uht_height' =>$data['heigth'],
          'uht_weight' => $data['weight'],
          'uht_pregnant' => $data['pregnant'],
          'uht_pregnant_since' => $data['pregnantsince'],
        );
       return $db->insert('user__health_table', $userdata2);
    }

    /*
     * Proovs email und password submitted.
     * Returns true or false
     */

    public function checkAuth($email, $password){

        if (!$email){
            $email = 'notvalid'; $password='notvalid';
        }
       $db = Zend_Db_Table_Abstract::getDefaultAdapter();
       $authAdapter = new Zend_Auth_Adapter_DbTable($db);
       $authAdapter->setTableName('users');
       $authAdapter->setIdentityColumn('u_email');
       $authAdapter->setCredentialColumn('u_password');
       $authAdapter->setIdentity($email);
       $authAdapter->setCredential($password);
       $auth = Zend_Auth::getInstance();
       $result = $auth->authenticate($authAdapter);
       if ($result->isValid()){
           $data = $authAdapter->getResultRowObject(null, 'u_password');
           $auth->getStorage()->write($data);
           return 1;
       }
       else { //checking if the data submittet  is the teacher's data
           $db = Zend_Db_Table_Abstract::getDefaultAdapter();
           $authTeacherAdapter = new Zend_Auth_Adapter_DbTable($db);
           $authTeacherAdapter->setTableName('teachers');
           $authTeacherAdapter->setIdentityColumn('t_email');
           $authTeacherAdapter->setCredentialColumn('t_pass');
           $authTeacherAdapter->setIdentity($email);
           $authTeacherAdapter->setCredential($password);
           $authTeacher = Zend_Auth::getInstance();
           $resultTeacher = $authTeacher->authenticate($authTeacherAdapter);
           if ($resultTeacher->isValid()){
               $dataTeacher = $authTeacherAdapter->getResultRowObject(null, 't_pass');
               $authTeacher->getStorage()->write($dataTeacher);
               return 2;
           }
           else {
               return false; 
           }
       }
    }

    /*
     * Incrementing the ammount of logins of the user
     */
    public function increaseVisitsAmount($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('users')
                    ->where("u_id=$id");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        $visitsAmount = $res[0]['u_visits_amount'];
        $visitsAmount++;
        $data = array(
            'u_visits_amount' => $visitsAmount,
        );
        $db->update('users', $data, "u_id=$id");
    }

    /*
     * changing the time of the last student's activity
     */
    public function changeStudentActivityTime($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $data = array(
            'u_lastactivity' => null,
        );
        return $db->update('users', $data, "u_id=$id");
    }

    /*
     * changing the time of the last teachers's activity
     */
    public function changeTeacherActivityTime($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $data = array(
            't_lastactivity' => null,
        );
        return $db->update('teachers', $data, "t_id=$id");
    }

    /*
     * checking student's new messages in the chat
     */
    public function checkStudentsMessages($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $sql = "SELECT * FROM chat WHERE chat_from_user_id=? OR chat_to_user_id=? ORDER BY chat_datetime ASC";
            $res = $db->fetchAll($sql, array($id,$id));
        return $res;
    }

    /*
     * checking teacher's new messages in the chat
     */
    public function checkTeachersMessages($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $sql = "SELECT * FROM chat WHERE chat_isread_t=0 AND (chat_from_user_id=? OR chat_to_user_id=?) ORDER BY chat_datetime ASC";
            $res = $db->fetchAll($sql, array($id,$id));
        return $res;
    }

    /*
     * Adding new chatmessage
     */
    public function addNewChatMessage($fromUser=null, $fromTeacher=null, $toUser=null, $toTeacher=null, $message=" ", $isStudentOnline=0, $isTeacherOnline=0){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();

        $replaceFrom = array( //replaces smiles
            "[:cool:]", "[:dont:]","[:evil:]","[:good:]","[:love:]","[:sad:]",
            "[:saint:]", "[:scared:]","[:suspend:]","[:ugly:]","[:music:]","[:lucky:]","[:wink:]",
            "<br>"
        );
        $replaceTo = array(
            "<img src='/i/smiles/cool.gif' alt='cool'/>",
            "<img src='/i/smiles/dont.gif' alt='dont'/>",
            "<img src='/i/smiles/evil.gif' alt='evil'/>",
            "<img src='/i/smiles/good.gif' alt='good'/>",
            "<img src='/i/smiles/love.gif' alt='love'/>",
            "<img src='/i/smiles/sad.gif' alt='sad'/>",
            "<img src='/i/smiles/saint.gif' alt='saint'/>",
            "<img src='/i/smiles/scared.gif' alt='scared'/>",
            "<img src='/i/smiles/suspend.gif' alt='suspend'/>",
            "<img src='/i/smiles/ugly.gif' alt='ugly'/>",
            "<img src='/i/smiles/music.gif' alt='music'/>",
            "<img src='/i/smiles/lucky.gif' alt='lucky'/>",
            "<img src='/i/smiles/wink.gif' alt='wink'/>",
            "",
        );

        $data = array(
            'chat_from_user_id' => $fromUser,
            'chat_from_teacher_id' => $fromTeacher,
            'chat_to_user_id' => $toUser,
            'chat_to_teacher_id' => $toTeacher,
            'chat_message' => stripslashes(str_replace($replaceFrom, $replaceTo, $message)),
            'chat_datetime' => null,
            'chat_isread_s' => $isStudentOnline,
            'chat_isread_t' => $isTeacherOnline,
        );
        return $db->insert('chat', $data);
    }

    /*
     * if student enters the chat area all other requests should be eliminated
     */
    public function resetAllChatRequestsStudent($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $data = array(
            'chat_isread_s' => 1,
        );
        return $db->update('chat', $data, "chat_to_user_id=$id OR chat_from_user_id=$id");
    }

     /*
     * if student enters the chat area all other requests should be eliminated
     */
    public function resetAllChatRequestsTeacher($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $data = array(
            'chat_isread_t' => 1,
        );
        return $db->update('chat', $data, "chat_to_user_id=$id OR chat_from_user_id=$id");
    }


    /*
     * Password recovery
     */
    public function recoverPasswordUser($email){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('users')
                    ->where("u_email='$email'");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        $password = $res[0]['u_password'];
        $body = "";
        $body .= "You have requested password recovery function<br/>";
        $body .= "Your password is: $password";
        $mail = new Zend_Mail('UTF-8');
        $mail->setHeaderEncoding(Zend_Mime::ENCODING_BASE64);
        $mail->setBodyHtml($body)
                ->setFrom("no-reply@tipulitonline.co.il","")
                ->addTo($email)
                ->setSubject("Password reminder");
        $mail->send();
    }


}
