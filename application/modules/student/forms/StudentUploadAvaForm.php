<?php

/*
 * Form for uploading student's avatars
 */

class Student_Form_StudentUploadAvaForm extends Zend_Form{

	public function init(){

            $this->setAction('')
                    ->setMethod('post');

            $filename = time().rand(1000,9999);
            $ava = new Zend_Form_Element_File('ava');
            $ava->setAttrib('width', 120);
            $ava->setLabel('Upload your avatar (75x75 px)')
                    ->setDestination('avatars');
                $ava->addFilter('Rename',
                sprintf('ava%s.jpg', $filename, true));

            $ava->addValidator('Size', false, '204800')
                    ->addValidator('Extension', false, 'jpg,png,gif')
                    ->addValidator('ImageSize', false, array(
                        'minwidth' => 1,
                        'minheight' => 1,
                        'maxwidth' => 75,
                        'maxheight' => 75,
                ));
            $submit = new Zend_Form_Element_Submit('uploadavatar');
            $submit->setLabel("Upload");

            $this->addElements(array($ava,$submit));
            return $this;
	}
}