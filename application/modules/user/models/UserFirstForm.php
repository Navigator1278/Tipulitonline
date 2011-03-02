<?php
class User_Form_UserFirstForm extends Zend_Form{
    public function init(){
        //setting  method and action of the form
        $this->setAction('')
             ->setMethod('post');

        //the firstname field
        $firstName = new Zend_Form_Element_Text('firstname');
        $firstName->setLabel('First Name: ')
                    ->setOptions(array('size'=>30))
                    ->setRequired(true)
                    ->addValidator(new Zend_Validate_Alpha(true));
        //the last- or familyname
        $familyName = new Zend_Form_Element_Text('familyname');
        $familyName->setLabel('Family Name: ')
                    ->setOptions(array('size'=>30))
                    ->setRequired(true)
                    ->addValidator(new Zend_Validate_Alpha(true));
        
        //submit form
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('Register');




        
        $this->addElements(array($firstName,$familyName,$submit));
    }
}