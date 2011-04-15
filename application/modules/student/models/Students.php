<?php

define('DIFFERENCE', 20);

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
         * Getting number of unread messages of the student
         */
        public function getNumberUnreadMesagesStudent($id){
             $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $sql = "SELECT count(*) q FROM privat_messages
                    WHERE spm_is_new=0 AND spm_to_user_id=?";
             $res = $db->fetchAll($sql,$id);
             if ($res) return $res[0]['q'];
                else return 0;
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

            $date_elements  = explode("/",$data['datepicker']);
            $data['datepicker'] = $date_elements[2]."-".$date_elements[1]."-".$date_elements[0];
            $userdata = array(
              'u_name' => $data['firstname'],
              'u_family_name' => $data['lastname'],
              'u_email' => $data['email'],
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

            if(isset ($data['sex'])) $userdata['u_sex_id']=$data['sex'];

            if ($data['password1']){
                $userdata['u_password'] = $data['password1'];
            }

            $userhealthdata = array(
               'uht_pregnant' => $data['pregnant'],
               'uht_weight' => $data['weight'],
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
            if(isset ($data['backashes'])) $userhealthdata['uht_backashes']=$data['backashes'];
            if(isset ($data['disc'])) $userhealthdata['uht_slipped_disk']=$data['disc'];

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


        /*
         * Getting current paused video for the student that he/she has to watch
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

        /*
         * checks if 6D isn't started (0), is started(1), over (2) or paused by the teacher(-1)
         */
        public function check6DStatus($stid){
            
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();            
            $sql = "SELECT * FROM video__6d_status
                    WHERE v6ds_paused='Yes' AND v6ds_user_id=?";
             $res = $db->fetchAll($sql,$stid);
             if ($res) return -1;//the course was paused
             $sql = "SELECT * FROM video__6d_status
                    WHERE v6ds_video_id=6 AND v6ds_viewed='Yes' AND v6ds_user_id=?";
             $res = $db->fetchAll($sql,$stid);
             if ($res) return 2; //the course was finished
             $sql = "SELECT * FROM video__6d_status
                    WHERE v6ds_user_id=?";
             $res = $db->fetchAll($sql,$stid);
             if ($res) return 1;//the course was started
             else  return 0; //is not started
        }

        /*
         * Getting the last video viewed by the student
         * This ID of this video will be used for sending feedback to the teacher
         */
        public function getLastFirstPlayerVideo($stid){
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $sql = "SELECT v6ds_video_id, v6ds_timestamp FROM  video__6d_status
                    WHERE v6ds_viewed='Yes' AND v6ds_user_id=?
                    ORDER BY v6ds_timestamp DESC LIMIT 1";
            $res1 = $db->fetchAll($sql,$stid);
            $sql = "SELECT vam_video_player1, vam_timestamp FROM  video__all_movies
                    WHERE vam_is_payed='Yes' AND vam_video_player2 IS NULL AND vam_user_id=?
                    ORDER BY vam_timestamp DESC LIMIT 1";
            $res2 = $db->fetchAll($sql,$stid);
            if($res1[0]['v6ds_timestamp']>$res2[0]['vam_timestamp']) return $res1[0]['v6ds_video_id'];
                else return $res2[0]['vam_video_player1'];
        }


        /*
         * Getting all videos, posted to the student by the teacher through Kaltura-player
         */
        public function postKalturaVideoForUser($userId,$teacherId,$code){
            
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $code = trim($code);
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
            $code = trim($code);
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

            //sending an internal and an external emails to the student
            $mailExchange = new Student_Model_MailExchange();
            $text = "";
            $text .= "שלום רב,";
            $text .= "<br/><br/>";
            $text .= 'אנו שמחים להודיעך שקורס ששת המפגשים נפתח בעבורך במרכז הלמידה של "טיפולית ';
            $text .= "<br/>";
            $text .= "אונליין\". אורך כל תרגול הוא כ – 20 דק'  למשך שישה שיעורים. הקורס בנוי בהדרגה וכל ";
            $text .= "<br/>";
            $text .= "שיעור מתבסס על שיעור קודם.";
            $text .= "<br/><br/>";
            $text .= "צפו בסרטון ההדרכה ותרגלו את כולו, כך יחכה לכם התרגול הבא יום למחרת. להשגת מירב ";
            $text .= "<br/>";
            $text .= "היעילות, תרגלו את הקורס במשך <b>6 ימים רצופים – יום אחרי יום </b>אם ניתן. בכל פעם ";
            $text .= "<br/>";
            $text .= "תשלח אליכם במייל הודעה. ";
            $text .= "<br/><br/>";
            $text .= "לפני שאתם מתחילים לתרגל <b>עליכם לצפות בסרטון בנגן המדיה התחתון </b>במרכז הלמידה";
            $text .= "<br/>";
            $text .= "שם מחכה לכם סרטון הדרכה על הנחיות לתרגול בבית. אז תוכלו לקבוע את הסביבה והזמן ";
            $text .= "<br/>";
            $text .= "הנוחים לכם ולהכין אתכם לתרגול בבית.";
            $text .= "<br/><br/>";
            $text .= "<a href='http://lc.tipulitonline.co.il/'>כניסה למרכז הלמידה</a>";
            $text .= "<br/><br/>";
            $text .= "לידיעתכם:";
            $text .= "<br/>";
            $text .= "1 השתתפות בקורס היא בהסכמה לתקנון עליו הסכמתם עם הרישום למרכז הלמידה.";
            $text .= "<br/>";
            $text .= "2 במידה והתרגול גורם לכם לכאב, הפסיקו לתרגל את התרגול המסוים. תרגלו רק מה ";
            $text .= "<br/>";
            $text .= "שנוח לכם. בצעו את ההרפיה הסופית <b>ובסיום התרגול פנו אלינו</b>. נסייע לכם להתאים";
            $text .= "<br/>";
            $text .= "תרגול עבורכם.";
            $text .= "<br/>";
            $text .= "3 אם חשתם שהקורס קל מדי או קשה מדי, תנו לנו משוב באמצעות מרכז הלמידה ונשמח ";
            $text .= "להתאים לכם תרגול אישי מותאם לצרכיכם.";
            $text .= "<br/><br/>";
            $text .= "בברכת שלום,";
            $text .= "<br/><br/>";
            $text .= "<br/>";
            $text .= "צוות טיפולית אולניין";
            $text .= "<br/>";
            $text .= "<a href='http://lc.tipulitonline.co.il/'>www.tipulitonline.co.il</a>";
            $text .= "<br/>";
            //$mailExchange->sendMessageFromTeacherToStudent($userId, 1, 'קורס נפתח עבורך – שנה את חייך ב – 20 דק', $text);
            //$mailExchange->sendExternalMailToStudent($userId, 'קורס נפתח עבורך – שנה את חייך ב – 20 דק', $text);

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
         * changing the flag in the video table if student has  completely viewed the 6d-video
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
         * The same as for set6dVideoFlag but for not 6d videos
         */
        public function setVideoFlag($videoId){

           $db = Zend_Db_Table_Abstract::getDefaultAdapter();
           $data = array(
            'vam_is_payed' => 'Yes'
           );
           $db->update('video__all_movies', $data,"vam_id=$videoId");
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
            $pastTime = $currentTime - DIFFERENCE;
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
           * Defining students who should get an internal and an external mail about next video
           */
          public function sendMassMailsToAllStudents(){
            
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $pastTime = time() - DIFFERENCE;
            $sql = "SELECT * FROM video__6d_status WHERE v6ds_notified='No'";
            $res = $db->fetchAll($sql);
            $mailExchange = new Student_Model_MailExchange();
             foreach ($res as $k => $v) {
                $pastTime = time() - DIFFERENCE;
                if ($pastTime<strtotime($v['v6ds_timestamp'])) continue;//time didn't go by
                if (($v['v6ds_paused']=='Yes')||($v['v6ds_viewed']=='No')) continue;//wasnt viewed or was paused
                $currentVideo = $v['v6ds_video_id'];//current video number of the course
                $nextVideo = $currentVideo+1;
                if ($currentVideo>5) continue;
                //sending an internal and an external emails to students

                if ($currentVideo==1){
                    $subject = "תרגול מס' 2 מוכן בשבילך";
                    $text = "";
                    $text .= "שלום רב,";
                    $text .= "<br/><br/>";
                    $text .= "לאחר שצפית ותרגלת את השיעור הראשון אנו פונים לתרגול השני. כפי שראית, התרגול";
                    $text .= "<br/>";
                    $text .= "שניתן לך הוא רך ומעמיק. זהו קורס ריפוי עצמי, המשפר איכות החיים ומעודד רגיעה. זהו ";
                    $text .= "<br/>";
                    $text .= "קורס נפלא לפתוח איתו את היום ואנו ממליצים לפנות זמן ולתרגל אותו <b>בבוקר</b>";
                    $text .= "<br/><br/>";
                    $text .= "אנו מזכירים להודיע לנו על כל קושי או כאב המופיעים בזמן התרגול. <b>התרגול אינו אמור </b>";
                    $text .= "<br/>";
                    $text .= "<b>לגרום לכאב אבל עשוי לעורר מאמץ של עבודה עם הגוף</b>– להבדיל בין כאב למאמץ נכון  ";
                    $text .= "<br/>";
                    $text .= "זוהי אחת מהתובנות שמתרגל יוגה לומד בעצמו. במידה וקיים קושי להבדיל ביניהם, פנו ";
                    $text .= "<br/>";
                    $text .= "<br/><br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>כניסה למרכז הלמידה</a>";
                    $text .= "<br/><br/>";
                    $text .= "בברכת שלום,";
                    $text .= "<br/><br/>";
                    $text .= "<br/>";
                    $text .= "צוות טיפולית אולניין";
                    $text .= "<br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>www.tipulitonline.co.il</a>";
                    $text .= "<br/>";

                } elseif($currentVideo==2){
                    $subject = "תרגול מס' 3 מוכן בשבילך";
                    $text = "";
                    $text .= "שלום לך,";
                    $text .= "<br/><br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>כניסה למרכז הלמידה</a>";
                    $text .= "<br/><br/>";
                    $text .= 'היום נשים לב לקשר שבין תנועה לנשימה. היום גם נכיר את תנוחה בשם "כלב מסתכל ';
                    $text .= "<br/>";
                    $text .= 'למטה". זוהי תנוחת מפתח ביוגה המחזקת ומגמישה את כל הגוף. מתרגלים אותה מתחילים ';
                    $text .= "<br/>";
                    $text .= "ומתקדמים כאחד.";
                    $text .= "<br/><br/>";
                    $text .= "<b>אנו מזכירים לכם להודיע לנו על כל קושי או כאב שחשים בזמן התרגול. </b>";
                    $text .= "<br/><br/>";
                    $text .= "במרכז הלמידה שלנו יש גם תרגלי נשימה, שליטה אנרגטית (פראניאמה) והרפיה בצפייה ";
                    $text .= "<br/>";
                    $text .= "חופשית ללא תשלום. כמו כן יש מידע אודות עקרונות היוגה ושילובה בחיים. אפשר ומומלץ ";
                    $text .= "<br/>";
                    $text .= "לתרגל תרגולים אלה במקביל לקורס.";
                    $text .= "<br/><br/>";
                    $text .= "בברכת שלום,";
                    $text .= "<br/><br/>";
                    $text .= "<br/>";
                    $text .= "צוות טיפולית אולניין";
                    $text .= "<br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>www.tipulitonline.co.il</a>";
                    $text .= "<br/>";
                } elseif($currentVideo==3){
                    $subject = "תרגול מס' 4 מוכן בשבילך";
                    $text = "";
                    $text .= "הקורס נבנה שלב אחרי שלב על מנת לשפר תחושה טובה בגוף, להרפות מקומות בהם ";
                    $text .= "<br/>";
                    $text .= "הצטבר מתח ולהניע אנרגיית חיים (פראנה – Prana) לאורך הגוף. היוגה ייחודית בכך שהיא ";
                    $text .= "<br/>";
                    $text .= "מלווה עקרונות של מודעות, נשימה נכונה וריכוז יחד עם תנועות ותנוחות המרגיעות ";
                    $text .= "<br/>";
                    $text .= "ומרפאות.";
                    $text .= "<br/><br/>";
                    $text .= "<b>אם הגעת עד הלום, עשה/י מאמץ להשלים את הקורס עד סופו.</b>אפשר להרגיש בשינוי ";
                    $text .= "<br/>";
                    $text .= "המצטבר יום אחרי יום.";
                    $text .= "<br/><br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>כניסה למרכז הלמידה</a>";
                    $text .= "<br/><br/>";
                    $text .= "בברכת שלום,";
                    $text .= "<br/><br/>";
                    $text .= "<br/>";
                    $text .= "צוות טיפולית אולניין";
                    $text .= "<br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>www.tipulitonline.co.il</a>";
                    $text .= "<br/>";
                } elseif($currentVideo==4){
                    $subject = "תרגול מס' 5 מוכן בשבילך";
                    $text = "";
                    $text .= "אם תרגלת יום אחרי יום השינוי כבר מתרחש. הגוף מגיב טוב כאשר מטפלים בו במסירות ";
                    $text .= "<br/>";
                    $text .= "ובעדינות. תרגול הקורס הפעם מגיע להעמקה גדלה יותר בתנועות אפקטיביות הפותחות את ";
                    $text .= "<br/>";
                    $text .= "בית החזה ומשפרות את הקשר שבין האגן לרגליים. אלו הם שני החלקים המשמעותיים ";
                    $text .= "<br/>";
                    $text .= "ביותר לתנועה שלנו במרחב. נתרגל היום במסירות ובהעמקה. ננשום עם התנועות ונהיה ";
                    $text .= "<br/>";
                    $text .= "קשובים למצב הגוף.";
                    $text .= "<br/><br/>";
                    $text .= "<b>אם הגעת עד הלום, עשה מאמץ והשלם את הקורס.</b>אפשר להרגיש בשינוי אם הוא ";
                    $text .= "<br/>";
                    $text .= "מצטבר יום אחרי יום.";
                    $text .= "<br/><br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>כניסה למרכז הלמידה</a>";
                    $text .= "<br/><br/>";
                    $text .= "<br/>";
                    $text .= "צוות טיפולית אולניין";
                    $text .= "<br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>www.tipulitonline.co.il</a>";
                    $text .= "<br/>";
                } elseif($currentVideo==5){
                    $subject = "תרגול מס' 6 מוכן בשבילך";
                    $text = "זהו התרגול המסכם של הקורס. אנו מברכים אותך שהגעת לשלב זה. אם תרגלת יום אחרי ";
                    $text .= "יום, צברת תרגול מצטבר והרגלת את עצמך להקדיש זמן ליוגה. זהו אינו דבר של מה-בכך.";
                    $text .= "<br/><br/>";
                    $text .= "מרכז הלמידה שלנו יאפשר לך להמשיך להעמיק ביוגה וליצוק תרגול מתקדם יותר לזמן";
                    $text .= "<br/>";
                    $text .= "שפינית במהלך היום. גופך יודה לך ואיכות חייך תמשיך להשתפר. אין כמו היוגה לתחזוקת";
                    $text .= "<br/>";
                    $text .= "גוף שוטפת ולהכינו לאתגרי החיים.";
                    $text .= "<br/><br/>";
                    $text .= "<b>נשמח לשמוע ממך איך היה הקורס, חוויות שעברת, המלצות ובקשות.</b>";
                    $text .= "<br/>";
                    $text .= "אנו עומדים לשירותך להמשך התרגול שלך במרכז הלמידה. את/ה מוזמן/ת לבחור חבילת";
                    $text .= "<br/>";
                    $text .= "תרגול המתאימה לצרכיך במרכז הלמידה ולהמשיך לתרגל עימנו.";
                    $text .= "<br/><br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>כניסה למרכז הלמידה</a>";
                    $text .= "<br/><br/>";
                    $text .= "<br/>";
                    $text .= "צוות טיפולית אולניין";
                    $text .= "<br/>";
                    $text .= "<a href='http://lc.tipulitonline.co.il/'>www.tipulitonline.co.il</a>";
                    $text .= "<br/>";

                }
                

                $mailExchange->sendMessageFromTeacherToStudent($v['v6ds_user_id'], 1, $subject, $text);
                $mailExchange->sendExternalMailToStudent($v['v6ds_user_id'], $subject, $text);
                //updating the table
                $data = array(
                    'v6ds_timestamp' => $v['v6ds_timestamp'],
                    'v6ds_notified' => 'Yes',
                );
                $videoId = $v['v6ds_id'];
                $db->update('video__6d_status', $data,"v6ds_id =$videoId");
             }
          }//end massmailfunc

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

        /*
         * Getting all students in the DB
         */
        public function getAllStudents($page=1,$entriesPerPage=10){
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();

            if ($page==0) $page=1;
            $offset = intval(($page-1)*$entriesPerPage);
            $records = $entriesPerPage;
            $sql = "SELECT * FROM users ORDER BY u_lastactivity DESC
                    LIMIT $offset,$entriesPerPage";
            $res = $db->fetchAll($sql);
            return $res;
        }

        /*
         * Getting only students which are currently online according to time difference (in seconds)
         * Returning the array of student's IDs
         */
        public function getAllOnlineStudents($timeDifference=60){
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $currentTime = time();
            $pastTime = time() - $timeDifference;
            $sql = 'SELECT * FROM users';
            $res = $db->fetchAll($sql);
            $onlineStudents = array();
            foreach ($res as $k=>$v){
                if (strtotime($v['u_lastactivity'])>$pastTime) $onlineStudents[] = $v['u_id'];
            }
            return $onlineStudents;
        }

        /*
         * checking if the student is online
         */

        public function checkIfStudentOnline($stid, $timeDifference=60){

            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $currentTime = time();
            $pastTime = time() - $timeDifference;
            $select = $db->select()
                    ->from('users')
                     ->where("u_id=$stid");
            $stmp = $select->query();
            $res = $stmp->fetchAll();
            if (strtotime($v['u_lastactivity'])>$pastTime) return $res[0];//returning students data if he is online at the moment
                else return false;
        }


        /*
         * Getting all online teachers. if noone is online returning autoresponder
         */
        public function getAllOnlineTeachers($timeDifference=0){
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $currentTime = time();
            $pastTime = time() - $timeDifference;
            $sql = 'SELECT * FROM teachers';
            $res = $db->fetchAll($sql);
            $onlineTeachers = array();
            foreach ($res as $k=>$v){
                if (strtotime($v['t_lastactivity'])>$pastTime) $onlineTeachers[] = $v['t_id'];
            }
            if ($onlineTeachers) return $onlineTeachers;
                else return false;
        }



        public function getNumberOfPages($entriesPerPage=10){
            
            $db = Zend_Db_Table_Abstract::getDefaultAdapter();
            $sql = 'SELECT count(u_id) q FROM users';
            $res = $db->fetchAll($sql);
            $q = $res[0]['q'];
            $numPages = ceil($q/$entriesPerPage);
            return $numPages;
            }
}