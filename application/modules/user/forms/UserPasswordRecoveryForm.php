<?php

class User_Form_UserPasswordRecoveryForm extends Zend_Form{

    public function init(){


       $email = new Zend_Form_Element_Text('email',array(
           'required' => true,
           'size' => 50,
           'label' => 'E-Mail: ',
        ));
        $email->addValidator(new Zend_Validate_EmailAddress());
        $email->addValidator(new Zend_Validate_Db_RecordExists(array(
                'table'=>'users','field'=>'u_email')));

        $submit = new Zend_Form_Element_Submit('recover', array(
           'label' => 'Recover your password',
        ));

        $this->addElements(array($email,$submit));
    }

}
