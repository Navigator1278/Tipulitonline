<?php

class Student_Form_StudentEditDataForm {

    /*
     *  creates new form based on 2 DB-tables and
     * prepopulates it with $data-values
     * if $protection is set (=1 or true) some field will be disabled
     */


    public function getForm($data, $protection=0){

    $elementDecorators = array(
        array('Label'),
         array('ViewHelper'),
        array('Errors'),
    );
        
        $form = new Zend_Form();
        $form->setAction('/user/registration/first-form/')
                ->setMethod('post');

        //firstname field
        $firstName = new Zend_Form_Element_Text('firstname', array(
            'maxLength' => '30',
            'id' => 'name',
            'validators' => array(
                                array('stringLength', false, array(3,100)),
                                array('Alpha'),
                                ),
       ));
         if (isset ($data['u_name'])) $firstName->setValue($data['u_name']);
         if ($protection) $firstName->setAttrib('readonly', 'true');
        $firstName->setDecorators($elementDecorators);

        //lastname field
        $lastName = new Zend_Form_Element_Text('lastname', array(
            'maxLength' => '30',
            'id' => 'lname',
            'validators' => array(
                                array('stringLength', false, array(3,100)),
                                array('Alpha'),
                                ),
       ));
         $lastName->setDecorators($elementDecorators);
         if (isset ($data['u_family_name'])) $lastName->setValue($data['u_family_name']);
         if ($protection) $lastName->setAttrib ('readonly', 'true');

        //selecting gender: Male (1) or Female (0)
        $gender = new Zend_Form_Element_Radio('sex', array(
           'separator' =>'',
           'multiOptions' => array('1'=>'זכר ','0'=>'נקבה'),
        ));
        $gender->setDecorators($elementDecorators);
        $gender->setValue($data['u_sex_id']);
         if (isset ($data['u_sex_id'])) $gender->setValue($data['u_sex_id']);
         if ($protection) $gender->setAttrib ('readonly', 'true');

        //birthday field: validation for yyyy-mm-dd input
        $birthday = new Zend_Form_Element_Text('datepicker', array(
            'size' => 10,
        ));
        $birthday->setDecorators($elementDecorators);
        $birthday->addValidator(new Zend_Validate_Date());
        if (isset ($data['u_date_of_birth'])) $birthday->setValue($data['u_date_of_birth']);
        if ($protection) $birthday->setAttrib ('readonly', 'true');

        //heigth
        $heigth = new Zend_Form_Element_Select('heigth', array());
        for ($i=120;$i<=300;$i++) $heigth->addMultiOption($i,$i);
        $heigth->setDecorators($elementDecorators);
        if (isset ($data['uht_height'])) $heigth->setValue($data['uht_height']);
        if ($protection) $heigth->setAttrib ('readonly', 'true');

        //weight
        $weight = new Zend_Form_Element_Select('weight', array(
            'label' => 'שקל',
          ));
        for ($i=20;$i<=300;$i++) $weight->addMultiOption($i,$i);
        $weight->setDecorators($elementDecorators);
        if (isset ($data['uht_weight'])) $weight->setValue($data['uht_weight']);

        //email field with validation
        $email = new Zend_Form_Element_Text('email',array(
        ));
        $email->addValidator(new Zend_Validate_EmailAddress());

        if (!$protection){
        $email->addValidator(new Zend_Validate_Db_NoRecordExists(array(
                'table'=>'users','field'=>'u_email')));
        }
        $email->setDecorators($elementDecorators);
        if (isset ($data['u_email'])) $email->setValue($data['u_email']);
        if ($protection) $email->setAttrib ('readonly', 'true');
        
        // password field
        $password1 = new Zend_Form_Element_Password('password1', array(
            'id' => 'pass',
        ));
        $password1->setDecorators($elementDecorators);

        // password confirmation field
        $password2 = new Zend_Form_Element_Password('password2', array(
            'id' => 'c_pass',
        ));
        $password2->addValidator(new User_Form_UserFirstFormPasswordValidator('password1'));
        $password2->setDecorators($elementDecorators);

        $state = new Zend_Form_Element_Select('state', array(
            'requred' => true,
        ));
        $state->setMultiOptions(array(
            '1' => 'מדינה:',
        ));
        $state->setDecorators($elementDecorators);
        if (isset ($data['u_state'])) $state->setValue($data['u_state']);

        $address = new Zend_Form_Element_Text('address', array(
            'required' => false,
            'id' => 'full_adr',
        ));
        $address->setDecorators($elementDecorators);
        if (isset ($data['u_address'])) $address->setValue($data['u_address']);

        $pregnant = new Zend_Form_Element_Radio('pregnant', array(
            'separator' =>'',
            'multioptions' => array('Yes'=>'Yes','No'=>'No'),
        ));
        $pregnant->setDecorators($elementDecorators);
        if (($data['uht_pregnant'])) $pregnant->setValue($data['uht_pregnant']);
        
        
        $pregnantSince = new Zend_Form_Element_Select('pregnantsince', array(
            'id' => 'hz1',
            ));
        $pregnantSince->setMultiOptions(array(
            '1' => '1',
            '2' => '2',
            '3' => '3',
            '4' => '4',
            '5' => '5',
            '6' => '6',
            '7' => '7',
            '8' => '8',
            '9' => '9',
        ));
        $pregnantSince->setDecorators($elementDecorators);
        if (($data['uht_pregnant'])) $pregnant->setValue($data['uht_pregnant']);
        if (($data['uht_pregnant_since'])) $pregnantSince->setValue($data['uht_pregnant_since']);

        $objectives = new Zend_Form_Element_Textarea('objectives', array(
            'id' =>   'obj',
            'rows' => '20',
            'cols' => '20',
        ));
        if (($data['u_objectives'])) $objectives->setValue($data['u_objectives']);
        
        $terms = new Zend_Form_Element_Checkbox('terms', array(
            'required' => 'true,'
        ));

        $heartPressure = new Zend_Form_Element_Checkbox('heartpressure', array());
        $heartPressure->setDecorators($elementDecorators);
        if ($data['uht_heart_or_pb']) $heartPressure->setChecked(true);

        $diabetes = new Zend_Form_Element_Checkbox('diabetes', array());
        $diabetes->setDecorators($elementDecorators);
        if ($data['uht_diabetes']) $diabetes->setChecked(true);

        $migrene = new Zend_Form_Element_Checkbox('migrene', array());
        $migrene->setDecorators($elementDecorators);
        if ($data['uht_migrene']) $migrene->setChecked(true);

        $babies = new Zend_Form_Element_Checkbox('babies', array());
        $babies->setDecorators($elementDecorators);
        if ($data['uht_babies']) $babies->setChecked(true);

        $nosleep = new Zend_Form_Element_Checkbox('nosleep', array());
        $nosleep->setDecorators($elementDecorators);
        if ($data['uht_nosleep']) $nosleep->setChecked(true);
        
        $digestion = new Zend_Form_Element_Checkbox('digestion', array());
        $digestion->setDecorators($elementDecorators);
        if ($data['uht_digestion']) $digestion->setChecked(true);

        $menopause = new Zend_Form_Element_Checkbox('menopause', array());
        $menopause->setDecorators($elementDecorators);
        if ($data['uht_menopause']) $menopause->setChecked(true);

        $sclorosies = new Zend_Form_Element_Checkbox('sclorosies', array());
        $sclorosies->setDecorators($elementDecorators);
        if ($data['uht_sclorosies']) $sclorosies->setChecked(true);

        $epilepsy = new Zend_Form_Element_Checkbox('epilepsy', array());
        $epilepsy->setDecorators($elementDecorators);
        if ($data['uht_epilepsy']) $epilepsy->setChecked(true);

        $cancer = new Zend_Form_Element_Checkbox('cancer', array());
        $cancer->setDecorators($elementDecorators);
        if ($data['uht_cancer']) $cancer->setChecked(true);

        $asthma = new Zend_Form_Element_Checkbox('asthma', array());
        $asthma->setDecorators($elementDecorators);
        if ($data['uht_asthma']) $asthma->setChecked(true);

        $artritis = new Zend_Form_Element_Checkbox('artritis', array());
        $artritis->setDecorators($elementDecorators);
        if ($data['uht_Artritis']) $artritis->setChecked(true);

        $hernia = new Zend_Form_Element_Checkbox('hernia', array());
        $hernia->setDecorators($elementDecorators);
        if ($data['uht_hernia']) $hernia->setChecked(true);

        $depression = new Zend_Form_Element_Checkbox('depression', array());
        $depression->setDecorators($elementDecorators);
        if ($data['uht_depression_or_anxiety']) $depression->setChecked(true);

        $headaches = new Zend_Form_Element_Checkbox('headaches', array());
        $headaches->setDecorators($elementDecorators);
        if ($data['uht_headaches']) $headaches->setChecked(true);
        
        $fatigue = new Zend_Form_Element_Checkbox('fatigue', array());
        $fatigue->setDecorators($elementDecorators);
        if ($data['uht_fatigue']) $fatigue->setChecked(true);

        $injury = new Zend_Form_Element_Checkbox('injury', array());
        $injury->setDecorators($elementDecorators);
        if ($data['uht_injury']) $injury->setChecked(true);

        $injuryText = new Zend_Form_Element_Textarea('injurytext', array(
            'id' => 'obj',
            'rows' => '20',
            'cols' => '20',
        ));
        if (($data['uht_injury_text'])) $injuryText->setValue($data['uht_injury_text']);

        $medication = new Zend_Form_Element_Checkbox('medication', array());
        $medication->setDecorators($elementDecorators);
        if ($data['uht_medication']) $medication->setChecked(true);

        $medicationText = new Zend_Form_Element_Textarea('medicationtext', array(
            'id' => 'obj',
            'rows' => '20',
            'cols' => '20',
        ));
        if (($data['uht_which_medication'])) $medicationText->setValue($data['uht_which_medication']);

       $walk = new Zend_Form_Element_Radio('walk', array(
           'label' => '',
           'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       if ($data['uht_walk']) $walk->setValue($data['uht_walk']);
       $walk->setDecorators($elementDecorators);

       $hands = new Zend_Form_Element_Radio('hands', array(
           'label' => '',
            'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       if ($data['uht_hands']) $hands->setValue($data['uht_hands']);
       $hands->setDecorators($elementDecorators);

       $legs = new Zend_Form_Element_Radio('legs', array(
           'label' => '',
            'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       if ($data['uht_sit']) $legs->setValue($data['uht_sit']);
       $legs->setDecorators($elementDecorators);

       $backashes = new Zend_Form_Element_Radio('backashes', array(
           'label' => '',
           'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       if ($data['uht_backashes']) $backashes->setValue($data['uht_backashes']);
       $backashes->setDecorators($elementDecorators);

       $slippedDisk = new Zend_Form_Element_Radio('disc', array(
           'label' => '',
            'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       if ($data['uht_slipped_disk']) $slippedDisk->setValue($data['uht_slipped_disk']);
       $slippedDisk->setDecorators($elementDecorators);

        $generalQuestionsText1 = new Zend_Form_Element_Text('general1', array('id'=>'f_1'));
        $generalQuestionsText2 = new Zend_Form_Element_Text('general2', array('id'=>'f_2'));
        $generalQuestionsText3 = new Zend_Form_Element_Text('general3', array('id'=>'f_3'));
        $generalQuestionsText1->setDecorators($elementDecorators);
        $generalQuestionsText2->setDecorators($elementDecorators);
        $generalQuestionsText3->setDecorators($elementDecorators);
         if (isset ($data['uht_general1'])) $generalQuestionsText1->setValue($data['uht_general1']);
         if (isset ($data['uht_general2'])) $generalQuestionsText2->setValue($data['uht_general2']);
         if (isset ($data['uht_general3'])) $generalQuestionsText3->setValue($data['uht_general3']);

        $lowerback = new Zend_Form_Element_Checkbox('lowerback', array());
        $lowerback->setDecorators($elementDecorators);
        if ($data['uht_lower_back']) $lowerback->setChecked(true);

        $upperback = new Zend_Form_Element_Checkbox('upperback', array());
        $upperback->setDecorators($elementDecorators);
        if ($data['uht_upper_back']) $upperback->setChecked(true);

        $feet = new Zend_Form_Element_Checkbox('feet', array());
        $feet->setDecorators($elementDecorators);
        if ($data['uht_ankles_and_feet']) $feet->setChecked(true);

        $neck = new Zend_Form_Element_Checkbox('neck', array());
        $neck->setDecorators($elementDecorators);
        if ($data['uht_neck_and_shoulders']) $neck->setChecked(true);

        $breath = new Zend_Form_Element_Checkbox('breath', array());
        $breath->setDecorators($elementDecorators);
        if ($data['uht_breath']) $breath->setChecked(true);

        $pelvis = new Zend_Form_Element_Checkbox('pelvis', array());
        $pelvis->setDecorators($elementDecorators);
        if ($data['uht_thighs_or_pelvis']) $pelvis->setChecked(true);

        $knees = new Zend_Form_Element_Checkbox('knees', array());
        $knees->setDecorators($elementDecorators);
        if ($data['uht_thighs_or_pelvis']) $knees->setChecked(true);

        $wrists = new Zend_Form_Element_Checkbox('wrists', array());
        $wrists->setDecorators($elementDecorators);
        if ($data['uht_wrists']) $wrists->setChecked(true);

        $head = new Zend_Form_Element_Checkbox('head', array());
        $head->setDecorators($elementDecorators);
        if ($data['uht_head']) $head->setChecked(true);

        $ankles = new Zend_Form_Element_Checkbox('ankles', array());
        $ankles->setDecorators($elementDecorators);
        if ($data['uht_ankles']) $ankles->setChecked(true);

        $externalMails = new Zend_Form_Element_Checkbox('external', array());
        $externalMails->setDecorators($elementDecorators);
        if ($data['u_external_emails']) $externalMails->setChecked(true);

        $moreInfo = new Zend_Form_Element_Textarea('moreinfo', array(
            'id' => 'obj',
            'rows' => '20',
            'cols' => '20',
        ));
        if (($data['uht_more_info'])) $moreInfo->setValue($data['uht_more_info']);

        $form->addElements(array($firstName,$lastName,$gender,$birthday,$heigth,$weight,
                            $email,$password1,$password2,$state,$address,$pregnant,$pregnantSince,
                            $objectives,$terms,
                            $heartPressure,$diabetes,$migrene,$babies,$nosleep,
                            $digestion,$menopause,$sclorosies,$epilepsy,$cancer,$asthma,
                            $artritis,$hernia,$depression,$fatigue,$headaches,$injury,
                            $injuryText,$medication,$medicationText,
                            $walk,$hands,$legs,$backashes,$slippedDisk,
                            $generalQuestionsText1,$generalQuestionsText2,$generalQuestionsText3,
                            $lowerback,$upperback,$feet,$neck,$breath,$pelvis,$knees,
                            $wrists,$head,$ankles,$moreInfo,$externalMails
                            ));

         return $form;
    }
}