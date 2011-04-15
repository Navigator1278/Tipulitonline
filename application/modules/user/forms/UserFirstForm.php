<?php
require_once 'countries.php';
class User_Form_UserFirstForm extends Zend_Form{




    public $formDecorators = array(
      array('FormElements'),
      array('Form'),
    );

    public $buttonDecorators = array(
        array('ViewHelper'),
        array('HtmlTag',array('tag'=>'p')),
    );

    public $elementDecorators = array(
        array('Label'),
         array('ViewHelper'),
        array('Errors'),
        array('HtmlTag', array('tag' => 'li'))
    );

    public function init(){

        
        //setting  method and action of the form
        $this->setAction('/user/registration/first-form/')
                ->setAttrib('enctype','multipart/form-data')
                ->setDecorators($this->formDecorators)
                ->setMethod('post');

        //firstname field
        $firstName = new Zend_Form_Element_Text('firstname', array(
            'required'=>true,
            'label'   => 'שם פרטי:',
            'maxLength' => '30',
            'validators' => array(
                                array('stringLength', false, array(3,100)),
                                array('Alpha'),
                                ),
       ));
        $firstName->setDecorators($this->elementDecorators);

        //last- or familyname field
        $familyName = new Zend_Form_Element_Text('familyname', array(
            'required' => true,
            'label' => 'שם משפחה:',
            'validators' => array(
                                array('stringLength', false, array(3,100)),
                                array('Alpha'),
                                ),
        ));
        $familyName->setDecorators($this->elementDecorators);

        // status field goes here
        /*
         * TODO
         */

        //selecting gender: Male (1) or Female (0)
        $gender = new Zend_Form_Element_Radio('sex', array(
           'required' => true,
           'label' => 'מין:',
           'separator' =>'',
           'multiOptions' => array('1'=>'זכר ','0'=>'נקבה'),
        ));
        $gender->setDecorators($this->elementDecorators);

        //birthday field: validation for yyyy-mm-dd input
        $birthday = new Zend_Form_Element_Text('datepicker', array(
            'required' => true,
            'label' => 'שנת לידה:',
            'size' => 10,
        ));
        $birthday->setDecorators($this->elementDecorators);
        $birthday->addValidator(new Zend_Validate_Date());

        $weight = new Zend_Form_Element_Select('weight', array(
            'label' => 'שקל',
          ));
        for ($i=20;$i<=300;$i++) $weight->addMultiOption($i,$i);
        $weight->setDecorators($this->elementDecorators);


        $heigth = new Zend_Form_Element_Select('heigth', array(
            'label' => 'גובה:',
         ));
        for ($i=120;$i<=300;$i++) $heigth->addMultiOption($i,$i);
        $heigth->setDecorators($this->elementDecorators);


//email field with validation
        $email = new Zend_Form_Element_Text('email',array(
           'required' => true,
           'size' => 50,
           'label' => 'אימייל: '
        ));
        $email->addValidator(new Zend_Validate_EmailAddress());
        $email->addValidator(new Zend_Validate_Db_NoRecordExists(array(
                'table'=>'users','field'=>'u_email')));
        $email->setDecorators($this->elementDecorators);


                // password field
        $password1 = new Zend_Form_Element_Password('password1', array(
            'required' => true,
            'size' => 50,
            'label' => 'סיסמא',
        ));
        $password1->setDecorators($this->elementDecorators);

        // password confirmation field
        $password2 = new Zend_Form_Element_Password('password2', array(
            'required' => true,
            'size' => 50,
            'label' => 'אימות סיסמא',
        ));
        $password2->addValidator(new User_Form_UserFirstFormPasswordValidator('password1'));
        $password2->setDecorators($this->elementDecorators);
        
        $country_list = $this->getCountriesList();

        $state = new Zend_Form_Element_Select('state', array(
            'requred' => true,
            'label' => 'מדינה:',
        ));
        $state->setMultiOptions(array($country_list));
        $state->setDecorators($this->elementDecorators);

        $address = new Zend_Form_Element_Text('address', array(
            'required' => false,
            'size' => 50,
            'label' => 'כתובת מלאה:',
        ));
        $address->setDecorators($this->elementDecorators);

        //selecting gender: Male (1) or Female (0)
        $pregnant = new Zend_Form_Element_Radio('pregnant', array(
            'label' => 'לנשים: האם את בהריון?',
            'separator' =>'',
            'multiOptions' => array('Yes'=>'Yes', 'No'=>'No'),
        ));
        $pregnant->setDecorators($this->elementDecorators);

        $pregnantSince = new Zend_Form_Element_Select('pregnantsince', array(
            'label' => 'מספר חודשים שעברו מהלידה האחרונה:',
        ));
        $pregnantSince->setMultiOptions(array(
            '1' => '1',
            '2' => '2',            
            '3' => '3',
            '4' => '4',
            '5' => '5',            
            '6' => '6',            
            '7' => '7',            
            '8' => '8',            
            '9' => '9',            
        ));
        $pregnantSince->setDecorators($this->elementDecorators);

        $objectives = new Zend_Form_Element_Textarea('objectives', array(
            'label' => 'מהן המטרות שלך בתרגול איתנו?',
        ));

        $terms = new Zend_Form_Element_Checkbox('terms', array(
           'label' => "<a target='new' href='http://lc.tipulitonline.co.il/pages/takanon.html'>אישור הסכמה לתנאים וההגבלות</a>",
            'required' => 'true,'
        ));
        $terms->setDecorators($this->elementDecorators);
        $terms->addDecorator('Label',array('escape'=>false));
        $terms->addValidator(new User_Form_UserTermsConditionsValidator());

        //submit the form
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setLabel('שלח ');

         $this->addElements(array($firstName,$familyName,$gender,$weight,$heigth,
                        $birthday,$email,$password1,$password2,$state,
                        $address,$pregnant,$pregnantSince,$objectives,$terms,
                        $submit));
    }

