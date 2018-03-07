<?php
include '_config.php';
include '_include.php';

$obj = $employee;

if (empty($_SESSION[$class->loginAdminSession]['id']))  
    die;
 

$editCategoryInactiveCriteria = '';
$editWarehouseInactiveCriteria = '';

$id = base64_decode($_SESSION[$class->loginAdminSession]['id']);
$rs = $obj->getDataRowById($id);
$_POST['hidId'] = $rs[0]['pkey'];
$_POST['memberCode'] = $rs[0]['code'];
$_POST['memberUserName'] = $rs[0]['username'];
$_POST['selStatus'] = $rs[0]['statuskey']; 
$_POST['memberName'] = $rs[0]['name']; 

$_POST['action'] = 'edit';


$arrStatus = $obj->convertForCombobox($obj->getAllStatus(),'pkey','status');   


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
				memberName: { 
					validators: {
						notEmpty: {
							message: phpErrorMsg.name['1']
						}, 
					}
				}, 
				currentPassword: { 
					validators: {
						 notEmpty: {
							message: phpErrorMsg.password['1'],
						}, 
						stringLength: {
							min: 5,
							max: 30,
							message: phpErrorMsg.password['2']
						},
						remote: {
							message: phpErrorMsg.username['5'],
							url: 'updateProfile.php',
							data: {
								type: 'check',
								fieldtype: 'checkPassword'
							},
						type: 'POST'
						}
					}
				},
				
				memberPassword: { 
						validators: {
						   
							stringLength: {
								min: 5,
								max: 30,
								message: phpErrorMsg.password['2']
							}, 
							identical: {
								field: 'passwordConfirmation',
								message: phpErrorMsg.password['3']
							}
						}
					},  
					
					passwordConfirmation: { 
						validators: {
						   
							stringLength: {
								min: 5,
								max: 30,
								message: phpErrorMsg.password['2']
							}, 
							identical: {
								field: 'memberPassword',
								message: phpErrorMsg.password['3']
							}
						}
					},
					
					
			}
			
        })
        .on('success.form.bv', function(e) {
             
            // Prevent form submission
            e.preventDefault();
 
             
			 // Get the form instance
             var $form = $(e.target);

             var btnSave = $form.find("[name=btnSave]");

    
             btnSave.prop('disabled', true);
             btnSave.find(".loading-icon").show();


            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data 
			 $.post($form.attr('action'), $form.serialize(), function(result) {  
 
				alert(phpLang.dataHasBeenSuccessfullyUpdated);
				btnSave.prop('disabled', false);
				btnSave.find(".loading-icon").hide();  
				bv.resetForm();
				$("input[type=password], currentPassword").val("");
				$("input[type=password], memberPassword").val("");
				$("input[type=password], passwordConfirmation").val("");
            }, 'json');
        });

        $("[name=btnRefresh]").click(function(){  
            $.ajax({
                type: "GET",
                url:  'getTaskToday.php',  
                success: function(data){  
                        data = JSON.parse(data); 
                        alert(data.message);
                        $("#tasktoday").html(data.data);
                } 
            });
        });


        $("[name=btnRefresh]").click();

		
});
	
	 
	  
</script>
</head> 

