<?php  
// ========================================================================== INITIALIZE ==========================================================================

include '_config.php'; 
include '_include.php'; 


$obj = $task;
$securityObject = $obj->securityObject; // the value of security object is manually inserted to handle 
										// some modules that have different security object from that of their class
 
if(!$security->isAdminLogin($securityObject,10,true));
 
$addDataFile = 'taskForm';
 
$arrSarchColumn = array(
	'0' => array('Code', $obj->tableName . '.code'), 
	'1' => array('Task', $obj->tableName . '.task')   
); 		 
		
$arrColumn = array (
  '0' => array('Code','code',70,'true','left'),
  '1' => array('User','username',200,'true','left'),
  '2' => array('Task','task',250,'true','left'), 
  '3' => array('Duedate','duedate',130,'true','center','date'),
  '4' => array('Priority','priorityname',100,'true','left'), 
  '5' =>  array('Status','statusname','','true','left'),
);   
  

$overwriteContextMenu['print'] = '';

function generateQuickView($obj,$id){ 
	    
	$detail = '';
	   
	return $detail;  
}
 
// ========================================================================== STARTING POINT ==========================================================================
include ('dataList.php');
?>
