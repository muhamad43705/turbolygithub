<?php 

include '_config.php'; 
include '_include.php'; 


$obj= $task;
$securityObject = $obj->securityObject; // the value of security object is manually inserted to handle 
										// some modules that have different security object from that of their class

if(!$security->isAdminLogin($securityObject,10,true));
    
$useAutoCode = $obj->useAutoCode($obj->tableName);
$formAction = 'taskList';

$parentPanelId = $_GET['selectedPanelId'];
$parentTitle = $_GET['title'];

$_POST['txtDueDate'] = date('d / m / Y');

if (!empty($_GET['id'])){ 
	$id = $_GET['id'];	
	$rs = $obj->getDataRowById($id);
	
	$_POST['hidId'] = $rs[0]['pkey'];
	$_POST['code'] = $rs[0]['code'];
  $_POST['selUserKey'] = $rs[0]['userkey'];
	$_POST['task'] = $rs[0]['task'];
  $_POST['txtDueDate'] = $obj->formatDBDate($rs[0]['duedate']);  
  $_POST['selPriority'] = $rs[0]['prioritykey'];
	$_POST['selStatus'] = $rs[0]['statuskey'];	
  $_POST['txtDescription'] = $rs[0]['description'];
	
	$_POST['action'] = 'edit';
}else{
	
	$_POST['action'] = 'add';
	
	if($useAutoCode == 1) 
		$_POST['code'] = 'XXXXXXXX';
}

$arrStatus = $obj->convertForCombobox($obj->getAllStatus(),'pkey','status');   
$arrPriority = $obj->convertForCombobox($obj->getAllPriority(),'pkey','priority');   
$arrUser = $class->convertForCombobox($employee->searchData('','',true, ' and ('.$employee->tableName.'.statuskey = 2 )'),'pkey','name');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title> 


<script type="text/javascript"> 	
	
	jQuery(document).ready(function(){  
		 $("#" + selectedTab.newPanel[0].id + " #defaultForm").attr("id","defaultForm-"+selectedTab.newPanel[0].id);  
		
		 $('#defaultForm-' + selectedTab.newPanel[0].id )
			.bootstrapValidator({ 
				feedbackIcons: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                task: { 
                    validators: {
                        notEmpty: {
                            message: phpErrorMsg.task[1]
                        }, 
                    }
                },  
				
				code: { 
                    validators: {
                        notEmpty: {
                            message: phpErrorMsg.code[1]
                        }, 
                    }
				},
				
				
            }
        })
        .on('success.form.bv', function(e) {
             submitForm(e, "<?php echo $parentPanelId; ?>","<?php echo $parentTitle; ?>"); 
        }); 

         $( "#" + selectedTab.newPanel[0].id + " [name=txtDueDate]" ).datepicker({ 
            currentText: 'Now',
            dateFormat:'dd / mm / yy', 
          });
		 
	});
			
</script>

</head> 

<body> 
<div style="width:100%; margin:auto; " class="tab-panel-form">   
  <div class="notification-msg"></div>
  
  <form id="defaultForm" method="post" class="form-horizontal" action="<?php echo $formAction; ?>">
   	<?php echo $obj->input('hidden','hidId'); ?>
    <?php echo $obj->input('hidden','action'); ?>
        
         <div class="div-table-tab-form" style="margin:auto; width:600px;">
         	 
              <div class="div-table-row form-group">
                <div class="div-table-col-5 div-table-col-header">
                    <label class="col-lg-1 control-label">Status</label>
                </div> 
                <div class="div-table-col-5">
                    <div class="col-lg-12"> 
                         <?php echo  $obj->inputSelect('selStatus', $arrStatus); ?>
                    </div>
                </div> 
             </div>
            
            
			 <?php if($useAutoCode == 1)    
 				$code = $obj->input('text','code',true,'','readonly="readonly"', 'form-control readonly');  
            else  
                $code =  $obj->input('text','code' );   ?>
        
	
             <div class="div-table-row form-group">
                <div class="div-table-col-5" >
                    <label class="col-lg-1 control-label">Code</label>
                </div> 
                <div class="div-table-col-5">
                    <div class="col-lg-12"> 
                         <?php echo  $code; ?>
                    </div>
                </div> 
             </div>

             <div class="div-table-row form-group">
                <div class="div-table-col-5" >
                    <label class="col-lg-1 control-label">User</label>
                </div> 
                <div class="div-table-col-5">
                    <div class="col-lg-12"> 
                           <?php echo  $obj->inputSelect('selUserKey', $arrUser); ?>
                    </div>
                </div> 
             </div>
            
             <div class="div-table-row form-group">
                <div class="div-table-col-5" >
                    <label class="col-lg-1 control-label">Task</label>
                </div> 
                <div class="div-table-col-5">
                    <div class="col-lg-12"> 
                          <?php echo $obj->input('text','task'); ?>
                    </div> 
                </div> 
             </div>  
             <div class="div-table-row form-group">
                <div class="div-table-col-5" >
                    <label class="col-lg-1 control-label">Duedate</label>
                </div> 
                <div class="div-table-col-5">
                    <div class="col-lg-12"> 
                          <?php echo $obj->input('text','txtDueDate',true,'','readonly="readonly"','form-control input-date'); ?>
                    </div> 
                </div> 
             </div>
             <div class="div-table-row form-group">
                <div class="div-table-col-5" >
                    <label class="col-lg-1 control-label">Priority</label>
                </div> 
                <div class="div-table-col-5">
                    <div class="col-lg-12"> 
                         <?php echo  $obj->inputSelect('selPriority', $arrPriority); ?>
                    </div> 
                </div> 
             </div> 
             <div class="div-table-row form-group">
                <div class="div-table-col-5" >
                    <label class="col-lg-1 control-label">Description</label>
                </div> 
                <div class="div-table-col-5">
                    <div class="col-lg-12"> 
                          <?php echo  $obj->inputTextArea('txtDescription',true,'','style="height:10em;"'); ?>
                    </div> 
                </div> 
             </div>
             
         </div>
          
 	   <div style="clear:both"></div>
        <div class="form-button-panel" >
        <?php if (empty($_GET['id']) || $_POST['selStatus'] == 1){ ?> 
       	<?php echo $obj->generateSaveButton(); ?> 
        <?php } else{
          echo "*If you want to edit, you must change status to 'open' from the list data.";
        }?>
        </div> 
        
    </form>  
</div> 
</body>

</html>
