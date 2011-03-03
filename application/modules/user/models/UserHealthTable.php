<?php

class User_Model_UserHealthTable extends Zend_Db_Table_Abstract{

   protected $_name = 'user__health_table';

    public function addAdditionalData($userId, $values){

         $db = Zend_Db_Table_Abstract::getDefaultAdapter();

         $stmp = $db->query("SELECT uht_user_id FROM user__health_table");
         $row = $stmp->fetchAll();
         if ($row[0]['uht_user_id']==$userId) return;
        
         $userdata = array(
             'uht_id' => null,
             'uht_user_id' => $userId,
             'uht_height' => $values['height'],
             'uht_bmi' => $values['bmi'],
             'uht_pregnant' => $values['pregnant'],
             'uht_walk' => $values['walk'],
             'uht_sit' => $values['sit'],
             'uht_hands' => $values['hands'],
             'uht_slipped_disk' => $values['slippeddisk'],
             'uht_ankles_and_feet' => $values['anklesandfeet'],
             'uht_knees' => $values['knees'],
             'uht_thighs_or_pelvis' => $values['thighsorpelvis'],
             'uht_lower_back' => $values['lowerback'],
             'uht_upper_back' => $values['upperback'],
             'uht_neck_and_shoulders' => $values['neckandshoulders'],
             'uht_head' => $values['head'],
             'uht_other_pain_body' => $values['otherpain'],
             'uht_depression_or_anxiety' => $values['depression'],
             'uht_heart_or_pb' => $values['heartorpb'],
             'uht_injury' => $values['injury'],
             'uht_injury_text' => $values['injurytext'],
             'uht_epilepsy' => $values['epilepsy'],
             'uht_cancer' => $values['cancer'],
             'uht_diabetes' => $values['diabetes'],
             'uht_asthma' => $values['asthma'],
             'uht_Artritis' => $values['artritis'],
             'uht_hernia' => $values['hernia'],
             'uht_medication' => $values['medication'],
             'uht_other_conditions' => $values['otherconditions'],
         );
           return $db->insert($this->_name, $userdata);
    }
}

