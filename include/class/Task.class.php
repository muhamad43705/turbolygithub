<?php

class Task extends BaseClass{
  
    function Task(){ 

		parent::BaseClass();  
		$this->tableName = 'task';   
		$this->securityObject = 'task'; 
		$this->tableStatus = 'task_status';
		$this->tablePriority = 'task_priority';
		$this->tableUser = 'employee';

	 
   }
   
   function getQuery(){
	   
	   return '
				select
					'.$this->tableName. '.*,
					'.$this->tableStatus.'.status as statusname,
					'.$this->tablePriority.'.priority as priorityname,
					'.$this->tableUser.'.name as username
				from 
					'.$this->tableName . ','.$this->tableStatus.','.$this->tablePriority.','.$this->tableUser.'  
				where  		
					'.$this->tableName . '.statuskey = '.$this->tableStatus.'.pkey and
					 '.$this->tableName . '.prioritykey = '.$this->tablePriority.'.pkey and
					 '.$this->tableName . '.userkey = '.$this->tableUser.'.pkey
 		' .$this->criteria ; 
		 
    }
	
	
    function addData($arrParam){   
		$arrayToJs =  array();
	
		try{		 
					
			$arrayToJs = $this->validateForm($arrParam);
				if (!empty($arrayToJs)) 
					return $arrayToJs;
					 
				  
			if (!$this->oDbCon->startTrans())
				throw new Exception($this->errorMsg[100]);
				
			$pkey = $this->getNextKey($this->tableName);  
			$usecode = $this->useAutoCode($this->tableName); 
	 
			if($usecode == 1)  
				$arrParam['code'] =  $this->getNewCode($this->tableName);  
			 
			$sql = '
					INSERT INTO		
					 '.$this->tableName .' (
						pkey, 
						code, 
						userkey,
						task, 
						duedate,
						prioritykey,
						statuskey, 
						description,
						createdby,
						createdon
					)
					VALUES	( 
						'.$pkey.', 
						'.$this->oDbCon->paramString($arrParam['code']).',   
						'.$this->oDbCon->paramString($arrParam['selUserKey']).', 
						'.$this->oDbCon->paramString($arrParam['task']).',  
						'.$this->oDbCon->paramDate($arrParam['txtDueDate'],' / ').',    
						'.$this->oDbCon->paramString($arrParam['selPriority']).',    
						'.$this->oDbCon->paramString($arrParam['selStatus']).' , 
						'.$this->oDbCon->paramString($arrParam['txtDescription']).',
						'.$this->oDbCon->paramString($arrParam['createdBy']).', 
						now()   
					)
			';
			 
		    $this->oDbCon->execute($sql);  
			
            $this->setTransactionLog('add',$pkey);
            
			$this->oDbCon->endTrans(); 
			$this->addErrorList($arrayToJs,true,$this->lang['dataHasBeenSuccessfullyUpdated']);   
	 
		}catch(Exception $e){
			$this->oDbCon->rollback();
			$this->addErrorList($arrayToJs,false,$e->getMessage());   
		}			
			
		return $arrayToJs; 
	} 
	
	
	function editData($arrParam){    
	
		$arrayToJs =  array();
		
		try{		
	  	 	
			$arrayToJs = $this->validateForm($arrParam,$arrParam['hidId']);
			if (!empty($arrayToJs)) 
					return $arrayToJs;
					
			if (!$this->oDbCon->startTrans())
				throw new Exception($this->errorMsg[100]); 				 
				 
			$sql = '
						UPDATE	
						 '.$this->tableName .'
						SET	  
							  
						 task ='.$this->oDbCon->paramString($arrParam['task']).',  
						 code ='.$this->oDbCon->paramString($arrParam['code']).', 
						 userkey = '.$this->oDbCon->paramString($arrParam['selUserKey']).',
						 duedate = '.$this->oDbCon->paramDate($arrParam['txtDueDate'],' / ').', 
                         prioritykey = '.$this->oDbCon->paramString($arrParam['selPriority']).',
                         statuskey = '.$this->oDbCon->paramString($arrParam['selStatus']).',
                         description ='.$this->oDbCon->paramString($arrParam['txtDescription']).',
						 modifiedby = '.$this->oDbCon->paramString($arrParam['modifiedBy']).',
						 modifiedon = now() 
						WHERE	
						 pkey = '.$this->oDbCon->paramString($arrParam['hidId']).'
						
				';    
				 
                $this->oDbCon->execute($sql);                
  
                $this->setTransactionLog('edit',$arrParam['hidId']);
            
				$this->oDbCon->endTrans();  
				$this->addErrorList($arrayToJs,true,$this->lang['dataHasBeenSuccessfullyUpdated']);   
			
		}catch(Exception $e){
			$this->oDbCon->rollback();
			$this->addErrorList($arrayToJs,false,$e->getMessage());  
		}			
			
		return $arrayToJs; 
	}  
	
	 function validateForm($arr,$pkey = ''){
		
        global $_IMAGE_MAX_SIZE;
         
		$arrayToJs = array();
		
	 	$code = $arr['code'];
		$task = $arr['task'];  
         
	 	$rs = $this->isValueExisted($pkey,'code',$code);	 
		if(empty($code)){
			$this->addErrorList($arrayToJs,false,$this->errorMsg['code'][1]);
		}else if(count($rs) <> 0){
			$this->addErrorList($arrayToJs,false,$this->errorMsg['code'][2]);
		}
		
		$rs = $this->isValueExisted($pkey,'task',$task);	 
		if(empty($task)){
			$this->addErrorList($arrayToJs,false,$this->errorMsg['task'][1]);
		}else if(count($rs) <> 0){
			$this->addErrorList($arrayToJs,false,$this->errorMsg['task'][2]);
		}
		  
		return $arrayToJs;
	 }	
	 
	 function delete($id){
		 
		try{			
				  
				$arrayToJs =  array();
			 	
				if (!$this->oDbCon->startTrans())
					throw new Exception($this->errorMsg[100]);
			
		 		 
				$sql = 'delete from  '.$this->tableName.' where pkey = ' . $this->oDbCon->paramString($id);
				$this->oDbCon->execute($sql);  
        
				$this->oDbCon->endTrans(); 
				$this->addErrorList($arrayToJs,true,$this->lang['dataHasBeenSuccessfullyUpdated']);    
			 
				
			}catch(Exception $e){
				$this->oDbCon->rollback();
				$this->addErrorList($arrayToJs,false, $e->getMessage()); 
		}			
			
		return $arrayToJs;	
	}

	function getAllPriority() { 
	 	 
		$sql = '
				select 
					*
				from 
					'.$this->tablePriority.'
				order by
					pkey asc
			';
			
		return $this->oDbCon->doQuery($sql); 
	 
	}  
	    
}

?>
