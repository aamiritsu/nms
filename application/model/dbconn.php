<?php
$dbuserx='pos';
$dbpassx='pos';
class dbconn {
	public $dblocal;
	public function __construct()
	{

	}
	public function initDBO()
	{
		global $dbuserx,$dbpassx;
		try {
			$this->dblocal = new PDO("mysql:host=localhost;dbname=pos;charset=latin1",$dbuserx,$dbpassx,array(PDO::ATTR_PERSISTENT => true));
			$this->dblocal->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		}
		catch(PDOException $e)
		{
			die("Can not connect database");
		}
		
	}
	
}
?>
