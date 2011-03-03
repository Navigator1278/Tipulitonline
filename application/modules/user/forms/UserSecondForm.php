<?php

class User_Form_UserSecondForm extends Zend_Form{

    public function init(){
        //setting  method and action of the form
        $this->setAction('')
               ->setMethod('post');

     $height = new Zend_Form_Element_Text('height', array(
            'required'=>false,
            'size' => 20,
            'label'   => 'Height: ',
            'maxLength' => '5',
            'validators' => array(
                                array('Float'),
                                ),
       ));
     $weight = new Zend_Form_Element_Text('weight', array(
            'required'=>false,
            'size' => 20,
            'label'   => 'Weight: ',
            'maxLength' => '5',
            'validators' => array(
                                array('Float'),
                                ),
       ));

     $bmi = new Zend_Form_Element_Text('bmi', array(
            'required'=>false,
            'size' => 20,
            'label'   => 'BMI: ',
            'maxLength' => '5',
            'validators' => array(
                                array('Float'),
                                ),
       ));

     $otherPainBody = new Zend_Form_Element_Textarea('otherpain', array(
         'required' => false,
         'label' => 'Other Pain:',
         'rows' => 5,
         'cols' => 15,
     ));

     $injuryText = new Zend_Form_Element_Textarea('injurytext', array(
         'required' => false,
         'label' => 'Injury:',
         'rows' => 5,
         'cols' => 15,
     ));

     $otherConditions = new Zend_Form_Element_Textarea('otherconditions', array(
         'required' => false,
         'label' => 'Other conditions:',
         'rows' => 5,
         'cols' => 15,
     ));
// Radiobuttons ---------------------------------------------------//
     
       $pregnant = new Zend_Form_Element_Radio('pregnant', array(
           'label' => 'Pregnant (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $walk = new Zend_Form_Element_Radio('walk', array(
           'label' => 'Walk (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $sit = new Zend_Form_Element_Radio('sit', array(
           'label' => 'Sit (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $hands = new Zend_Form_Element_Radio('hands', array(
           'label' => 'Hands (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $slippedDisk = new Zend_Form_Element_Radio('slippeddisk', array(
           'label' => 'Slipped Disk (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $anklesAndFeet = new Zend_Form_Element_Radio('anklesandfeet', array(
           'label' => 'Ankles and_Feet (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $knees = new Zend_Form_Element_Radio('knees', array(
           'label' => 'Knees (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $thighsOrPelvis = new Zend_Form_Element_Radio('thighsorpelvis', array(
           'label' => 'Thighs or pelvis (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $lowerBack = new Zend_Form_Element_Radio('lowerback', array(
           'label' => 'Lower Back (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $upperBack = new Zend_Form_Element_Radio('upperback', array(
           'label' => 'Upper Back (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $neckAndShoulders = new Zend_Form_Element_Radio('neckandshoulders', array(
           'label' => 'Neck and_Shoulders (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $head = new Zend_Form_Element_Radio('head', array(
           'label' => 'Head (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $wrists = new Zend_Form_Element_Radio('wrists', array(
           'label' => 'Wrists (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $elbows = new Zend_Form_Element_Radio('elbows', array(
           'label' => 'Elbows (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $heartOrPb = new Zend_Form_Element_Radio('heartorpb', array(
           'label' => 'Heart r_PB (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $injury = new Zend_Form_Element_Radio('injury', array(
           'label' => 'Injury (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $epilepsy = new Zend_Form_Element_Radio('epilepsy', array(
           'label' => 'Epilepsy (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $cancer = new Zend_Form_Element_Radio('cancer', array(
           'label' => 'Cancer (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $depressionOrAnxiety = new Zend_Form_Element_Radio('depression', array(
           'label' => 'Depression or Anxiety (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $diabetes = new Zend_Form_Element_Radio('diabetes', array(
           'label' => 'Diabetes (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $asthma = new Zend_Form_Element_Radio('asthma', array(
           'label' => 'Asthma (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $artritis = new Zend_Form_Element_Radio('artritis', array(
           'label' => 'Artritis (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $hernia = new Zend_Form_Element_Radio('hernia', array(
           'label' => 'Hernia (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));
       $medication = new Zend_Form_Element_Radio('medication', array(
           'label' => 'Medication (Yes/No): ',
           'multiOptions' => array('Yes'=>'Yes'),
        ));

// Thats all


      $submit = new Zend_Form_Element_Submit('submit');
      $submit->setLabel('Send');

      $this->addElements(array($height,$weight,$bmi,
          $otherPainBody,$injuryText,$otherConditions,
          $pregnant,$walk,$sit,$hands,$slippedDisk,$anklesAndFeet,$knees,
          $thighsOrPelvis,$lowerBack,$upperBack,$neckAndShoulders,$head,
          $wrists,$elbows,$heartOrPb,$injury,$epilepsy,$cancer,$depressionOrAnxiety,
          $diabetes,$asthma,$artritis,$hernia,$medication,
          $submit));

    }
}
