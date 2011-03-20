<?php

class Teacher_DashboardController extends Zend_Controller_Action
{

    public function init()
    {
        # turn on application/layouts/scripts/student.phtml
        $this->_helper->layout->setLayout('teacher');
        $auth = Zend_Auth::getInstance();
        #if (!$auth->hasIdentity()) $this->_redirect ('/');
        
    }

    public function indexAction(){
         $sessionData = Zend_Auth::getInstance()->getIdentity();
           $this->_helper->layout()->disableLayout();
    }

    public function viewStudentAction()
    {
        $teacherId = $this->view->teacherId = 1 ;
        $stid = $this->_getParam('stid');
        $student = new Student_Model_Students();
        $dataMain = $student->getStudentMainData(intval($stid));
        $dataHealth = $student->getStudentHealthData(intval($stid));
        $dataAll = $dataHealth+$dataMain;
        $this->view->data = $dataAll;
        $studentForm = Student_Form_StudentEditDataForm::getForm($dataAll,0);
        $this->view->studentstatus = $student->getStudentStatus(intval($stid));
        $this->view->form = $studentForm;
        $mailExchange = new Student_Model_MailExchange();
        $mailSendForm = new Teacher_Form_TeacherWriteNewMailForm($stid);
        $this->view->teacher = $mailExchange->getTeacherNameById(1);
        $this->view->stid = $stid;
        // dealing with the saving student's details updated by the teacher
        if ($this->getRequest()->getParam('save')){
            if (!$studentForm->isValid($_POST)){
                $this->view->form = $studentForm;
            } else{
                $student->updateStudentData(intval($stid), $_POST);
                $dataMain = $student->getStudentMainData(intval($stid));
                $dataHealth = $student->getStudentHealthData(intval($stid));
                $dataAll = $dataHealth+$dataMain;
            }
        } else{
                $this->view->form = $studentForm;
        }
        if ($this->getRequest()->getParam('mailsend')){
             $mailExchange->sendMessageFromTeacherToStudent($stid,
                            $teacherId, $_POST['subject'], $_POST['mailbody']);
             $this->_redirect("/teacher/dashboard/view-student/stid/$stid/#newmaillink");
        }
         $this->view->mailform = $mailSendForm->getForm();
         $this->view->mails = $mailExchange->getAllMessagesFromTeacher($stid);
        // end of dealing with the saving student's details updated by the teacher
    }

    public function postkalturacodeAction(){
    	if ($this->getRequest()->isXmlHttpRequest()) {
    		$code = $this->_request->getParam('code');
                $code2 = $this->_request->getParam('code2');
    		$teacherId = $this->_request->getParam('teacher');
    		$stid = $this->_request->getParam('stid');
                $student = new Student_Model_Students();
                if ($code)
                    $data  = $student->postKalturaVideoForUser($stid, $teacherId, $code);
                else
                    $data = $student->postYouTubeVideoForUser ($stid, $teacherId, $code2);
                echo (Zend_Json::encode($data));
    	}
    	else echo "no AJAX";
    }
}