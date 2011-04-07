<?php

class User_Model_UserHealthTable extends Zend_Db_Table_Abstract{

   protected $_name = 'user__health_table';

    public function addAdditionalData($userId, $data){

         $db = Zend_Db_Table_Abstract::getDefaultAdapter();

         $userdata = array(
              'uht_user_id' => $userId,
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
           return $db->update($this->_name, $userdata, "uht_user_id=".intval($userId));
    }
}

