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
        $this->view->headTitle('טופס רישום');
        $userFirstForm = new User_Form_UserFirstForm();
        if ($this->getRequest()->getParam('submit')){
            if (!$userFirstForm->isValid($_POST)){
                $this->view->form = $userFirstForm;
            } else{
                // success
                $values = $userFirstForm->getValues();
                $user = new User_Model_Users();
                $user->addUser($values);
                $email = $values['email']; $pwd=$values['password1'];
                $this->_redirect("/user/email-functions/create-validation-code/email/$email/pwd/$pwd/");
            }
        } else{
            $this->view->form = $userFirstForm;
        }
    }

    public function secondFormAction()
    {
       $this->_helper->layout->setLayout('second_form');
        $this->view->headTitle('שאלון רפואי');
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
                   $username = $emailValidation->getNameByEmail($email);
                   //$emailValidation->sendWelcomeMail($email,$username,$userId);
                   $values = $userSecondForm->getValues();
                   $user = new User_Model_UserHealthTable();
                   $user->addAdditionalData($userId,$values);
                   $auth = Zend_Auth::getInstance();
                   $auth->getStorage()->write(array('u_email'=>$email,'u_id'=>$userId));
                   $mailExchange = new Student_Model_MailExchange();
                   //$text = "New <a href='/teacher/dashboard/view-student/stid/$userId/'>user</a> was registered";
                   $mailExchange->sendNewUserInformation($userId);
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
