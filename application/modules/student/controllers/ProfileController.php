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
            $this->view->studentMainData = $student->getStudentMainData($sessionData['u_id']);
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
        if (!$sessionData){ //user is not logged in
            if (!$id) // no id was specified
            {
                $this->_redirect("/user/index/login/");
            } else{ //id was specofied
                $this->_redirect("/student/profile/view-student/id/$id");
            }
        } else{ //user was logged in, getting user info

            $student = new Student_Model_Students();
            $dataMain = $student->getStudentMainData(intval($sessionData['u_id']));
            $dataHealth = $student->getStudentHealthData($sessionData['u_id']);
            $dataAll = $dataHealth+$dataMain;
            $studentForm = Student_Form_StudentEditDataForm::getForm($dataAll,1);
            $this->view->form = $studentForm;
        }
    }

    public function ajaxValidateProfileEditAction()
    {
        // action body
    }


}