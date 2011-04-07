<?php

class Student_ProfileController extends Zend_Controller_Action
{

    public function init()
    {
        # turn on application/layouts/scripts/student.phtml
        $this->_helper->layout->setLayout('student');
        $auth = Zend_Auth::getInstance();
        #if (!$auth->hasIdentity()) $this->_redirect ('/');
    }

    public function indexAction()
    {
        // action body
    }

    public function myProfileAction()
    {
         # ОБЯЗАТЕЛЬНАЯ ПРОВЕРКА на то, что юзер залогинен. если нет - пересылвать его на /student/profile/view-student/id/{$user_id}
        // action body
        # тут получаешь данные о юзере, и отправляешь их на показ в вид.

        $sessionData = Zend_Auth::getInstance()->getIdentity();

        $id = $this->_getParam('id');
        if (!$sessionData){ //user is not logged in
            if (!$id) // no id was specified
            {
                $this->_redirect("/user/index/login/");
            } else{ //id was specofied
                $this->_redirect("/student/profile/view-student/id/$id");
            }
        } else{ //user was logged in, getting user info

            $student = new Student_Model_Students();
            $sessionId = $sessionData['u_id'];
            $student->send6dVideoToStudent($sessionId);
            $this->view->stid = $sessionId;
            $this->view->studentMainData = $student->getStudentMainData($sessionId);
            $this->view->kaltura = $student->getAllKalturaVideosForUser($sessionId);
            $this->view->youtube = $student->getAllYouTubeVideosForUser($sessionId);
            $this->view->all6dvideos = $student->getAll6DVideosForUser($sessionId);
            $this->view->status6d = $student->check6DStatus($sessionId);
            $mailExchange = new Student_Model_MailExchange();
            $mailSendForm = new Student_Form_StudentWriteNewMailForm();
            $feedbackForm = new Student_Form_StudentFeedbackForm();
            $this->view->teacher = $mailExchange->getTeacherNameById(1);
            if ($this->getRequest()->getParam('mailsend')){
                $mailExchange->sendMessageFromStudentToTeacher($sessionId,
                                    1, $_POST['subject'], $_POST['mailbody']);
                $this->_redirect("/student/profile/my-profile/");
            }
            $this->view->mailform = $mailSendForm->getForm();
            $this->view->feedbackform = $feedbackForm->getForm();
            $this->view->mails = $mailExchange->getAllMessagesFromTeacher($sessionId);
            $this->view->unreadmessages = $student->getNumberUnreadMesagesStudent($sessionId);
        }
    }

    public function viewStudentAction()
    {
        // action body
    }

    public function myProfileEditAction()
    {
        # ОБЯЗАТЕЛЬНАЯ ПРОВЕРКА на то, что юзер залогинен. если нет - пересылвать его на /student/profile/view-student/id/{$user_id}
        // action body
        $this->_helper->layout->setLayout('teacher');
        $sessionData = Zend_Auth::getInstance()->getIdentity();
        $id = $this->_getParam('id');

        $uploadAvaForm = new Student_Form_StudentUploadAvaForm();
        $this->view->uploadavatarform = $uploadAvaForm;
            
        if (!$sessionData){ //user is not logged in
            if (!$id) // no id was specified
            {
                $this->_redirect("/user/index/login/");
            } else{ //id was specified
                $this->_redirect("/student/profile/view-student/id/$id");
            }
        } else{ //user was logged in, getting user info

            $student = new Student_Model_Students();
            $dataMain = $student->getStudentMainData(intval($sessionData['u_id']));
            $dataHealth = $student->getStudentHealthData($sessionData['u_id']);
            $dataAll = $dataHealth+$dataMain;
            $this->view->data = $dataAll;
            $studentForm = Student_Form_StudentEditDataForm::getForm($dataAll,1);
            $this->view->studentstatus = $student->getStudentStatus($sessionData['u_id']);
            $this->view->form = $studentForm;
            if ($this->getRequest()->getParam('uploadavatar')){
                if ($uploadAvaForm->isValid($_POST)){
                    $values = $uploadAvaForm->getValues();
                    $student->uploadStudentAva($sessionData['u_id'], $values['ava']);
                    $dataMain = $student->getStudentMainData(intval($sessionData['u_id']));
                    $this->view->data = $dataMain;
                } else{
                    $this->view->uploadavatarform = $uploadAvaForm;
                }
            }
            if ($this->getRequest()->getParam('save')){
            if (!$studentForm->isValid($_POST)){
                $this->view->form = $studentForm;
            } else{
                // success
                $student->updateStudentData($sessionData['u_id'], $_POST);
                $dataMain = $student->getStudentMainData(intval($sessionData['u_id']));
                $dataHealth = $student->getStudentHealthData($sessionData['u_id']);
                $dataAll = $dataHealth+$dataMain;
            }
        } else{
                $this->view->form = $studentForm;
        }

        }
    }

    /*
    * Subscribing the student for the 6d course
    */
    public function subscribecourseAction(){
    	if ($this->getRequest()->isXmlHttpRequest()) {
    		$stid = $this->_request->getParam('stid');
                $student = new Student_Model_Students();
                $student->subscribeFor6DCourse($stid);
    	}
    	else echo "no AJAX";
    }

    /*
     * Changing the flag in the video table
     *
     */
    public function setviewedflagAction(){
    	if ($this->getRequest()->isXmlHttpRequest()) {
    		$videoId = $this->_request->getParam('videoid');
                $userId = $this->_request->getParam('stid');
                $course6d = $this->_request->getParam('course6d');
                $student = new Student_Model_Students();
                if ($course6d){
                    $student->set6dVideoFlag($videoId);
                    $student->send6dVideoToStudent($userId);
                }
                else {
                    $student->setVideoFlag($videoId);
                }
    	}
    	else echo "no AJAX";
    }

    public function setreadflagAction(){

    	if ($this->getRequest()->isXmlHttpRequest()) {
    		$emailId = $this->_request->getParam('mailid');
    		$side = $this->_request->getParam('side');
                $mailExchange = new Student_Model_MailExchange();
                $mailExchange->setReadEmailFlag($emailId,$side);
    	}
    	else echo "no AJAX";
    }

    public function sendfeedbackAction(){
    	if ($this->getRequest()->isXmlHttpRequest()) {
                $stid = $this->_request->getParam('stid');
                $video = $this->_request->getParam('video');
                $improvement = $this->_request->getParam('improvement');
                $level = $this->_request->getParam('level');
                $difficulty = $this->_request->getParam('difficulty');
                $suggestions = $this->_request->getParam('suggestions');

                $student = new Student_Model_Students();
                $mailExchange = new Student_Model_MailExchange();
                $video = $student->getLastFirstPlayerVideo($stid);
                $mailExchange->sendFeedbackFromStudent($stid, $video, $improvement, $level, $difficulty, $suggestions);
    	}
    	else echo "no AJAX";
    }

    public function upgradeAccountAction(){
        $teacher = new Teacher_Model_Teachers();
        $this->view->paymentinfo = $teacher->getPaymentInfo();
        $this->_helper->layout->setLayout('teacher');
    }

    /*
     * chat action
     */
    public function chatAction(){
        
        $this->_helper->layout->setLayout('teacher');
        $sessionData = Zend_Auth::getInstance()->getIdentity();
        $sessionId = $sessionData['u_id'];
        $user = new User_Model_Users();
        //$user->resetAllChatRequestsStudent($sessionId);
        $this->view->stid = $sessionId;
        
    }




    public function ajaxValidateProfileEditAction()
    {
        // action body
    }
}