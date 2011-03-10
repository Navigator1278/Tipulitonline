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
    }

    public function viewStudentAction()
    {
        // action body
    }

    public function myProfileEditAction()
    {
        # ОБЯЗАТЕЛЬНАЯ ПРОВЕРКА на то, что юзер залогинен. если нет - пересылвать его на /student/profile/view-student/id/{$user_id}
        // action body
    }

    public function ajaxValidateProfileEditAction()
    {
        // action body
    }


}









