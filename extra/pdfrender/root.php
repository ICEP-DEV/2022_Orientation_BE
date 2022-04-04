<?php

require '../include/sessions.php';



class Admin extends Session{

	private $context;
	private $add;
	private $id;
	private $userReportId;
	private $FILE;

	function __construct($context, $add = "", $id = 0){

		parent::__construct();

		$this->context = $context;
		$this->id = $this->getUserId();
		$this->add = $add;

		if(!$this->isAdmin()){

			$this->error("You Do Not Have Permission For This Action");

		}

		switch ($this->context) {
			case 1:

					$this->addMoreCourses();

				break;

			case 2 :
				
			    $this->getAllUsers();

			   break;

			case 3 : 

					$this->userReportId = $id;

					$this->demote();

			case 4 : 

					$this->userReportId = $id;

					$this->deleteAccount();

				break;

			case 5 :
					
					$this->loadFacs();

				break;

			case 6 :
					
					$this->loadSubjects();

				break;

			case 7 :

				$this->subjectExtraction($_POST['Subjects']);
								
				break;

			case 8 :

				$this->removeCourse();
								
				break;
			
			default:

					$this->error("Incomplete Request");

				break;
		}

	}
/*695*/
	private function loadFacs(){
		
		
			$facs = $this->rows("SELECT DISTINCT a.fac_id, a.fac_name " 
			."FROM c_faculty a,auth_admin b,cc_university c,u_campus d,mid_facultycamp e "
			."WHERE b.adm_univAlign = c.uni_id "
			."AND c.uni_id = d.uni_id "
			."AND d.cam_id = e.fac_cam_cam_id "
			."AND e.fac_cam_fac_id = a.fac_id ");
		
			
			while($facsRows = $this->assoc($facs))
			{
				$respf['facs'][] = $facsRows;
			}

			if(!isset($respf))
			{
				$respf['error'] = isset($respf['facs']) ? false : true;
				$respf['message'] = isset($respf['facs']) ? 'Courses Found' : 'Faculities Not Found';
			}

			echo json_encode($respf);

			exit();
			return;
	}

	private function loadSubjects()
	{
		$subject = $this->rows("SELECT sub_code,sub_name FROM cc_subject");

		while($subsRows = $this->assoc($subject))
			{
				$respf['subs'][] = $subsRows;
			}

			if(!isset($respf))
			{
				$respf['error'] = isset($respf['subs']) ? false : true;
				$respf['message'] = isset($respf['subs']) ? 'Courses Found' : 'Courses Not Found';
			}

			echo json_encode($respf);

			exit();
			return;


	}


	private function addMoreCourses(){
		$cous = $this->rows("SELECT DISTINCT `cou_id`,`cou_name` "
		."FROM c_faculty a,auth_admin b,cc_university c,u_campus d,mid_facultycamp e,f_course g "
		."WHERE b.adm_univAlign = c.uni_id "
		."AND c.uni_id = d.uni_id "
		."AND d.cam_id = e.fac_cam_cam_id "
		."AND e.fac_cam_fac_id = a.fac_id "
		."AND g.fac_id = a.fac_id ");
		
			
			while($cousRows = $this->assoc($cous))
			{
				$respf['cous'][] = $cousRows;
			}

			if(!isset($respf))
			{
				$respf['error'] = isset($respf['cous']) ? false : true;
				$respf['message'] = isset($respf['cous']) ? 'Courses Found' : 'Courses Not Found';
			}

			echo json_encode($respf);

			exit();
			return;

	}

	private function getAllUsers(){

		$users = $this->rows("SELECT * FROM cc_user WHERE eu_type = 'user'");

		while($user = $this->assoc($users)){

			$resp['users'][] = $user;

		}

		$resp['error'] = isset($resp['users']) ? false : true;
		$resp['message'] = isset($resp['users']) ? 'Users Found' : 'Users Not Found';

		echo json_encode($resp);
		exit();
		return;

	}


	private function demote()
	{
	
		if($this->update("UPDATE cc_user SET eu_type = 'user' WHERE eu_id = '$this->id'"))
		{
			if($this->delete("DELETE FROM auth_admin WHERE eu_id = '$this->id'"))
			{
				echo json_encode(array("error" => false));
				exit();
			}
			else
			{
				$this->error("Could't Demote your account try logining out and loginging in");
			}
		}
		else
		{
			$this->error("Could't Demote your account try logining out and loginging in");
		}
	}


	private function deleteAccount(){

		if($this->delete("DELETE FROM cc_user WHERE eu_id = '$this->userReportId'")){

			echo json_encode(array("error" => false, "message" => "User Deleted Successfully"));
			exit();

		}else{

			$this->error("Unable To Delete This User");

		}

	}

	private function removeCourse()
	{
		if(isset($_POST['c_name']))
		{
			$coursName = $_POST['c_name'];
			$coursRow = $this->row("SELECT cou_id FROM f_course WHERE cou_name = '$coursName'");
			$coursId = $coursRow['cou_id'];

			if(!$this->delete("DELETE FROM mid_coursesubject WHERE cou_sub_cou_id = '$coursId'"))
			{
				$this->error("Could'nt remove the course's subjects");	
			}

			if(!$this->delete("DELETE FROM f_course WHERE cou_id = '$coursId'"))
			{
				$this->error("Couldn't remove the course from the database".$coursId);
			}

			$this->error("Course was removed successfully");
			
		}
		else
		{
			$this->error("There was a error retrieving the selected course");
		}

	}

	private function getName($n) {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$randomString = '';
	
		for ($i = 0; $i < $n; $i++) {
			$index = rand(0, strlen($characters) - 1);
			$randomString .= $characters[$index];
		}
	
		return $randomString;
	}
	
	
	
