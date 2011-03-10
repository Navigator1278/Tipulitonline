<?php

class User_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

    public function loginAction(){

         $this->_helper->layout()->disableLayout();
         $email = $this->getRequest()->getParam('email');
         $password =$this->getRequest()->getParam('password');
         $user = new User_Model_Users();
         $loginForm = new User_Form_UserLoginForm();
         if ($this->getRequest()->getParam('login')){
             $this->view->loginform = $loginForm;
             if ($user->checkAuth($email, $password)){
                 //correct!
                $auth = Zend_Auth::getInstance();
                $auth->getStorage()->write(array('u_email'=>$email));
                $this->_redirect("/student/index/index/");
             }
             else {
                 echo "Sorry, no record found in the DB with such email und password";
             }
         } else {
             $this->view->loginform = $loginForm;
         }
    }
}