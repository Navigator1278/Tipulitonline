<?php

class Teacher_DashboardController extends Zend_Controller_Action
{

    public function init()
    {
        # turn on application/layouts/scripts/student.phtml
        $this->_helper->layout->setLayout('teacher');
        $auth = Zend_Auth::getInstance();
        $user = new User_Model_Users();
        $student = new Student_Model_Students();
        $student->sendMassMailsToAllStudents();

       
        $sessionData = Zend_Auth::getInstance()->getIdentity();
        if ($sessionData['t_status']!=2) $this->_redirect ('/');
    }

    public function indexAction(){
         //$sessionData = Zend_Auth::getInstance()->getIdentity();
         $entriesPerPage = 10;
         $student = new Student_Model_Students();
         $teacher = new Teacher_Model_Teachers();
         $currentPage = $this->_getParam('page');
         if ($currentPage==0) $currentPage=1;
         $this->view->numpages = $student->getNumberOfPages($entriesPerPage);
         $this->view->allstudents = $student->getAllStudents($currentPage, $entriesPerPage);
         $this->view->allonlinestudents = $student->getAllOnlineStudents();
         $this->view->currentpage = $currentPage;
         //echo '<pre>';
         //print_r($teacher->getAllOfflineMessages(92, 1));
         //echo '</pre>';
    }

    public function viewStudentAction()
    {
        $teacherId = $this->view->teacherId = 1;
        $stid = $this->_getParam('stid');//student's ID
        $student = new Student_Model_Students();
        $dataMain = $student->getStudentMainData(intval($stid));
        $dataHealth = $student->getStudentHealthData(intval($stid));
        $dataAll = $dataHealth+$dataMain;
        $studentForm = Student_Form_StudentEditDataForm::getForm($dataAll,0);
        $this->view->studentstatus = $student->getStudentStatus(intval($stid));
        $this->view->form = $studentForm;
        $this->view->studenthas6d = $student->check6DStatus($stid);
        $mailExchange = new Student_Model_MailExchange();
        $mailSendForm = new Teacher_Form_TeacherWriteNewMailForm($stid);
        $this->view->teacher = $mailExchange->getTeacherNameById(1);
        $this->view->stid = $stid;
        $this->view->alerts = $student->getStudentAlerts($stid);

        //changing the avatar of the student
        $uploadAvaForm = new Student_Form_StudentUploadAvaForm();
        $this->view->uploadavatarform = $uploadAvaForm;
        $this->view->data = $dataAll;
        if ($this->getRequest()->getParam('uploadavatar')){
                if ($uploadAvaForm->isValid($_POST)){
                    $values = $uploadAvaForm->getValues();
                    $student->uploadStudentAva($stid, $values['ava']);
                    $dataMain = $student->getStudentMainData(intval($stid));
                    $this->view->data = $dataMain;
                } else{
                    $this->view->uploadavatarform = $uploadAvaForm;
                }
        }


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
             $mailExchange->sendExternalMailToStudent($stid, $_POST['subject'], $_POST['mailbody']);
             $this->_redirect("/teacher/dashboard/view-student/stid/$stid/#newmaillink");
        }
         $this->view->mailform = $mailSendForm->getForm();
         $this->view->mails = $mailExchange->getAllMessagesFromTeacher($stid);

        // end of dealing with the saving student's details updated by the teacher
    }

    /*
    * Rendering the form with textarea (powered by texteditor)
    */
    public function upgradeAccountEditorAction(){
        
        $teacher = new Teacher_Model_Teachers();
        if ($this->getRequest()->getParam('send')){
            $data = $_POST['editor1'];
            $teacher->savePaymentInfo($data);
            $this->view->savedflag = true;
        }
        $this->view->paymentinfo = $teacher->getPaymentInfo();
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

     public function start6dcourseAction(){
    	if ($this->getRequest()->isXmlHttpRequest()) {
    		$stid = $this->_request->getParam('stid');
                $student = new Student_Model_Students();
                $student->activate6DCourse($stid);
                }
    	else echo "no AJAX";
    }

    /*
     * Activating the 6d course
     */
    public function pause6dcourseAction(){
    	if ($this->getRequest()->isXmlHttpRequest()) {
    		$stid = $this->_request->getParam('stid');
                $student = new Student_Model_Students();
                $student->pause6dCourse($stid);
                }
    	else echo "no AJAX";
    }

    /*
     * chat window
     */
    public function chatAction(){
        
        $stid = $this->view->stid = $this->_getParam('stid'); //student's ID
        $teacher = new Teacher_Model_Teachers();
        $student = new Student_Model_Students();
        $user = new User_Model_Users();
        $dataMain = $student->getStudentMainData(intval($stid));
        $this->view->studentname = $dataMain['u_name']." ".$dataMain['u_family_name'];
        $teacher->sendChatRequestToStudent($stid,1);
        $user->resetAllChatRequestsTeacher($stid);
    }
}