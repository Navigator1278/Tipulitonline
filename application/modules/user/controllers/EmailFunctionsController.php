<?php

class User_EmailFunctionsController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

    public function createValidationCodeAction()
    {
        $code = md5(date("Y-m-d H:i:s"));
        $userData = unserialize($this->getRequest()->getParam('userdata'));
        $emailValidation = new System_Model_SystemEmailValidation();
        if ($emailValidation->checkIfRecordExists($userData['email'])){
            $emailValidation->updateEmailValidationRecord($userData['email'], $code);
            $message = "Account already exists, data was updated";
        } else{
            $emailValidation->insertEmailValidationRecord($userData['email'],
                                $userData['password1'], $code);
            $message = "Account was created!";
        }
        $this->_redirect("/user/email-functions/send-validation-code/message/
                    $message/email/$email/code/$code/");
    }

    public function sendValidationCodeAction()
    {
        $this->view->message = $this->getRequest()->getParam('message');
        $email = $this->getRequest()->getParam('email');
        $code = $this->getRequest()->getParam('code');
        $emailValidation = new System_Model_SystemEmailValidation();
        //$emailValidation->sendMail($email, $code);
    }
}