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
    }

    public function viewStudentAction()
    {
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
        $mailSendForm = new Student_Form_StudentWriteNewMailForm();
        $this->view->teacher = $mailExchange->getTeacherNameById(1);
        // dealing with the saving student's details updated by the teacher
        if ($this->getRequest()->getParam('save')){
            if (!$studentForm->isValid($_POST)){
                $this->view->form = $studentForm;
            } else{
                echo "SUCCESS!!!";
                $student->updateStudentData(intval($stid), $_POST);
                $dataMain = $student->getStudentMainData(intval($stid));
                $dataHealth = $student->getStudentHealthData(intval($stid));
                $dataAll = $dataHealth+$dataMain;
            }
        } else{
                $this->view->form = $studentForm;
        }

         $this->view->mailform = $mailSendForm->getForm();
         $this->view->mails = $mailExchange->getAllMessagesFromTeacher($stid);
        // end of dealing with the saving student's details updated by the teacher
    }
}