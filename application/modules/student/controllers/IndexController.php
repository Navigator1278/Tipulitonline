<?php

class Student_IndexController extends Zend_Controller_Action
{

    public function  preDispatch()
    {
    	# turn on application/layouts/scripts/student.phtml
        $this->_helper->layout->setLayout('student');

        $auth = Zend_Auth::getInstance();
        #if (!$auth->hasIdentity()) $this->_redirect ('/');
    }

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {

       //  $this->_helper->viewRenderer->setNoRender();
       # $this->_helper->layout()->disableLayout();
    }


}

