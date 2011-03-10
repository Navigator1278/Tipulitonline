<?php

class User_Form_UserLoginForm extends Zend_Form{

    public function init(){

        //
       $email = new Zend_Form_Element_Text('email',array(
           'required' => true,
           'size' => 50,
           'label' => 'אימייל: '
        ));
        $email->addValidator(new Zend_Validate_EmailAddress());
        $email->addValidator(new Zend_Validate_Db_NoRecordExists(array(
                'table'=>'users','field'=>'u_email')));

       // password field
        $password = new Zend_Form_Element_Password('password', array(
            'required' => true,
            'size' => 50,
            'label' => 'סיסמא',
        ));

        $submit = new Zend_Form_Element_Submit('login', array(
           'label' => 'login',
        ));

        $this->addElements(array($email,$password,$submit));
    }


}