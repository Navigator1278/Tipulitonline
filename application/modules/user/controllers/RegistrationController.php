<?php
class User_RegistrationController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

    public function firstFormAction()
    {
        $userFirstForm = new User_Form_UserFirstForm();
        if ($this->getRequest()->getParam('submit')){
            if (!$userFirstForm->isValid($_POST)){
                $this->view->form = $userFirstForm;
            } else{
                // success
                $values = $userFirstForm->getValues();
                $user = new User_Model_Users();
                $user->addUser($values);
                $userdata = serialize($values);
                $this->_redirect("/user/email-functions/create-validation-code/userdata/$userdata/");
            }
        } else{
            $this->view->form = $userFirstForm;
        }
    }

    public function secondFormAction()
    {
       $this->_helper->layout->setLayout('second_form');
       $email = $this->getRequest()->getParam('email');
       $emailValidation = new System_Model_SystemEmailValidation();
       $userId = $emailValidation->getId($email);
       if (!isset($email)){
           echo "Access denied!";
       }
       else {
           $this->view->email = $email;
           $userSecondForm = new User_Form_UserSecondForm();
           $this->view->form = $userSecondForm;
           if ($this->getRequest()->getParam('submit')){
               if (!$userSecondForm->isValid($_POST)){
                   $this->view->form = $userSecondForm;
               } else {
                  // success
                   //$emailValidation->sendWelcomeMail($email);
                   $values = $userSecondForm->getValues();
                   $user = new User_Model_UserHealthTable();
                   $user->addAdditionalData($userId,$values);
                   $auth = Zend_Auth::getInstance();
                   $auth->getStorage()->write(array('u_email'=>$email,'u_id'=>$userId));
                   $this->_redirect("/student/profile/my-profile/");
               }
           } else{
           $this->view->form = $userSecondForm;
           }
       }
    }

    public function validateEmailAction()
    {
        $code = $this->getRequest()->getParam('code');
        $email = $this->getRequest()->getParam('email');
        
        $emailValidation = new System_Model_SystemEmailValidation();
        if ($emailValidation->checkValidationCode($code, $email)){
             $this->_redirect("/user/registration/second-form/email/$email/");
        } else {
            echo "Invalid validation code!";
        }
    }

}
