<?php

class User_Form_UserTermsConditionsValidator extends Zend_Validate_Abstract{

    const NOT_SET = 'NOT SET';

    protected $_messageTemplates = array(
        self::NOT_SET => 'You must agree with our terms and conditions to continue',
        );

    public function isValid($value){

        if (!$value){
            $this->_error(self::NOT_SET);
           return false;
        }
        else return true;
    }
}
