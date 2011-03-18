<?php

/*
 * Form for uploading student's avatars
 */

class Student_Form_StudentWriteNewMailForm extends Zend_Form{

    public function getForm() {

        $elementDecorators = array(
            array('Label'),
            array('ViewHelper'),
            array('Errors'),
        );
        
        $form = new Zend_Form();
        $form->setAction('/student/profile/my-profile/')
                ->setMethod('post');
        $mailSubject = new Zend_Form_Element_Text('subject', array(
           'id'=>'mailsubj',
           'label'=>'Subject',
        ));

        $mailBody = new Zend_Form_Element_Textarea('mailbody', array(
           'id' => 'mailbody',
           'label'=>'Message',
            'cols' => 40,
            'rows' => 5,
        ));

        $mailSend = new Zend_Form_Element_Submit('mailsend', array(
            'id' => 'mailsend',
            'label' => 'send',
        ));
      $form->addElements(array($mailSubject,$mailBody,$mailSend));
	return $form;
	}

}