<?php

class User_Model_Users extends Zend_Db_Table_Abstract{

    protected $_name = 'users';

    public function addUser($data){

        /*
         * Adding a new user to the system, userdata will be inserted
         * to 2 Tables: 'users' and after that some data goes to user__health_table
         */
        
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $userdata = array(
          'u_id' => null,
          'u_name' => $data['firstname'],
          'u_family_name' => $data['familyname'],
          'u_status_id' => 4,
          'u_registraion_date' => date('Y-m-d'),
          'u_address' => $data['address'],
          'u_state_id' => 1,
          'u_zip' => $data['zip'],
          'u_country_id' => 1,
          'u_password' => $data['password1'],
          'u_email' => $data['email'],
          'u_date_of_birth' => $data['datepicker'],
          'u_external_emails' => $data['external'],
          'u_visits_amount' => 0,
          'u_picture' => $data['userimage'],
          'u_registration_stamp' => '3333',
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
        );

        return $db->insert('user__health_table', $userdata2);
    }

    /*
     * Proovs email und password submitted.
     * Returns true or false
     */

    public function checkAuth($email, $password){
        
       $db = Zend_Db_Table_Abstract::getDefaultAdapter();
       $stmp = $db->query("SELECT * FROM users WHERE u_email='$email' AND u_password='$password'");
       $row = $stmp->fetchAll();
       if ($row) return true;
            else return false;
    }



}
