<?php

class User_Form_UserFirstForm extends Zend_Form{
    
    public function init(){
        //setting  method and action of the form
        $this->setAction('')
                ->setAttrib('enctype','multipart/form-data')
                ->setMethod('post');

        //firstname field
        $firstName = new Zend_Form_Element_Text('firstname', array(
            'required'=>true,
            'size' => 50,
            'label'   => 'First Name: ',
            'maxLength' => '30',
            'validators' => array(
                                array('stringLength', false, array(3,100)),
                                array('Alpha'),
                                ),
       ));

        //last- or familyname field
        $familyName = new Zend_Form_Element_Text('familyname', array(
            'required' => true,
            'size' => 50,
            'label' => 'Family Name: ',
            'validators' => array(
                                array('stringLength', false, array(3,100)),
                                array('Alpha'),
                                ),
        ));

        // status field goes here
        /*
         * TODO
         */

        $address = new Zend_Form_Element_Text('address', array(
            'required' => false,
            'size' => 50,
            'label' => 'Address: ',
        ));

        //the state
        /*
         * TODO
         */

        $zip = new Zend_Form_Element_Text('zip', array(
           'required' => false,
            'size' => 20,
            'label' => 'Zip Code: ',
        ));
        
        // password field
        $password1 = new Zend_Form_Element_Password('password1', array(
            'required' => true,
            'size' => 50,
            'label' => 'Enter your password (at least 8 chars): ',
        ));

        // password confirmation field
        $password2 = new Zend_Form_Element_Password('password2', array(
            'required' => true,
            'size' => 50,
            'label' => 'Confirm your password: ',
        ));
        $password2->addValidator(new User_Form_UserFirstFormPasswordValidator('password1'));

        //email field with validation
        $email = new Zend_Form_Element_Text('email',array(
           'required' => true,
           'size' => 50,
           'label' => 'Enter your E-Mail: '
        ));
        $email->addValidator(new Zend_Validate_EmailAddress());
        $email->addValidator(new Zend_Validate_Db_NoRecordExists(array(
                'table'=>'users','field'=>'u_email')));

        //selecting gender: Male (1) or Female (0)
        $gender = new Zend_Form_Element_Radio('sex', array(
           'required' => true,
           'label' => 'Male/Female: ',
           'multiOptions' => array('1'=>'Male','0'=>'Female'),
        ));

        //birthday field: validation for yyyy-mm-dd input
        $birthday = new Zend_Form_Element_Text('datepicker', array(
            'required' => true,
            'label' => 'Enter your birthday: '
        ));
        $birthday->addValidator(new Zend_Validate_Date());

        //external email: yes|no
        $external = new Zend_Form_Element_Radio('external', array(
           'required' => true,
           'label' => 'Would you like to use external emails: ',
           'multiOptions' => array('1'=>'Yes','0'=>'No'),
        ));

        //upload user image
        $image = new Zend_Form_Element_File('userimage', array(
            'required' => false,
            'label' => 'Upload your avatar (200x200, *.jpg, *.jpeg, *.gif or *.png): ',
        ));
        $image->setDestination('avatars')
                ->addFilter('Rename',  sprintf('avatara%s.jpg',  time(), true))
                ->addValidator('Extension', false, 'jpeg,jpg,gif,png')
                ->addValidator('ImageSize', false, array(
                    'maxwidth' => 200,
                    'maxheight' => 200,
                ));

        //submit the form
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('Register');

        $this->addElements(array($firstName,$familyName,$email,$address,
                        $zip,$birthday,$password1,$password2,$gender,$external,
                        $image,$submit));
    }
}