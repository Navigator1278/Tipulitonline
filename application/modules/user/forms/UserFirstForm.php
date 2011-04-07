<?php

class User_Form_UserFirstForm extends Zend_Form{


    public $formDecorators = array(
      array('FormElements'),
      array('Form'),
    );

    public $buttonDecorators = array(
        array('ViewHelper'),
        array('HtmlTag',array('tag'=>'p')),
    );

    public $elementDecorators = array(
        array('Label'),
         array('ViewHelper'),
        array('Errors'),
        array('HtmlTag', array('tag' => 'li'))
    );

    public function init(){
        //setting  method and action of the form
        $this->setAction('/user/registration/first-form/')
                ->setAttrib('enctype','multipart/form-data')
                ->setDecorators($this->formDecorators)
                ->setMethod('post');

        //firstname field
        $firstName = new Zend_Form_Element_Text('firstname', array(
            'required'=>true,
            'label'   => 'שם פרטי:',
            'maxLength' => '30',
            'validators' => array(
                                array('stringLength', false, array(3,100)),
                                array('Alpha'),
                                ),
       ));
        $firstName->setDecorators($this->elementDecorators);

        //last- or familyname field
        $familyName = new Zend_Form_Element_Text('familyname', array(
            'required' => true,
            'label' => 'שם משפחה:',
            'validators' => array(
                                array('stringLength', false, array(3,100)),
                                array('Alpha'),
                                ),
        ));
        $familyName->setDecorators($this->elementDecorators);

        // status field goes here
        /*
         * TODO
         */

        //selecting gender: Male (1) or Female (0)
        $gender = new Zend_Form_Element_Radio('sex', array(
           'required' => true,
           'label' => 'מין:',
           'separator' =>'',
           'multiOptions' => array('1'=>'זכר ','0'=>'נקבה'),
        ));
        $gender->setDecorators($this->elementDecorators);

        //birthday field: validation for yyyy-mm-dd input
        $birthday = new Zend_Form_Element_Text('datepicker', array(
            'required' => true,
            'label' => 'שנת לידה:',
            'size' => 10,
        ));
        $birthday->setDecorators($this->elementDecorators);
        $birthday->addValidator(new Zend_Validate_Date());

        $weight = new Zend_Form_Element_Select('weight', array(
            'label' => 'שקל',
          ));
        for ($i=20;$i<=300;$i++) $weight->addMultiOption($i,$i);
        $weight->setDecorators($this->elementDecorators);


        $heigth = new Zend_Form_Element_Select('heigth', array(
            'label' => 'גובה:',
         ));
        for ($i=120;$i<=300;$i++) $heigth->addMultiOption($i,$i);
        $heigth->setDecorators($this->elementDecorators);


//email field with validation
        $email = new Zend_Form_Element_Text('email',array(
           'required' => true,
           'size' => 50,
           'label' => 'אימייל: '
        ));
        $email->addValidator(new Zend_Validate_EmailAddress());
        $email->addValidator(new Zend_Validate_Db_NoRecordExists(array(
                'table'=>'users','field'=>'u_email')));
        $email->setDecorators($this->elementDecorators);


                // password field
        $password1 = new Zend_Form_Element_Password('password1', array(
            'required' => true,
            'size' => 50,
            'label' => 'סיסמא',
        ));
        $password1->setDecorators($this->elementDecorators);

        // password confirmation field
        $password2 = new Zend_Form_Element_Password('password2', array(
            'required' => true,
            'size' => 50,
            'label' => 'אימות סיסמא',
        ));
        $password2->addValidator(new User_Form_UserFirstFormPasswordValidator('password1'));
        $password2->setDecorators($this->elementDecorators);


        $state = new Zend_Form_Element_Select('state', array(
            'requred' => true,
            'label' => 'מדינה:',
        ));
        $state->setMultiOptions(array(
            '1' => 'מדינה:',
        ));
        $state->setDecorators($this->elementDecorators);


        $address = new Zend_Form_Element_Text('address', array(
            'required' => false,
            'size' => 50,
            'label' => 'כתובת מלאה:',
        ));
        $address->setDecorators($this->elementDecorators);

        //selecting gender: Male (1) or Female (0)
        $pregnant = new Zend_Form_Element_Radio('pregnant', array(
            'label' => 'לנשים: האם את בהריון?',
            'separator' =>'',
            'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
        $pregnant->setDecorators($this->elementDecorators);

        $pregnantSince = new Zend_Form_Element_Select('pregnantsince', array(
            'label' => 'מספר חודשים שעברו מהלידה האחרונה:',
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
        $pregnantSince->setDecorators($this->elementDecorators);

        $objectives = new Zend_Form_Element_Textarea('objectives', array(
            'label' => 'מהן המטרות שלך בתרגול איתנו?',
        ));

        $terms = new Zend_Form_Element_Checkbox('terms', array(
           'label' => "<a target='new' href='http://tipulitonline.co.il/pages/takanon.html'>אישור הסכמה לתנאים וההגבלות</a>",
            'required' => 'true,'
        ));
        $terms->setDecorators($this->elementDecorators);
        $terms->addDecorator('Label',array('escape'=>false));
        $terms->addValidator(new User_Form_UserTermsConditionsValidator());

        //submit the form
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('שלח ');

         $this->addElements(array($firstName,$familyName,$gender,$weight,$heigth,
                        $birthday,$email,$password1,$password2,$state,
                        $address,$pregnant,$pregnantSince,$objectives,$terms,
                        $submit));
    }
}