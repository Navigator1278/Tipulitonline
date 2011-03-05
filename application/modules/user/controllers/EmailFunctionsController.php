<?php

class User_EmailFunctionsController extends Zend_Controller_Action
{

    public function init()
    {

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
            $message = "Account already exists, data was updated.<br/>Check you email ".$userData['email']." for validation link.";
        } else{
            $emailValidation->insertEmailValidationRecord($userData['email'],
                                $userData['password1'], $code);
            $message = "Account was created!"."<br/>Check you email ".$userData['email']." for validation link.";
        }
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout()->disableLayout();
        $mail = $userData['email'];
        $this->_redirect("/user/email-functions/send-validation-code/email/$mail/code/$code/message/$message");
    }

    public function sendValidationCodeAction()
    {
        $this->view->message = $this->getRequest()->getParam('message');
        $email = $this->getRequest()->getParam('email');
        $code = $this->getRequest()->getParam('code');
        $emailValidation = new System_Model_SystemEmailValidation();

        $emailValidation->sendMail($email, $code);
    }
}