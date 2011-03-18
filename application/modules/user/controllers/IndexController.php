<?php

class User_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        //index
    }

    public function loginAction(){

         $this->_helper->layout()->disableLayout();
         $email = $this->getRequest()->getParam('email');
         $password =$this->getRequest()->getParam('password');
         $user = new User_Model_Users();
         $loginForm = new User_Form_UserLoginForm();
         if ($this->getRequest()->getParam('login')){
             $this->view->loginform = $loginForm;
             $status = $user->checkAuth($email, $password);
             if ($status==1){
                 //correct!
                $auth = Zend_Auth::getInstance();
                $systemEmailValidation = new System_Model_SystemEmailValidation();
                $userId = $systemEmailValidation->getId($email);
                $auth->getStorage()->write(array('u_email'=>$email,'u_id'=>$userId, 'u_status'=>$status));
                $this->_redirect("/student/profile/my-profile/");
             } elseif($status==2){
                 $this->_redirect("/teacher/dashboard/index/");
             }
             else {
                 echo "Sorry, no record found in the DB with such email und password";
             }
         } else {
             $this->view->loginform = $loginForm;
         }
    }
}