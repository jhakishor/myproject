<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<head>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />
<title>Adaptivity - Blueprint4IT</title>
<script type="text/javascript" src="js/blueprint4it.js"></script>
<script type="text/javascript">


function formSubmit(){
	var formObj = document.getElementById("forgotPasswordForm");
	var returnVal = validateForm(formObj);
	if(returnVal){
		document.getElementById('enabledForgotPwd').style.display = 'none';
		document.getElementById('disabledForgotPwd').style.display = 'block';
		formObj.submit();
	}else{
		document.getElementById('enabledForgotPwd').style.display = 'block';
		document.getElementById('disabledForgotPwd').style.display = 'none';
	}
}
function makeFieldEmpty(obj){
	if((obj.ltrim()).rtrim().value == 'Email' || (obj.ltrim()).rtrim().value == 'Password'){
		obj.value = '';
	}
}

function validateForm(formObj){
	if((formObj.email.value.ltrim()).rtrim().length==0){
	//if(formObj.email.value.length==0){
		alert("Please enter your email address");
		formObj.email.focus();
	return false;
	}
	return true;
	}
</script>
<!--[if lte IE 6]>
<script type="text/javascript" src="js/supersleight-min.js"></script>
<![endif]-->

</head>
<body>
<div class="bodybg">
<div class="pagewrap">
	<div class="topnav">
 <%@ include file="../common/topMenu.jsp"%>  
    </div>
    <div class="content">		    	
		<div class="contentmain">
            <div class="innercontent-holder">
            
            
    <html:form action="/userforgetpassword" method="post"
    styleId="forgotPasswordForm" 
    onsubmit="return validateForm(this);">
	<table border="0" cellspacing="2" cellpadding="1" width="100%"
		class="signup">
		<tr>
			<td align="center"><font size="5">Retrieve your Password</font></td>
		</tr>
		<tr>
			<td align="center"><font color="red"><html:errors /></font></td>
		</tr>
		<tr>
			<td>
			<p>&nbsp</p>
			</td>
		</tr>
		<tr>
		<td align="center">Email:
		<html:text property="email" size="30" maxlength="30" /></td>
		</tr>
		<tr>
			<td>
			<p>&nbsp;</p>
			</td>
		</tr>
		<tr>

<!--			<td align="center"><html:submit>Send Me My Password</html:submit></td>-->
		<td align="center">
			<div style="align:middle">
				<img src="<%=request.getContextPath()%>/images/send_me_enabled_new.gif" border="0" alt="" title="" id="enabledForgotPwd" align="middle"
				style="display:block" onclick="formSubmit()" onMouseOver="style.cursor='hand'" />
				<img src="<%=request.getContextPath()%>/images/send_me_disabled_new.gif" border="0" alt="" title="" id="disabledForgotPwd" align="middle"
				style="display:none" onclick="formSubmit()" />
			</div>
		</td>
		</tr>
	</table>
</html:form>
            	
            	
            	
            	<!-- <div class="downloadimg"><img src="<%=request.getContextPath()%>/images/download-img.gif" border="0" alt="" title="" /></div> -->
                <!--  <div class="downloadimg-desc">
                	<div class="freetrial-download"><img src="<%=request.getContextPath()%>/images/freetrial-download.gif" border="0" alt="" title=""/></div>
                	<div class="download">
                        <a href="#"><img src="<%=request.getContextPath()%>/images/btn-download.gif" border="0" alt="" title=""/></a>
                        <span>(File Size:62 MB)</span>
                        </div>                        
                    	<p><span>Windows Minimum Requirments</span></p>
                        <ul>
                        	<li>-  A PC running Windows XP (Service Pack 2 or later), <br/>&nbsp;&nbsp;Windows Vista or Windows 7</li>
                            <li>-  233-MHz Pentium-class processor or better</li>
                            <li>- At least 128MB of RAM</li>                            
                            <li>&nbsp;</li>
                            <li><a href="#">- Macintosh Requirment</a></li>
                            <li><a href="#">- Linux Requirment</a></li>
                        </ul>                    
                </div> -->
            </div>           
        </div>
      
      <%@ include file="../common/rightSidePanel.jsp"%> 
      
    </div>
</div>
<%@ include file="../common/footerPanel.jsp"%>
</div>
<%@ include file="../common/footerHolder.jsp"%> 
</body>
</html>


