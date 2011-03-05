<?php

class User_Form_UserSecondForm extends Zend_Form{

    public $elementDecorators = array(
        array('Label'),
        array('ViewHelper'),
        array('Errors'),
        array('HtmlTag', array('tag' => 'li'))
    );

    public $elementCheckboxes = array(
        array('Label'),
        array('ViewHelper'),
        array('Errors'),
    );
    
    public function init(){
        //setting  method and action of the form
        $this->setAction('')
               ->setMethod('post');

     $bmi = new Zend_Form_Element_Text('bmi', array(
            'required'=>false,
            'size' => 20,
            'label'   => 'BMI: ',
            'maxLength' => '5',
            'validators' => array(
                                array('Float'),
                                ),
       ));

     $sufferinfo = new Zend_Form_Element_Textarea('sufferinfo', array(
         'required' => false,
         'label' => 'Suffer info:',
         'rows' => 5,
         'cols' => 15,
     ));

     $medicationsinfo = new Zend_Form_Element_Textarea('medicationsinfo', array(
         'required' => false,
         'label' => 'Medications info:',
         'rows' => 5,
         'cols' => 15,
     ));

     $treatinfo = new Zend_Form_Element_Textarea('treatinfo', array(
         'required' => false,
         'label' => 'Treat info:',
         'rows' => 5,
         'cols' => 15,
     ));
// Radiobuttons ---------------------------------------------------//

       $walk = new Zend_Form_Element_Radio('walk', array(
           'label' => '',
           'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $walk->setDecorators($this->elementDecorators);

       $hands = new Zend_Form_Element_Radio('hands', array(
           'label' => '',
            'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $hands->setDecorators($this->elementDecorators);

       $legs = new Zend_Form_Element_Radio('legs', array(
           'label' => '',
            'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $legs->setDecorators($this->elementDecorators);
       
       $backashes = new Zend_Form_Element_Radio('backashes', array(
           'label' => '',
           'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $backashes->setDecorators($this->elementDecorators);

       $slippedDisk = new Zend_Form_Element_Radio('disc', array(
           'label' => '',
            'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
       $slippedDisk->setDecorators($this->elementDecorators);


//checkboxes at the right

        $lowerBack = new Zend_Form_Element_Checkbox('lowerback', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
         $lowerBack->setDecorators($this->elementCheckboxes);

        $upperBack = new Zend_Form_Element_Checkbox('upperback', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
         $upperBack->setDecorators($this->elementCheckboxes);

        $shoulders = new Zend_Form_Element_Checkbox('shoulders', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
         $shoulders->setDecorators($this->elementCheckboxes);

        $feet = new Zend_Form_Element_Checkbox('feet', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $feet->setDecorators($this->elementCheckboxes);

        $knees = new Zend_Form_Element_Checkbox('knees', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $knees->setDecorators($this->elementCheckboxes);

        $pelvis = new Zend_Form_Element_Checkbox('pelvis', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $pelvis->setDecorators($this->elementCheckboxes);

        $wrists = new Zend_Form_Element_Checkbox('wrists', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $wrists->setDecorators($this->elementCheckboxes);

        $ankles = new Zend_Form_Element_Checkbox('ankles', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $ankles->setDecorators($this->elementCheckboxes);

        $head = new Zend_Form_Element_Checkbox('head', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $head->setDecorators($this->elementCheckboxes);

        $mental = new Zend_Form_Element_Checkbox('mental', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $mental->setDecorators($this->elementCheckboxes);

//checkbox at the left

        $heart = new Zend_Form_Element_Checkbox('heart', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $heart->setDecorators($this->elementCheckboxes);

        $diabities = new Zend_Form_Element_Checkbox('diabities', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $diabities->setDecorators($this->elementCheckboxes);

        $migren = new Zend_Form_Element_Checkbox('migren', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $migren->setDecorators($this->elementCheckboxes);

        $babies = new Zend_Form_Element_Checkbox('babies', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $babies->setDecorators($this->elementCheckboxes);

        $sleep = new Zend_Form_Element_Checkbox('sleep', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $sleep->setDecorators($this->elementCheckboxes);
        
        $digestion = new Zend_Form_Element_Checkbox('digestion', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $digestion->setDecorators($this->elementCheckboxes);

        $menopause = new Zend_Form_Element_Checkbox('menopause', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $menopause->setDecorators($this->elementCheckboxes);
  
        $scorosies = new Zend_Form_Element_Checkbox('scorosies', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $scorosies->setDecorators($this->elementCheckboxes);

        $epilepsy = new Zend_Form_Element_Checkbox('epilepsy', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $epilepsy->setDecorators($this->elementCheckboxes);

        $cancer = new Zend_Form_Element_Checkbox('cancer', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $cancer->setDecorators($this->elementCheckboxes);

        $asthma = new Zend_Form_Element_Checkbox('asthma', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $asthma->setDecorators($this->elementCheckboxes);

        $artrities = new Zend_Form_Element_Checkbox('artrities', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $artrities->setDecorators($this->elementCheckboxes);

        $hernia = new Zend_Form_Element_Checkbox('hernia', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $hernia->setDecorators($this->elementCheckboxes);

        $dipression = new Zend_Form_Element_Checkbox('dipression', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $dipression->setDecorators($this->elementCheckboxes);

        $headaches = new Zend_Form_Element_Checkbox('headaches', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $headaches->setDecorators($this->elementCheckboxes);

        $fatigue = new Zend_Form_Element_Checkbox('fatigue', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $fatigue->setDecorators($this->elementCheckboxes);

        $accident = new Zend_Form_Element_Checkbox('accident', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $accident->setDecorators($this->elementCheckboxes);
// end

       $terms = new Zend_Form_Element_Checkbox('terms', array(
           'label' => '',
            'multiOptions' => array('Yes'=>'Yes'),
        ));
        $terms->setDecorators($this->elementCheckboxes);
        $terms->addValidator(new User_Form_UserTermsConditionsValidator());

        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('Send');


      $this->addElements(array($sufferinfo,$treatinfo,$medicationsinfo,
          $walk,$hands,$legs,$backashes,$slippedDisk,
          $lowerBack,$upperBack,$shoulders,$feet,$knees,$pelvis,$wrists,$ankles,$head,$mental,
          $heart,$diabities,$migren,$babies,$sleep,$digestion,$menopause,$scorosies,$epilepsy,$cancer,
          $asthma,$artrities,$hernia,$dipression,$headaches,$fatigue,$accident,
          $terms,
          $submit,
          ));

    }
}
