
<?php
session_start();
require_once ("../model/dbconn.php");
require_once ("../model/pos.php");
require_once ("../utility/ChromePhp.php");

$method=$_POST['method'];

if( isset( $_SERVER['HTTP_X_REQUESTED_WITH'] ) && ( $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' ) )
{
	
	
	if($method == 'save_expense'){
			$pos = new pos();

			$ExpenseId=($_POST['ExpenseId']);
			$ExpenseType=($_POST['ExpenseType']);
			$ExpenseAmount=$_POST['ExpenseAmount'];
			$ExpenseDescription=$_POST['ExpenseDescription'];
			$ExpenseIsActive='1';
			$ExpenseCreatedOn= date('Y-m-d H:i:s');  //1000-01-01 00:00:00
			$ExpenseCreatedBy = 'Ramzan';//$_SESSION['id'];
			$ExpenseOperation = $_POST['crud'];
            

           

			if( $ExpenseOperation== 'C'){
				$array = $pos->addExpense($ExpenseType,$ExpenseAmount,$ExpenseDescription,$ExpenseIsActive,$ExpenseCreatedOn,$ExpenseCreatedBy);
			}else if($ExpenseOperation == 'U'){
				 $array = $pos->updateExpense($ExpenseId,$ExpenseType,$ExpenseAmount,$ExpenseDescription,$ExpenseIsActive,$ExpenseCreatedOn,$ExpenseCreatedBy);
			}

			$result['result'] = $array[0];
			$result['error'] = $array[1];
			$result['crud'] = $ExpenseOperation;
			echo json_encode($result);
		
	}else if($method == 'delete_expense'){
		$p_id=strtoupper($_POST['p_id']);
		$pos = new pos();
		$array = $pos->deleteExpense($p_id);
		$data['result'] = $array[0];
		$data['error'] = $array[1];
		echo json_encode($data);
	}else if($method == 'getExpenses'){
		$pos = new pos();
		$array = $pos->getListExpense();
		$data = $array[1];
		$i=0;
		foreach ($data as $key) {

			$data[$i]['buttons'] = '
			<button type="submit" p_id="'.$key['id'].'" p_amount="'.$key['amount'].'" p_desc="'.$key['description'].'"  class="btn btn-primary btneditexpense btn-sm " id="btnEditExpense'.$key['id'].'"  ><i class="fa fa-edit"></i>
			</button>
			<button type="submit" p_id="'.$key['id'].'" p_desc="'.$key['description'].'" class="btn  btn-danger btndeleteexpense  btn-sm " id="btnDeleteExpense'.$key['id'].'" ><i class="fa fa-remove"></i>
				</button';


				$i++;
		}
		$datax = array('data' => $data);
		echo json_encode($datax);
	} else {
		exit('No direct access allowed.');
	}
}

?>
