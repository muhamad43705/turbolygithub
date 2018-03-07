<script>
jQuery(document).ready(function(){  
		   $( "#main-menu .root" ).click(function() { 
               if ($(this).hasClass("root-active"))  
                   return;
                   
              $("#main-menu .submenu-panel-" + $("#main-menu .root-active").attr("rel")).hide(400 ,"linear");  
              $("#main-menu .root-active" ).removeClass("root-active");

              $(this).addClass("root-active"); 
              $("#main-menu .submenu-panel-" + $(this).attr("rel")).show(400 ,"linear");   

           });
});
</script>
<?php 
		 	    
    function pushMenuItem(&$arrMenuItem,$newMenuItem){
         global $security;
        
         $userkey =  base64_decode($_SESSION[$security->loginAdminSession]['id']); 
     
            //$security->setLog($newMenuItem['label']);
         if ( isset($newMenuItem['menu']) && count($newMenuItem['menu'][0]) == 0){ 
             return;
         } 
         
         if ( !empty($newMenuItem['securityObject']) &&  !$security->hasSecurityAccess( $userkey ,$security->getSecurityKey($newMenuItem['securityObject']),10) ) 
                 return;
             
         array_push($arrMenuItem ,$newMenuItem);
        
    }

    function buildMenu($arrMenu,$parent = '' ){ 
          
            $menu = '';
            
	        
            foreach ($arrMenu as $key=>$menuItem) { 
                
                    
                $class = "submenu";
                if (empty($parent))
                        $class="root hvr-sweep-to-right ";
                
                else if (isset($menuItem['menu']))
                         $class .= " submenu-header";
                
                $icon = '';
                if (!empty($menuItem['icon']))
                    $icon = '<div class="'.$menuItem['icon'].' icon"></div>';
                
                if (!empty($menuItem['phplist'])){
                    $menu .= '<div class="'.$class.' menu-child clickable" rel="'.$key.'" reladdr="'.$menuItem['phplist'].'" reltarget="'.$menuItem['target'].'">'.$icon.$menuItem['label'].'</div>';
                }else{
                    $menu .= '<div class="'.$class.' clickable" rel="'.$key.'">'.$icon.$menuItem['label'].'</div>';
                }
                
                if (isset($menuItem['menu'])){
                    if (empty($parent)) 
                        $menu .= '<div class="submenu-panel-'.$key.' submenu-panel">';
                     
                     
                    foreach ($menuItem['menu'] as $menuItemRow)  
                         $menu .= buildMenu($menuItemRow,$menuItem); 
                     
                    if (empty($parent)) 
                        $menu .= '</div>';
                } 
                 
            }
            
            

            if (empty($parent)) 
                $menu  .= '<div class="main-menu-closer"></div>';

            return $menu;
    }

	$menu = '';	 

    $arrMenu = array(); 

    $arrUser = array ('label' => 'User', 'icon' => 'fa fa-users', 'securityObject' => $employee->securityObject,   'phplist' => 'employeeList', 'target' => 'tab'   );  
    pushMenuItem ($arrMenu, $arrUser); 

    $arrTask = array ('label' => 'Task', 'icon' => 'fa fa-calendar', 'securityObject' => $task->securityObject,   'phplist' => 'taskList', 'target' => 'tab'   );  
    pushMenuItem ($arrMenu, $arrTask); 
 
 
    $menu = buildMenu($arrMenu);  
 
    echo $menu; 
?>
