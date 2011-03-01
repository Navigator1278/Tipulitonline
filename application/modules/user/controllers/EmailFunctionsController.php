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
        // action body
    }

    public function sendValidationCodeAction()
    {
        // action body
    }


}





