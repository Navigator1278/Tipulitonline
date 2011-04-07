<?php

class User_Form_UserSecondForm extends Zend_Form{

    public $elementDecorators = array(
        array('Label'),
        array('ViewHelper'),
        array('Errors'),
      //  array('HtmlTag', array('tag' => 'li'))
    );

    public $elementCheckboxes = array(
        array('Label'),
        array('ViewHelper'),
        array('Errors'),
    );
    
    public function init(){


        $elementDecorators = array(
        array('Label'),
         array('ViewHelper'),
        array('Errors'),

        );
        //setting  method and action of the form
        $this->setAction('')
               ->setMethod('post');

          $heartPressure = new Zend_Form_Element_Checkbox('heartpressure', array());
        $heartPressure->setDecorators($elementDecorators);

        $diabetes = new Zend_Form_Element_Checkbox('diabetes', array());
        $diabetes->setDecorators($elementDecorators);

        $migrene = new Zend_Form_Element_Checkbox('migrene', array());
        $migrene->setDecorators($elementDecorators);

        $babies = new Zend_Form_Element_Checkbox('babies', array());
        $babies->setDecorators($elementDecorators);

        $nosleep = new Zend_Form_Element_Checkbox('nosleep', array());
        $nosleep->setDecorators($elementDecorators);

        $digestion = new Zend_Form_Element_Checkbox('digestion', array());
        $digestion->setDecorators($elementDecorators);

        $menopause = new Zend_Form_Element_Checkbox('menopause', array());
        $menopause->setDecorators($elementDecorators);

        $sclorosies = new Zend_Form_Element_Checkbox('sclorosies', array());
        $sclorosies->setDecorators($elementDecorators);

        $epilepsy = new Zend_Form_Element_Checkbox('epilepsy', array());
        $epilepsy->setDecorators($elementDecorators);

        $cancer = new Zend_Form_Element_Checkbox('cancer', array());
        $cancer->setDecorators($elementDecorators);

        $asthma = new Zend_Form_Element_Checkbox('asthma', array());
        $asthma->setDecorators($elementDecorators);

        $artritis = new Zend_Form_Element_Checkbox('artritis', array());
        $artritis->setDecorators($elementDecorators);

        $hernia = new Zend_Form_Element_Checkbox('hernia', array());
        $hernia->setDecorators($elementDecorators);

        $depression = new Zend_Form_Element_Checkbox('depression', array());
        $depression->setDecorators($elementDecorators);

        $headaches = new Zend_Form_Element_Checkbox('headaches', array());
        $headaches->setDecorators($elementDecorators);

        $fatigue = new Zend_Form_Element_Checkbox('fatigue', array());
        $fatigue->setDecorators($elementDecorators);

        $injury = new Zend_Form_Element_Checkbox('injury', array());
        $injury->setDecorators($elementDecorators);

        $injuryText = new Zend_Form_Element_Textarea('injurytext', array(
            'id' => 'obj',
            'rows' => '20',
            'cols' => '20',
        ));

        $medication = new Zend_Form_Element_Checkbox('medication', array());
        $medication->setDecorators($elementDecorators);

        $medicationText = new Zend_Form_Element_Textarea('medicationtext', array(
            'id' => 'obj',
            'rows' => '20',
            'cols' => '20',
        ));

       $walk = new Zend_Form_Element_Radio('walk', array(
           'label' => '',
           'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $walk->setDecorators($elementDecorators);

       $hands = new Zend_Form_Element_Radio('hands', array(
           'label' => '',
            'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $hands->setDecorators($elementDecorators);

       $legs = new Zend_Form_Element_Radio('legs', array(
           'label' => '',
            'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $legs->setDecorators($elementDecorators);

       $backashes = new Zend_Form_Element_Radio('backashes', array(
           'label' => '',
           'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $backashes->setDecorators($elementDecorators);

       $slippedDisk = new Zend_Form_Element_Radio('disc', array(
           'label' => '',
            'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $slippedDisk->setDecorators($elementDecorators);

        $generalQuestionsText1 = new Zend_Form_Element_Text('general1', array('id'=>'f_1'));
        $generalQuestionsText2 = new Zend_Form_Element_Text('general2', array('id'=>'f_2'));
        $generalQuestionsText3 = new Zend_Form_Element_Text('general3', array('id'=>'f_3'));
        $generalQuestionsText1->setDecorators($elementDecorators);
        $generalQuestionsText2->setDecorators($elementDecorators);
        $generalQuestionsText3->setDecorators($elementDecorators);

        $lowerback = new Zend_Form_Element_Checkbox('lowerback', array());
        $lowerback->setDecorators($elementDecorators);

        $upperback = new Zend_Form_Element_Checkbox('upperback', array());
        $upperback->setDecorators($elementDecorators);

        $feet = new Zend_Form_Element_Checkbox('feet', array());
        $feet->setDecorators($elementDecorators);

        $neck = new Zend_Form_Element_Checkbox('neck', array());
        $neck->setDecorators($elementDecorators);

        $breath = new Zend_Form_Element_Checkbox('breath', array());
        $breath->setDecorators($elementDecorators);

        $pelvis = new Zend_Form_Element_Checkbox('pelvis', array());
        $pelvis->setDecorators($elementDecorators);

        $knees = new Zend_Form_Element_Checkbox('knees', array());
        $knees->setDecorators($elementDecorators);

        $wrists = new Zend_Form_Element_Checkbox('wrists', array());
        $wrists->setDecorators($elementDecorators);

        $head = new Zend_Form_Element_Checkbox('head', array());
        $head->setDecorators($elementDecorators);

        $ankles = new Zend_Form_Element_Checkbox('ankles', array());
        $ankles->setDecorators($elementDecorators);

        $externalMails = new Zend_Form_Element_Checkbox('external', array());
        $externalMails->setDecorators($elementDecorators);

        $moreInfo = new Zend_Form_Element_Textarea('moreinfo', array(
            'id' => 'obj',
            'rows' => '20',
            'cols' => '20',
        ));
       $terms = new Zend_Form_Element_Checkbox('terms', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $terms->setDecorators($this->elementCheckboxes);
        $terms->addDecorator('Label',array('escape'=>false));
        $terms->addValidator(new User_Form_UserTermsConditionsValidator());
        $this->addElements(array($heartPressure,$diabetes,$migrene,$babies,$nosleep,
                            $digestion,$menopause,$sclorosies,$epilepsy,$cancer,$asthma,
                            $artritis,$hernia,$depression,$fatigue,$headaches,$injury,
                            $injuryText,$medication,$medicationText,
                            $walk,$hands,$legs,$backashes,$slippedDisk,
                            $generalQuestionsText1,$generalQuestionsText2,$generalQuestionsText3,
                            $lowerback,$upperback,$feet,$neck,$breath,$pelvis,$knees,
                            $wrists,$head,$ankles,$moreInfo,$externalMails,$terms
                            ));

    }
}
