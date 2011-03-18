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
        $email = $this->getRequest()->getParam('email');
        $pwd = $this->getRequest()->getParam('pwd');
         $emailValidation = new System_Model_SystemEmailValidation();
        if ($emailValidation->checkIfRecordExists($email)){
            $emailValidation->updateEmailValidationRecord($email, $code);
        } else{
            $emailValidation->insertEmailValidationRecord($email,
                                $pwd, $code);
        }
        $this->_helper->viewRenderer->setNoRender();
        $this->_helper->layout()->disableLayout();
        $this->_redirect("/user/email-functions/send-validation-code/email/$email/code/$code");
    }

    public function sendValidationCodeAction()
    {

        $email = $this->getRequest()->getParam('email');
        $code = $this->getRequest()->getParam('code');
        echo "EMAIL=".$email;
        $emailValidation = new System_Model_SystemEmailValidation();
       // $emailValidation->sendMail($email, $code);
        $message = "נשלחה אליכם הודעה לאימייל הפרטי שלכם לאישור. בבקשה בדקו את תיבת האימייל ";
        $message .= "<br/>";
        $message .= "שלכם ועקבו אחר ההוראות. להודעה זו עשוי לקחת עד  15 דק' להגיע";
        $message .= "<br/>";
        $message .= "במידה ונתקלתם בבעיה בתהליך הרישום צלצלו ל- 03-6470326 לצוות טיפולית אונליין";
        $this->view->message =  $message;
    }
    
}