	private function cou_idGenerate()
	{
		$eu_idVar = "donon";
		while(true)
		{
			$eu_idVar = $this->getName(10);
			if($this->count("SELECT count(cou_id) FROM f_course WHERE cou_id = '$eu_idVar'") < 1)
			{
				break;
			}
		}
		return $eu_idVar;
	}
	

	private function AddCourse($cou_name,$fac_name,$cou_aps,$subname,$sublevel)
	{
		$course_id = $this->cou_idGenerate();
	

		$this->insert("INSERT INTO f_course VALUES(DEFAULT,'$course_id','$cou_name','$fac_name',$cou_aps)");

		for ($i = 0; $i < count($subname); $i++)
		{
			$subject_id = $this->row("SELECT sub_id FROM cc_subject WHERE sub_code = '$subname[$i]'");
			$s_id = $subject_id['sub_id'];

			$this->insert("INSERT INTO mid_coursesubject VALUES(DEFAULT,'$s_id','$course_id',$sublevel[$i])");
		}

		$this->error("Course Added Successfully");
			
	
	}

	private function subjectExtraction($subjectVals)
	{
		$cSubject = explode(',',$subjectVals);


		for($i = 0; $i < count($cSubject); $i++)
		{
			$sub_lev = explode(':',$cSubject[$i]);

			if(!isset($sub_lev[1]))
			{
				$this->error("Colon missing on subject ".$i+1);
			}
		}

		//$subject_level[];

		for($i = 0; $i < count($cSubject); $i++)
		{
			$sub_lev = explode(':',$cSubject[$i]);
			
			$subject_level[$i]  = $sub_lev[1];

			if(!is_numeric($sub_lev[1]))
			{	
				$this->error("Missing level on subject ".$i+1);
			}
			else
			{
				if($sub_lev[1] > 7)
				{
					$this->error("Level above 7 is not allowed which has be assigned to subject ".$i+1);
				}
			}
		}

		for($i = 0; $i < count($cSubject); $i++)
		{
			$sub_lev = explode(':',$cSubject[$i]);

			$subject_name[$i] = $sub_lev[0];

			if(strlen($sub_lev[0]) > 8)
			{
				$this->error("Too long code of subject ".$i+1);
			}

			if(strlen($sub_lev[0]) < 3)
			{
				$this->error("Too short code of subject ".$i+1);
			}
			
			
			if(!ctype_alpha($sub_lev[0]))
			{
				$this->error("Incorrect code of subject ".$i+1);
			}

			$result = $this->row("SELECT sub_code FROM cc_subject WHERE sub_code = '$sub_lev[0]'");
			
			if(!isset($result['sub_code']))
			{
				$this->error("Subject ".($i +1)." couldn't be found from the database click i above to refer codes");
			}

			if(isset($_POST['APS']))
			{

				if($_POST['APS'] == "")
				{
					$this->error("APS Score for the course is required");
				}


				if($_POST['APS'] < 10)
				{

					if($_POST['APS'] < 0)
					{
						$this->error("Invalid APS Score assigned to the course");
					}
					$this->error("APS Score for the course can not be below 10");
				}

				if($_POST['APS'] > 60)
				{
					$this->error("APS Score for the course can not be above 60".$_POST['APS'] );
				}
			}
			else
			{
				$this->error("APS Score for the course is required");
			}

			if(isset($_POST['courseName']))
			{
				if($_POST['courseName'] == "")
				{
					$this->error("Name of the course can't be empty");
				}

				
				if(is_numeric($_POST['courseName']))
				{
					$this->error("Numeric course name are not allowed");
				}
				
				$course_Name = $_POST['courseName']; 
				
				if($this->count("SELECT count(cou_id) FROM f_course WHERE cou_name = '$course_Name'") > 0)
				{
					$this->error("Course name already exist");
				}
							
				
				if(strlen($_POST['courseName']) < 5)
				{
					$this->error("Name of the course is too short");
				}

				if(strlen($_POST['courseName']) > 90)
				{
					$this->error("Name of the course is too long");
				}
			}

			if(isset($_POST['Faculty']))
			{
				if($_POST['Faculty'] == "Not Set")
				{
					$this->error("Please set the faculty which the course will belong to");	
				}	
			}
		}

		for ($i=0; $i < count($subject_name); $i++) { 
			for ($x=0; $x < count($subject_name); $x++) { 
				if($x == $i)
				{
					continue;
				}
				
				
				if($subject_name[$i] == $subject_name[$x])
				{
					$this->error("Can't have repeating subjects as requirements");
				}
			}
		}

	
		$this->AddCourse($_POST['courseName'],$_POST['Faculty'],$_POST['APS'],$subject_name,$subject_level);
		
	}




}






if(isset($_POST['context'])){
	
	switch ($_POST['context']) {
		case 1:
			
					new Admin($_POST['context']);
	
			break;

		case 2 :
				
				new Admin($_POST['context']);
			
			break;

		case 3 : 
		
				 new Admin($_POST['context']);

		  break;

		case 4 : 
		
				new Admin($_POST['context'], "", $_POST['id']);

		  break;

		case 5 :
			
			 new Admin($_POST['context']);

			break;

		case 6 :
			
			new Admin($_POST['context']);
   
			break;

		case 7 :
			
			new Admin($_POST['context']);
	   
			break;

		case 8:
			
			new Admin($_POST['context']);
	   
			break;

		default:
	
			echo json_encode(array("error" => true, "message" => "Incomplete Request"));
					exit();
			break;
	}


}else{

	echo json_encode(array(

		"error" => true,
		"message" => "Invalid Request"
	));

	exit();

}

?>
