<?php

class User_Form_UserFirstFormPasswordValidator extends Zend_Validate_Abstract{

    const NOT_MATCH = 'PASSWORD_NOT_MATCH';
    const TOO_SHORT = 'PASSWORD_TOO_SHORT';

    private $_passwordAprove;

    protected $_messageTemplates = array(
        self::NOT_MATCH => 'Password confirmation does not match',
        self::TOO_SHORT => 'Password should contain  at least 8 chars'
        );

    public function  __construct($element = null) {
        $this->_passwordAprove = $element;
    }

    public function isValid($value, $contex=null){

        $this->_setValue($value);
        if (strlen($value)<3){
            $this->_error(self::TOO_SHORT);
            return false;
        }
        if (is_array($contex)){
            if (isset ($contex[$this->_passwordAprove])&&
                        $value==$contex[$this->_passwordAprove])
                             return true;
        }
        $this->_error(self::NOT_MATCH);
        return false;
        }
}