    public function getCountriesList(){

        return $country_list = array(
            "Afghanistan",
		"Albania",
		"Algeria",
		"Andorra",
		"Angola",
		"Antigua and Barbuda",
		"Argentina",
		"Armenia",
		"Australia",
		"Austria",
		"Azerbaijan",
		"Bahamas",
		"Bahrain",
		"Bangladesh",
		"Barbados",
		"Belarus",
		"Belgium",
		"Belize",
		"Benin",
		"Bhutan",
		"Bolivia",
		"Bosnia and Herzegovina",
		"Botswana",
		"Brazil",
		"Brunei",
		"Bulgaria",
		"Burkina Faso",
		"Burundi",
		"Cambodia",
		"Cameroon",
		"Canada",
		"Cape Verde",
		"Central African Republic",
		"Chad",
		"Chile",
		"China",
		"Colombi",
		"Comoros",
		"Congo (Brazzaville)",
		"Congo",
		"Costa Rica",
		"Cote d'Ivoire",
		"Croatia",
		"Cuba",
		"Cyprus",
		"Czech Republic",
		"Denmark",
		"Djibouti",
		"Dominica",
		"Dominican Republic",
		"East Timor (Timor Timur)",
		"Ecuador",
		"Egypt",
		"El Salvador",
		"Equatorial Guinea",
		"Eritrea",
		"Estonia",
		"Ethiopia",
		"Fiji",
		"Finland",
		"France",
		"Gabon",
		"Gambia, The",
		"Georgia",
		"Germany",
		"Ghana",
		"Greece",
		"Grenada",
		"Guatemala",
		"Guinea",
		"Guinea-Bissau",
		"Guyana",
		"Haiti",
		"Honduras",
		"Hungary",
		"Iceland",
		"India",
		"Indonesia",
		"Iran",
		"Iraq",
		"Ireland",
		"Israel",
		"Italy",
		"Jamaica",
		"Japan",
		"Jordan",
		"Kazakhstan",
		"Kenya",
		"Kiribati",
		"Korea, North",
		"Korea, South",
		"Kuwait",
		"Kyrgyzstan",
		"Laos",
		"Latvia",
		"Lebanon",
		"Lesotho",
		"Liberia",
		"Libya",
		"Liechtenstein",
		"Lithuania",
		"Luxembourg",
		"Macedonia",
		"Madagascar",
		"Malawi",
		"Malaysia",
		"Maldives",
		"Mali",
		"Malta",
		"Marshall Islands",
		"Mauritania",
		"Mauritius",
		"Mexico",
		"Micronesia",
		"Moldova",
		"Monaco",
		"Mongolia",
		"Morocco",
		"Mozambique",
		"Myanmar",
		"Namibia",
		"Nauru",
		"Nepa",
		"Netherlands",
		"New Zealand",
		"Nicaragua",
		"Niger",
		"Nigeria",
		"Norway",
		"Oman",
		"Pakistan",
		"Palau",
		"Panama",
		"Papua New Guinea",
		"Paraguay",
		"Peru",
		"Philippines",
		"Poland",
		"Portugal",
		"Qatar",
		"Romania",
		"Russia",
		"Rwanda",
		"Saint Kitts and Nevis",
		"Saint Lucia",
		"Saint Vincent",
		"Samoa",
		"San Marino",
		"Sao Tome and Principe",
		"Saudi Arabia",
		"Senegal",
		"Serbia and Montenegro",
		"Seychelles",
		"Sierra Leone",
		"Singapore",
		"Slovakia",
		"Slovenia",
		"Solomon Islands",
		"Somalia",
		"South Africa",
		"Spain",
		"Sri Lanka",
		"Sudan",
		"Suriname",
		"Swaziland",
		"Sweden",
		"Switzerland",
		"Syria",
		"Taiwan",
		"Tajikistan",
		"Tanzania",
		"Thailand",
		"Togo",
		"Tonga",
		"Trinidad and Tobago",
		"Tunisia",
		"Turkey",
		"Turkmenistan",
		"Tuvalu",
		"Uganda",
		"Ukraine",
		"United Arab Emirates",
		"United Kingdom",
		"United States",
		"Uruguay",
		"Uzbekistan",
		"Vanuatu",
		"Vatican City",
		"Venezuela",
		"Vietnam",
		"Yemen",
		"Zambia",
		"Zimbabwe"
	);
    }
}