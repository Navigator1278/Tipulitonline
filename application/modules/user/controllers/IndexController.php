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
        
         $email = $this->getRequest()->getParam('email');
         $password =$this->getRequest()->getParam('password');
         $user = new User_Model_Users();
         if ($user->checkAuth($email, $password)){
             echo "Authentification succesfull";
         }
         else {
             echo "Sorry, no record found in the DB with such email und password";
         }
    }
}

