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

        /*
         * Function that returns all Kaltura videos accorting to the User's Id
         */
        public function getAllKalturaVideosForUser($userId){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('video__all_movies')
                    ->order("vam_timestamp DESC")
                    ->where("vam_user_id=$userId")
                    ->where("vam_video_player2 IS NULL");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        if ($res) return $res[0];
            else return false;

        }

        /*
         * Getting all videos, posted to the student by the teacher through YouTube-player
         */
        public function getAllYouTubeVideosForUser($userId){
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $select = $db->select()
                    ->from('video__all_movies')
                    ->order("vam_timestamp DESC")
                     ->where("vam_user_id=$userId")
                    ->where("vam_video_player1 IS NULL");
            $stmp = $select->query();
            $res = $stmp->fetchAll();
            if ($res) return $res[0];
                else return false;
        }

        /*
         *  Getting all 6D-videos that are available for this student at the moment
         */
        public function getAll6DVideosForUser($stid){
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $sql = 'SELECT * FROM video__6d_status, video__6d
                    WHERE video__6d_status.v6ds_video_id = video__6d.v6d_id
                    AND v6ds_user_id=? ORDER BY v6ds_video_id DESC';
            $res = $db->fetchAll($sql,$stid);
            return $res;
        }


//____________________________________ Not used yet
        /*
         * Getting current video for the student that he/she has to watch 
         */
        public function getCurrent6DVideoForUser($stid){
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            /*
             * first of all we check if some video (but it can be only the last video)
             * was paused by the teacher
             * if its true we should render this paused video
             */
             $sql = "SELECT * FROM video__6d_status, video__6d
                    WHERE video__6d_status.v6ds_video_id = video__6d.v6d_id
                    AND v6ds_paused='Yes' AND v6ds_user_id=? ORDER BY v6ds_video_id DESC";
             $res = $db->fetchAll($sql,$stid);
             if ($res) return $res[0]['v6ds_id'];
        }
