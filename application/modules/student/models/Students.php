<?php

class Student_Model_Students extends Zend_Db_Table_Abstract{

    protected $_name = 'users';

    /*
     * getting data from the table users
     */

    public function getStudentMainData($id){

        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('users')
                    ->where("u_id=$id");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res[0];
    }

    /*
     * getting data from the table user__health_table
     */
    
    public function getStudentHealthData($id){
        $db = Zend_Db_Table_Abstract::getDefaultAdapter();
        $select = $db->select()
                    ->from('user__health_table')
                    ->where("uht_user_id=$id");
        $stmp = $select->query();
        $res = $stmp->fetchAll();
        return $res[0];    
        }
}
