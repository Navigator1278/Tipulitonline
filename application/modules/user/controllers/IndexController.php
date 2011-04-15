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
                $user->increaseVisitsAmount($userId);
                $auth->getStorage()->write(array('u_email'=>$email,'u_id'=>$userId, 'u_status'=>$status));
                $this->_redirect("/student/profile/my-profile/");
             } elseif($status==2){
                $auth = Zend_Auth::getInstance();
                $auth->getStorage()->write(array('t_email'=>$email,'t_id'=>1, 't_status'=>$status));
                $this->_redirect("/teacher/dashboard/index/");
             }
             else {
                 echo "Sorry, no record found in the DB with such email und password";
             }
         } else {
             $this->view->loginform = $loginForm;
         }
    }

    public function logoutAction(){
        Zend_Auth::getInstance()->clearIdentity();
        $this->_redirect('');
    }

    /*
     * Updating the datetime of last activity, relevant for all users: teacher and students
     */
    public function updateactivityAction(){
        if ($this->getRequest()->isXmlHttpRequest()) {
            $person = $this->_request->getParam('person');
            $personid = $this->_request->getParam('personid');
            $user = new User_Model_Users();
            if ($person=='student'){
                $user->changeStudentActivityTime($personid);
                echo Zend_Json::encode(array('status'=>'OK')); exit();
            }else {
                $user->changeTeacherActivityTime($personid);
                echo Zend_Json::encode(array('status'=>'OK')); exit();
            }
    	}
    	else echo "no AJAX";
    }

    /*
     * Checking for new incoming events
     */
    public function checkactivityAction(){
       if ($this->getRequest()->isXmlHttpRequest()) {
            $person = $this->_request->getParam('person');
            $personid = $this->_request->getParam('personid');
            $otherpersonid = $this->_request->getParam('otherpersonid');
            $user = new User_Model_Users();
            if ($person=='student'){
                $newMessages = $user->checkStudentsMessages($personid);
            }else {
                $newMessages = $user->checkStudentsMessages($otherpersonid);
            }
            if ($newMessages) {
                    echo Zend_Json::encode($newMessages); exit();
                }
            else {
                    echo Zend_Json::encode(''); exit();
            }
    	}
    	else echo "no AJAX";
    }

    /*
     * Adding the new chat-message
     */
    public function addnewchatmessageAction(){
       if ($this->getRequest()->isXmlHttpRequest()) {

           $person = $this->_request->getParam('person');
           $personid = $this->_request->getParam('personid');
           $ohterpersonid = $this->_request->getParam('otherpersonid');
           $message = $this->_request->getParam('message');
           $user = new User_Model_Users();
           $student = new Student_Model_Students();
           if ($person=='student'){
               $user->resetAllChatRequestsStudent($personid);
                if ($student->getAllOnlineTeachers(60)){
                    $user->addNewChatMessage($personid, null, null, 1, $message,1,0);
                }
                else {
                    $user->addNewChatMessage($personid, null, null, 1, $message,1,0);
                    $user->addNewChatMessage(null,1,$personid,null,"Im currently offline. I will read your message by my next visit",1,0);
                }
           }
           else {
                $user->resetAllChatRequestsTeacher($ohterpersonid);
                if ($student->checkIfStudentOnline($ohterpersonid,60)){
                    $user->addNewChatMessage(null, 1, $ohterpersonid, null, $message,1,1);
                }
                else {
                    $user->addNewChatMessage(null, 1, $ohterpersonid, null, $message,0,1);
                }
           }
       }
    }

    public function passwordRecoveryAction(){
        $this->_helper->layout()->disableLayout();
        $email = $this->getRequest()->getParam('email');
        $user = new User_Model_Users();
        $recoveryForm = new User_Form_UserPasswordRecoveryForm();
        if ($this->getRequest()->getParam('recover')){
            if (!$recoveryForm->isValid($_POST)){
                $this->view->recoveryform = $recoveryForm;
            }
            else{
                 // success
                $user = new User_Model_Users();
                $user->recoverPasswordUser($email);
                echo "Password have been sent";
            }
        } else {
             $this->view->recoveryform = $recoveryForm;
         }
    }

    
}