<body>
<div style="width:100%; margin:auto; " class="tab-panel-form">   
  <div class="notification-msg"></div>
   <form id="defaultForm" method="post" class="form-horizontal" action="updateProfile.php">
       	<?php echo $obj->input('hidden','hidId'); ?>
    <?php echo $obj->input('hidden','action'); ?>
     
     <div class="div-table" style="width:100%; ">
                <div class="div-table-row">
                    <div class="div-table-col"  style="width:49%; text-align:center">
                     		<div class="div-table-tab-form" style="float:left;"> 
                                      <div class="div-table-caption border-orange">Informasi Akun</div>
                                     
                                      <div class="div-table-row form-group">
                                       
                                        <div class="div-table-col-5  div-table-col-header">
                                            <label class="col-lg-1 control-label">Status</label>
                                        </div> 
                                        
                                        <div class="div-table-col-5">
                                            <div class="col-lg-12"> 
                                                    <?php echo  $obj->inputSelect('selStatus', $arrStatus, true,0,'disabled="disabled"'); ?>
                                            </div>
                                        </div> 
                                        
                                     </div>
                                     
                                
                            
                                     <div class="div-table-row form-group">
                                        <div class="div-table-col-5" >
                                            <label class="col-lg-1 control-label">Kode</label>
                                        </div> 
                                        <div class="div-table-col-5">
                                            <div class="col-lg-12"> 
                                                 <?php echo  $obj->input('text','memberCode',true,'','readonly="readonly"', 'form-control readonly') ?>
                                            </div>
                                        </div> 
                                     </div>
                                    
                                     <div class="div-table-row form-group">
                                        <div class="div-table-col-5" >
                                            <label class="col-lg-1 control-label">Username</label>
                                        </div> 
                                        <div class="div-table-col-5">
                                            <div class="col-lg-12"> 
                                                  <?php echo $obj->input('text','memberUserName',true,'','readonly="readonly"'); ?>
                                            </div>
                                        </div> 
                                     </div>
                                     
                                     <div class="div-table-row form-group">
                                        <div class="div-table-col-5" >
                                            <label class="col-lg-1 control-label">Password Lama</label>
                                        </div> 
                                        <div class="div-table-col-5">
                                            <div class="col-lg-12"> 
                                                  <?php echo $obj->input('password','currentPassword'); ?>
                                            </div>
                                        </div> 
                                     </div>
                                     <div class="div-table-row form-group">
                                        <div class="div-table-col-5" >
                                            <label class="col-lg-1 control-label">Password</label>
                                        </div> 
                                        <div class="div-table-col-5">
                                            <div class="col-lg-12"> 
                                                  <?php echo $obj->input('password','memberPassword'); ?>
                                            </div>
                                        </div> 
                                     </div>
                                       
                                     <div class="div-table-row form-group">
                                        <div class="div-table-col-5" >
                                            <label class="col-lg-1 control-label">Konfirmasi Password</label>
                                        </div> 
                                        <div class="div-table-col-5">
                                            <div class="col-lg-12"> 
                                                  <?php echo $obj->input('password','passwordConfirmation'); ?>
                                            </div>
                                        </div> 
                                     </div>
                                    
                           </div>
                    </div> 
                    <div class="div-table-col"  style="width:2%;text-align:center;"></div>  
                    <div class="div-table-col"  style="width:49%;text-align:center">
                   		<div class="div-table-tab-form" style="float:left;"> 
                                  <div class="div-table-caption border-green">Informasi Data Diri</div>
                                 
                                 <div class="div-table-row form-group">
                                    <div class="div-table-col-5 div-table-col-header" >
                                        <label class="col-lg-1 control-label">Nama</label>
                                    </div> 
                                    <div class="div-table-col-5">
                                        <div class="col-lg-12"> 
                                              <?php echo $obj->input('text','memberName'); ?>
                                        </div>
                                    </div> 
                                 </div>
                                
                       </div>
                    </div> 
                </div>
        </div>
       
        <div style="clear:both"></div>
        
        <div class="form-button-panel" > 
         <?php   echo $obj->generateSaveButton(); ?> 
        </div> 
        
    </form>

    <div style="clear:both; height:2em"></div>

    <div class="div-table" style="width:100%; ">
        <div class="div-table-row">
            <div class="div-table-col"  style="width:100%; text-align:center">
                <div class="div-table-tab-form" style="float:left;">
                    <div class="div-table-caption border-blue">Task Today</div>
                    <div><?php echo $class->input('button','btnRefresh',false,$class->lang['refresh']); ?></div>
                    <div style="clear:both; height:2em"></div>
                    <div id="tasktoday"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
