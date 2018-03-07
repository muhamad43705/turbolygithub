<?php 
include '_config.php';
include '_include.php';

$arrayToJs = array(); 

$userkey = $userkey = base64_decode($_SESSION[$class->loginAdminSession]['id']);

$rs = $task->searchData($task->tableName.'.userkey',$userkey,true,' and '.$task->tableName.'.duedate = curdate()');

$header = '
	<div class="table-data-list">
		<div class="div-table-row">
			<div class="div-table-col-5 col-header" style="width:30px">#</div>
	        <div class="div-table-col-5 col-header" style="width:70px">Code</div>
	        <div class="div-table-col-5 col-header" style="width:200px;" >User</div>
	        <div class="div-table-col-5 col-header" style="width:250px;" >Task</div>
	        <div class="div-table-col-5 col-header" style="width:130px; text-align:center">Duedate</div>
	        <div class="div-table-col-5 col-header" style="width:100px;" >Priority</div>
	        <div class="div-table-col-5 col-header">Status</div>
        </div>
	</div>
';
$content = '<div class="table data-record">';

for ($i=0;$i<count($rs);$i++) { 

	$content .='     
        <div class="div-table-row">
        	<div class="div-table-col-5" style="width:30px">'.($i+1).'</div>
	        <div class="div-table-col-5" style="width:70px">'.$rs[$i]['code'].'</div>
	        <div class="div-table-col-5" style="width:200px;">'.$rs[$i]['username'].'</div>
	        <div class="div-table-col-5" style="width:250px;">'.$rs[$i]['task'].'</div>
	        <div class="div-table-col-5" style="width:130px; text-align:center">'.$class->formatDbDate($rs[$i]['duedate']).'</div>
	        <div class="div-table-col-5" style="width:100px;" >'.$rs[$i]['priorityname'].'</div>
	        <div class="div-table-col-5">'.$rs[$i]['statusname'].'</div>
        </div>
    ';
}

$content .= '</div>';

$data = $header.$content;

$arrayToJs['message'] = 'You have '.count($rs).' tasks duedate today.';
$arrayToJs['data'] = $data;

echo json_encode($arrayToJs);   
die;

?>