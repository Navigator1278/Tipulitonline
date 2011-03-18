<?php

class Student_Model_Students extends Zend_Db_Table_Abstract{

    protected $_name = 'users';

    /*
     * getting data from the table users
     */

    public function getStudentMainData($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('users')
                    ->where("u_id=$id");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res[0];
    }

    /*
     * getting data from the table user__health_table
     */
    public function getStudentHealthData($id){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('user__health_table')
                    ->where("uht_user_id=$id");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res[0];    
        }


        /*
         * Getting the status of the student's account
         */
    public function getStudentStatus($id){
        $userMainData = $this->getStudentMainData($id);
        $statusId = $userMainData['u_status_id'];
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('user__status')
                    ->where("us_id=$statusId");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res[0]['us_type'];
        }




        /*
         * assigning image uploaded to the student's record in the DB
         */
    public function uploadStudentAva($id,$ava){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $userdata = array(
            'u_picture' => $ava,
            );
        $select = $db->select()
                    ->from('users')
                    ->where("u_id=$id");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        $fileToDelete = "avatars/".$res[0]['u_picture'];
        echo "FILE2DEL IS:".$fileToDelete;
        unlink ($fileToDelete);
        $db->update('users', $userdata,"u_id=$id");
        }

        /*
         * updating Student's data in both tables
         */
        public function updateStudentData($id, $data){
       
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $userdata = array(
              'u_name' => $data['firstname'],
              'u_family_name' => $data['lastname'],
              'u_email' => $data['email'],
              'u_sex_id' => $data['sex'],
              'u_date_of_birth' => $data['datepicker'],
              'u_status_id' => 4,
              'u_state_id' => $data['state'],
              'u_zip' => null,
              'u_date_of_birth' =>$data['datepicker'],
              'u_address' => $data['address'],
              'u_country_id' => 1,
              'u_objectives' => $data['objectives'],
              'u_external_emails' => $data['external'],
            );

            if ($data['password1']){
                $userdata['u_password'] = $data['password1'];
            }

            $userhealthdata = array(
               'uht_pregnant' => $data['pregnant'],
               'uht_pregnant_since' => $data['pregnantsince'],
               'uht_heart_or_pb' => $data['heartpressure'],
               'uht_diabetes' => $data['diabetes'],
               'uht_migrene' => $data['migrene'],
               'uht_babies' => $data['babies'],
               'uht_nosleep' => $data['nosleep'],
               'uht_digestion' => $data['digestion'],
               'uht_menopause' => $data['menopause'],
               'uht_sclorosies' => $data['sclorosies'],
               'uht_epilepsy' => $data['epilepsy'],
               'uht_cancer' => $data['cancer'],
               'uht_asthma' => $data['asthma'],
               'uht_Artritis' => $data['artritis'],
               'uht_hernia' => $data['hernia'],
               'uht_depression_or_anxiety' => $data['depression'],
               'uht_headaches' => $data['headaches'],
               'uht_fatigue' => $data['fatigue'],
               'uht_injury' => $data['injury'],
               'uht_injury_text' => $data['injurytext'],
               'uht_medication' => $data['medication'],
               'uht_which_medication' => $data['medicationtext'],
               'uht_walk' => $data['walk'],
               'uht_hands' => $data['hands'],
               'uht_sit' => $data['legs'],
               'uht_backashes' => $data['backashes'],
               'uht_slipped_disk' => $data['disc'],
               'uht_general1' => $data['general1'],
               'uht_general2' => $data['general2'],
               'uht_general3' => $data['general3'],
               'uht_lower_back' => $data['lowerback'],
               'uht_upper_back' => $data['upperback'],
               'uht_neck_and_shoulders' => $data['neck'],
               'uht_ankles_and_feet' => $data['feet'],
               'uht_thighs_or_pelvis' => $data['pelvis'],
               'uht_breath' => $data['breath'],
               'uht_knees' => $data['knees'],
               'uht_head' => $data['head'],
               'uht_ankles' => $data['ankles'],
               'uht_wrists' => $data['wrists'],
               'uht_more_info' => $data['moreinfo'],
            );

            $db->update('users', $userdata,"u_id=$id");
            $db->update('user__health_table', $userhealthdata,"uht_user_id=$id");
        
        }
}
