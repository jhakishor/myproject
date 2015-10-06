<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.adaptivity.blueprint4it.web.common.Constants"%>
<%@page import="com.adaptivity.blueprint4it.web.struts.form.UserLoginForm"%>
<%@page import="com.adaptivity.blueprint4it.dao.hibernate.Login"%>
<%@page import="org.apache.struts.action.ActionMessages"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ page isELIgnored="false" %> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<script type="text/javascript">


	function validateForm(formObj){
	if(formObj.oldPassword.value.length==0){
		alert("Please enter Old Password!");
		formObj.oldPassword.focus();
		return false;
		}	
	if(formObj.newPassword.value.length==0){
	alert("Please enter New Password!");
	formObj.newPassword.focus();
	return false;
	}
	if(formObj.confirmPassword.value.length==0){
		alert("Please enter Verify Password!");
		formObj.confirmPassword.focus();
		return false;
		}
	if(formObj.newPassword.value != formObj.confirmPassword.value){
		alert("New Password & Verify Password must be same!");
		return false;
		}
	if(formObj.newPassword.value == formObj.oldPassword.value){
		alert("Old Password & New Password cannot be same!");
		return false;
		}

	
	return true;
	}
	

	function onloadCheck(){
		<%
		Object flagObj = request.getAttribute(Constants.SUCCESS);
		if(flagObj != null){
			%>
			parent.location = './logout.do?forward=changePasswordSuccess';
			self.parent.tb_remove();
		<%	
		}
		%>
		}

	function registerFormSubmit(){
			var registerFormObj = document.getElementById("registerFormId");
			var returnVal = validateForm(registerFormObj);
			if(returnVal){
				registerFormObj.submit();
				}
		}
function forwardTo(obj){
	if(obj == 'forgotPassword'){
		parent.location = './Welcome.do';
		self.parent.tb_remove();
	}
}
//-->
</script>
<html>
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<head>
<title>Password Change</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />
</head>
<body onload="onloadCheck()">
<html:errors/>
<div id="registerwraper">

  <html:form action="/changepassword" method="post" styleId="registerFormId">
  				<input type="hidden" name="forward"/>
  				  				
				<table border="0" cellspacing="2" cellpadding="1" width="100%"
					class="changePwd">
					<tr>
						<td align="center" colspan="2"><font size="5">Change Your password</font></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><font color="red"><html:errors /></font></td>
					</tr>
					<tr>
						<td colspan="2">
						<p>&nbsp</p>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<p>&nbsp;</p>
						</td>
					</tr>
				<tr>
					<td align="right">Old Password:</td>
					<td><html:text property="oldPassword" maxlength="20"/></td>
				</tr>
				<tr>
					<td align="right">New Password:</td>
					<td><html:password property="newPassword" maxlength="20" /></td>
				</tr>
				<tr>
					<td align="right">Verify Password:</td>
					<td><html:password property="confirmPassword" maxlength="20" /></td>
				</tr>
					<tr>
						<td colspan="2">
						<p>&nbsp;</p>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
						<img src="<%=request.getContextPath()%>/images/btn-submit-b.gif" border="0" alt="" title="" onMouseOver="style.cursor='hand'" 
							onclick="registerFormSubmit()" />
                    <a onclick="self.parent.tb_remove();" href="#"><img src="<%=request.getContextPath()%>/images/btn-cancel-b.gif" border="0" alt="" title="" /></a>
						</td>
					</tr>
				</table>
			</html:form>
    </div>
</body>
</html>
