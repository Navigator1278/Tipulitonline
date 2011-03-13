<?php

class User_Model_UserHealthTable extends Zend_Db_Table_Abstract{

   protected $_name = 'user__health_table';

    public function addAdditionalData($userId, $values){

         $db = Zend_Db_Table_Abstract::getDefaultAdapter();

         $userdata = array(
             'uht_user_id' => $userId,
             'uht_other_pain_body' => $values['sufferinfo'],
             'uht_injury_text' => $values['medicationsinfo'],
             'uht_other_conditions' => $values['treatinfo'],
             'uht_walk' => $values['walk'],
             'uht_hands' => $values['hands'],
             'uht_sit' => $values['legs'],
             'uht_slipped_disk' => $values['disc'],
             'uht_backashes' => $values['backashes'],
             'uht_lower_back' => $values['lowerback'],
             'uht_upper_back' => $values['upperback'],
             'uht_neck_and_shoulders' => $values['shoulders'],
             'uht_ankles_and_feet' => $values['feet'],
             'uht_knees' => $values['knees'],
             'uht_thighs_or_pelvis' => $values['pelvis'],
             'uht_wrists' => $values['wrists'],
             'uht_head' => $values['head'],
             'uht_heart_or_pb' => $values['heart'],
             'uht_diabetes' => $values['diabities'],
             'uht_epilepsy' => $values['epilepsy'],
             'uht_depression_or_anxiety' => $values['dipression'],
             'uht_cancer' => $values['cancer'],
             'uht_asthma' => $values['asthma'],
             'uht_Artritis' => $values['artrities'],
             'uht_hernia' => $values['hernia'],
         );
           return $db->update($this->_name, $userdata, "uht_user_id=".intval($userId));
    }
}