//__________________________________________

        
        /*
         * Getting all videos, posted to the student by the teacher through Kaltura-player
         */
        public function postKalturaVideoForUser($userId,$teacherId,$code){
            
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $data = array(
               'vam_id' => null,
              'vam_video_player1' => stripslashes($code),
              'vam_video_player2' => null,
              'vam_teacher_id' => $teacherId,
              'vam_user_id' => $userId,
              'vam_is_payed' => 'No',
              'vam_playing_duration' => 0,
            );
            $db->insert('video__all_movies', $data);
            return $data;
        }

        /*
         * posting the YouTubeVideo for the student
         */

        public function postYouTubeVideoForUser($userId,$teacherId,$code){

            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $data = array(
              'vam_id' => null,
              'vam_video_player1' => null,
              'vam_video_player2' => stripslashes($code),
              'vam_teacher_id' => $teacherId,
              'vam_user_id' => $userId,
              'vam_is_payed' => 'No',
              'vam_playing_duration' => 0,
            );
            $db->insert('video__all_movies', $data);
            return $data;
        }

        /*
         * the student subscribes for the 6d video course
         * after that the teacher gets alert about this
         */
        public function subscribeFor6DCourse($userId){
            
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $select = $db->select()
                    ->from('system__alerts')
                     ->where("sa_student_id=$userId")
                    ->where("sa_alert_type_id=3");
            $stmp = $select->query();
            $res = $stmp->fetchAll();
            if ($res) return;
            
            $data = array(
              'sa_id' => null,
              'sa_student_id' => $userId,
              'sa_teacher_id' => null,
              'sa_alert_type_id' => 3,
            );
            $db->insert('system__alerts', $data);
            return $data;
        }

        /*
         * activating the 6d course for the student
         */
        public function activate6DCourse($userId){

            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $currentVideo = $this->getCurrent6DVideoForUser($userId);
            $select = $db->select()
                    ->from('video__6d_status')
                     ->where("v6ds_user_id=$userId");
            $stmp = $select->query();
            $res = $stmp->fetchAll();
            if ($res) { //course was already launched but paused by the teacher
                 $data = array(
                    'v6ds_paused' => 'No',
                    'v6ds_timestamp' => date('y-m-d H:i:s'),
                    );
                 $db->update('video__6d_status', $data,"v6ds_id=$currentVideo");
                 return;
            }
            //else we should launch the course with the first one video
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $data = array(
              'v6ds_id' => null,
              'v6ds_video_id' => 1,
              'v6ds_user_id' => $userId,
              'v6ds_teacher_id' => 1,
              'v6ds_viewed' => 'No',
            );
            $db->insert('video__6d_status', $data);
            return $data;
        }

        /*
         * pause the 6d course
         */
        public function pause6dCourse($userId){

            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $select = $db->select()
                     ->from('video__6d_status')
                     ->where("v6ds_user_id=$userId")
                     ->order('v6ds_video_id DESC');
            $stmp = $select->query();
            $res = $stmp->fetchAll();
            $videoId = $res[0]['v6ds_id'];
            $data = array(
            'v6ds_paused' => 'Yes'
           );
            $db->update('video__6d_status', $data,"v6ds_id=$videoId");
        }


        /*
         * changing the flag in the video table if student has  completely viewed the video
         * now the student can watch another one video
         */
        public function set6dVideoFlag($videoId){
            
           $db = Zend_Db_Table_Abstract::getDefaultAdapter();
           $data = array(
            'v6ds_viewed' => 'Yes'
           );
           $db->update('video__6d_status', $data,"v6ds_id=$videoId");
        }

        /*
         * sending the video to the student
         *
         */
        public function send6dVideoToStudent($userId){
            
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();

            /*
             * check if 6 was activated
             */
            $sql = "SELECT * FROM  video__6d_status
                    WHERE v6ds_user_id=?";
             $res = $db->fetchAll($sql,$userId);
             if (!$res) return "6D wasnt activated";

            /*
             * first of all we check if some video (but it can be only the last video)
             * was paused by the teacher
             * if its true we cant't send another one video
             */
             $sql = "SELECT * FROM video__6d_status
                    WHERE v6ds_paused='Yes' AND v6ds_user_id=? ORDER BY v6ds_video_id DESC";
             $res = $db->fetchAll($sql,$userId);
             if ($res) return "VIDEO PAUSED!";

             /*
              *check if all student's videoz were viewed
              */
             $sql = "SELECT * FROM video__6d_status
                    WHERE v6ds_viewed='No' AND v6ds_user_id=?";
             $res = $db->fetchAll($sql,$userId);
             if ($res) return "VIDEO WASNT VIEWED!";

             /*
              * after that we check if 16 hours went by
              */
            $currentTime = time();
            $difference = 20;
            $pastTime = $currentTime - $difference;
            $currentTime = date('y-m-d H:i:s',$currentTime);
            $pastTime = date('y-m-d H:i:s',$pastTime);
             $sql = "SELECT * FROM video__6d_status
                    WHERE v6ds_timestamp BETWEEN ? AND ? AND v6ds_user_id=? ORDER BY v6ds_video_id DESC";
             $res = $db->fetchAll($sql,array($pastTime,$currentTime,$userId));
             if ($res) return "TIME DIDNT GO BY!";
             

            //defining the number of the current video and incrementing it
            //if this number more than 6 (max videos in the course) returning
            $select = $db->select()
                     ->from('video__6d_status')
                     ->where("v6ds_user_id=$userId")
                     ->order('v6ds_video_id DESC');
            $stmp = $select->query();
            $res = $stmp->fetchAll();
            $currentVideo = $res[0]['v6ds_video_id']+1;
            if ($currentVideo>6) return "Uve finished the course"; //no more videos left

            //else we can show the next video to the student
            $data = array(
              'v6ds_id' => null,
              'v6ds_video_id' => $currentVideo,
              'v6ds_user_id' => $userId,
              'v6ds_teacher_id' => 1,
              'v6ds_viewed' => 'No',
            );
            $res = $db->insert('video__6d_status', $data);
            return "INSERTED!";
          }



        /*
         * getting all alerts from the student and showing them on the teacher's page
         */
        public function getStudentAlerts($stid){

            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $sql = 'SELECT * FROM system__alerts, system__alert_type
                    WHERE system__alerts.sa_alert_type_id  = system__alert_type.sat_id
                    AND sa_student_id=?';
            $res = $db->fetchAll($sql,$stid);
            return $res;
        }
}