<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.adaptivity.blueprint4it.dao.hibernate.Login"%>
<!-- DEA: this was on every other page so I added it  -->
<%@page import="com.adaptivity.blueprint4it.web.common.Constants"%>
<%@ page isELIgnored="false"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<head>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<title>Adaptivity - Blueprint</title>
<!--[if lte IE 6]>
<script type="text/javascript" src="js/supersleight-min.js"></script>
<![endif]-->

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />

</head>
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
	

	function registerFormSubmit(){
		var registerFormObj = document.getElementById("registerFormId");
		var returnVal = validateForm(registerFormObj);
		if(returnVal){
			registerFormObj.submit();
			}
	}
	function setOldPassword(){
		var oldPasswordObj = document.getElementById('oldPasswordId');
		oldPasswordObj.value = '${sessionScope.currentUser.password}';
		oldPasswordObj.readOnly = true;
		}
	
//-->
</script>
<body>
<div class="bodybg">
<div class="pagewrap">
<div class="topnav"><%@ include file="../common/topMenu.jsp"%>
</div>
<div class="content">
<div class="contentmain">

<center>

<table width="50%">
	<tr>
		<td><html:form action="/changepassword" method="post"
			styleId="registerFormId">
			<table border="0" cellspacing="2" cellpadding="1" width="100%"
				class="changePwd">
				<tr>
					<td colspan="2">
					<p>&nbsp</p>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2"><font size="5">Change
					Your password</font></td>
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
					<td><html:password property="oldPassword"
						styleId="oldPasswordId"/></td>
				</tr>
				<tr>
					<td align="right">New Password:</td>
					<td><html:password property="newPassword" /></td>
				</tr>
				<tr>
					<td align="right">Confirm Password:</td>
					<td><html:password property="confirmPassword" /></td>
				</tr>
				<tr>
					<td colspan="2">
					<p>&nbsp;</p>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2"><img
						src="<%=request.getContextPath()%>/images/btn-submit-b.gif"
						border="0" alt="" title="" onMouseOver="style.cursor='hand'"
						onclick="registerFormSubmit()" /></td>
				</tr>
			</table>
		</html:form></td>
	</tr>
</table>

</center>
</div>
<%@ include file="../common/rightSidePanel.jsp"%>
</div>
</div>
<%@ include file="../common/footerPanel.jsp"%>
</div>
<%@ include file="../common/footerHolder.jsp"%>
</body>
<%
	String forward = request.getParameter("pageOf");
	if(forward != null && forward.equals("changePasswordFromLink")){
		%>
		<script>
		setOldPassword();
		</script>
		<%
	}
%>
</html>


