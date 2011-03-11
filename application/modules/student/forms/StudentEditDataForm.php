<?php

class Student_Form_StudentEditDataForm {

    /*
     *  creates new form based on 2 DB-tables and
     * prepopulates it with $data-values
     * if $protection is set (=1 or true) some field will be disabled
     */

    public function getForm($data, $protection=0){

        echo "<pre>";
        print_r($data); 
        echo "</pre>";
        $form = new Zend_Form();
        $form->setAction('/user/registration/first-form/')
                ->setAttrib('enctype','multipart/form-data')
                ->setMethod('post');

        //firstname field
        $firstName = new Zend_Form_Element_Text('firstname', array(
            'required'=>true,
            'maxLength' => '30',
            'id' => 'name',
            'validators' => array(
                                array('stringLength', false, array(3,100)),
                                array('Alpha'),
                                ),
       ));
         if (isset ($data['u_name'])) $firstName->setValue($data['u_name']);
         if ($protection) $firstName->setAttrib ('disabled', 'true');












          $form->addElements(array($firstName));

         return $form;
    }
}