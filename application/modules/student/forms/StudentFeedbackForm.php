<?php

/*
 * Form for uploading student's avatars
 */

class Student_Form_StudentFeedbackForm extends Zend_Form{

    public function getForm() {

        $elementDecorators = array(
            array('Label'),
            array('ViewHelper'),
            array('Errors'),
        );

        $form = new Zend_Form();
        $form->setAction('/student/profile/feedback/')
                ->setMethod('post');

        $improvement = new Zend_Form_Element_Radio('improvement', array(
           'label' => '',
           'separator' =>'',
           'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
        $improvement->setDecorators($elementDecorators);

        $level = new Zend_Form_Element_Radio('level', array(
           'label' => '',
           'separator' =>'',
           'multiOptions' => array('Hard'=>'Hard', 'Suitable'=>'Suitable', 'Easy' => 'Easy'),
        ));
        $level->setAttrib('class', 'radio_new');
        $level->setDecorators($elementDecorators);
        
        $difficult = new Zend_Form_Element_Text('difficult', array(
           'id'=>'difficult',
           'maxLength' => '50',
        ));
        $difficult->setDecorators($elementDecorators);
        $difficult->setAttrib('class', 'sub_text_input');

        $suggestions = new Zend_Form_Element_Textarea('suggestions', array(
           'label' => '?האם חווית בעיה בתרגול',
           'id' => 'suggestions',
        ));
        $suggestions->setAttrib('class', 'sub_textarea');

        $sendFeedback = new Zend_Form_Element_Button('sendfeedback', array(
            'id' => 'sendfeedback',
            'label' => 'ds',
        ));
        $sendFeedback->setAttrib('class', 'sub_button_input');
        $sendFeedback->setDecorators($elementDecorators);

        $form->addElements(array($improvement,$level,$difficult,$suggestions));
	return $form;
	}
}