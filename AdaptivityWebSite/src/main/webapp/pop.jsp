<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.adaptivity.blueprint4it.web.common.Constants"%>
<%@page import="com.adaptivity.blueprint4it.web.struts.form.UserLoginForm"%>
<%@page import="org.apache.struts.action.ActionMessages"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Adaptivity - Blueprint</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<script LANGUAGE=javascript>
function checkEmail(email) {
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)){
	return (true)
	}
	alert("Invalid E-mail Address! Please re-enter.")
	return (false);
	}

	String.prototype.ltrim = function() {
		return this.replace(/^\s+/,"");
	}
	String.prototype.rtrim = function() {
		return this.replace(/\s+$/,"");
	}


	function validateForm(formObj){
		if((formObj.companyName.value.ltrim()).rtrim().length==0){
			alert("Please enter a Company Name!");
			formObj.companyName.focus();
			return false;
		}
	
		if((formObj.firstName.value.ltrim()).rtrim().length==0){
			alert("Please enter First Name!");
			formObj.firstName.focus();
			return false;
		}
		if((formObj.lastName.value.ltrim()).rtrim().length==0){
			alert("Please enter Last Name!");
			formObj.lastName.focus();
			return false;
		}
		if((formObj.companyTitle.value.ltrim()).rtrim().length==0){
			alert("Please enter Company Title!");
			formObj.companyTitle.focus();
			return false;
		}
		if((formObj.email.value.ltrim()).rtrim().length==0){
		alert("Please enter Email!");
		formObj.email.focus();
		return false;
		}
	
		if(!checkEmail(formObj.email.value)){
		   formObj.email.focus();
		   return false;
		}

		if((formObj.password.value.ltrim()).rtrim().length==0){
			alert("Please enter a Password!");
			formObj.password.focus();
			return false;
		}

		if((formObj.confirmPassword.value.ltrim()).rtrim().length==0){
			alert("Please Verify your Password!");
			formObj.confirmPassword.focus();
			return false;
		}

		if(formObj.confirmPassword.value != formObj.password.value){
			alert("Password & Verify Password do not match!");
			formObj.confirmPassword.focus();
			return false;
		}//password same
		
		if((formObj.phno.value.ltrim()).rtrim().length==0){
		alert("Please enter Phone Number!");
		formObj.phno.focus();
		return false;
		}

		formObj.promoCode.value = (formObj.promoCode.value.ltrim()).rtrim();
		//formObj.actionUpdateData.value="update";
		return true;
	}//validateForm
	
	function submitForm(){
		var loginFormObj = document.getElementById('loginForm');
		var flag = true;
		if(loginFormObj.email.value.length == 0){
    		alert("Please enter Email Id");
    		loginFormObj.email.focus();
    		flag = false;
	     }
		if(loginFormObj.password.value.length == 0 && flag){
   		   alert("Please enter Password");
   		   loginFormObj.password.focus();
   		   flag = false;
	     }	     
	     if(flag){		     
		  loginFormObj.submit();
	     }
		}

	function onloadCheck(){
		<%
		Object regSuccessObj = request.getAttribute(Constants.REGISTERATION_SUCCESS);
		Object regFailureObj = request.getAttribute(Constants.REGISTERATION_FAILURE);
		Object loginSuccessObj = request.getAttribute(Constants.LOGIN_SUCCESS);
		Object loginFailureObj = request.getAttribute(Constants.LOGIN_FAILURE);
		if(regSuccessObj != null){
			%>
			parent.location = './logout.do';
			self.parent.tb_remove();
			alert('Registration Successful! \nAccount activation link has been send to your email id.');
		<%	
		}if(loginSuccessObj != null){
			%>
			parent.location = './Welcome.do?forward=loginSuccess';
			self.parent.tb_remove();
			alert('login successful');
		<%	
		}if(regFailureObj != null){
			%>
			document.getElementById('registerationErrorDiv').style.display = 'block';
			document.getElementById('loginErrorDiv').style.display = 'none';
		<%	
		}if(loginFailureObj != null){
			%>
			document.getElementById('registerationErrorDiv').style.display = 'none';
			document.getElementById('loginErrorDiv').style.display = 'block';
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
		parent.location = './Welcome.do?forward=forgetPassword';
		self.parent.tb_remove();
	}
}

//-->
</script>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />
</head>
<body onload="onloadCheck()">
<div id="registerwraper">
        <div class="register-header">
            <h1>Login or Register</h1>
            <span>Please login or register before proceeding to the page you requested.</span>
            <!--div class="close"><a href="#"><img src="<%=request.getContextPath()%>/images/btn-close.gif" border="0" alt="" title="" /></a></div-->
        </div>
        <div class="loginfrmtop">&nbsp;</div>
        <div class="loginform-holder">        		
            <div class="loginbox">
                <div class="logintitles">
                    <span class="logintitle">Login</span>
                    <span class="forgotpass"><a href="javascript:forwardTo('forgotPassword')">Forgot password</a></span>
                </div>
                <div class="loginfields"> 
                <div id='loginErrorDiv' style="display:none;color:red"><html:errors /></div>               
                <html:form action="/userlogin" method="post" styleId="loginForm">
                    <label>Username<sup>*</sup></label>
                    <!--<input class="logininput w192" type="text" value="" />-->
                    <html:text property="email" size="30"
						maxlength="30" />
                    <label>Password<sup>*</sup></label>
                    <!-- <input class="logininput w192" type="password" value="" />-->
                    <html:password property="password" size="30"
						maxlength="120" onkeydown="javascript:return submitonEnter(event);"/>
                    <div class="login-button">
                    <a href="#" onkeydown="javascript:return submitonEnter(event);">
                    <img src="<%=request.getContextPath()%>/images/btn-login-b.gif" onMouseOver="style.cursor='hand'"
                    	border="0" alt="" title="" onclick="submitForm()"/>
                    </a>
                    </div>
                    </html:form>
                </div>
            </div>        
            <div class="loginformbox">
                <div class="title"><label class="text">Please register to download </label><label class="img"><img src="<%=request.getContextPath()%>/images/blueprint4it-img.gif" border="0" alt="" title="" /></label></div>
                <label>Complete the form below. All fields marked with * are mandatory. </label>
                
                <div>
                <%
                Object errorMsgObj = request.getAttribute(Constants.ERROR_MSG);
                if(errorMsgObj != null){
                	%>
                	<span style="color:red"><b><%=errorMsgObj.toString() %></b></span><br />
                	<%
                }
                %>
                <div id='registerationErrorDiv' style="display:none;color:red"><html:errors/></div>
                <html:form styleId="registerFormId" action="/userregister" method="post"
			      onsubmit="return validateForm(this);">
			        
                    <label>Company<sup>*</sup></label>
                    <html:text property="companyName"
						size="30" maxlength="128" />
                    <label>First Name<sup>*</sup></label>
                    <html:text property="firstName"
						size="30" maxlength="128" />
                    <label>Last Name<sup>*</sup></label>
                    <html:text property="lastName"
						size="30" maxlength="128" />
                    <label>Company Title<sup>*</sup></label>
                    <html:text
						property="companyTitle" size="30" maxlength="30" />
                    <label>Email Address<sup>*</sup></label>
                    <html:text property="email" size="30"
						maxlength="128" />
					<label>Password<sup>*</sup></label>
                    <html:password property="password" size="30"
						maxlength="20" />
					<label>Verify Password<sup>*</sup></label>
                    <html:password property="confirmPassword" size="30"
						maxlength="20" />
                    <!--  <label>Promo Code</label>
                    <input class="logininput w308" type="text" value="" />-->
                    <label>Promotional Code (Optional)</label>
                    <html:text property="promoCode" size="30"
						maxlength="15" />
                    <label>Telephone<sup>*</sup></label>
                    <html:text property="phno" size="30"
						maxlength="128" onkeydown="javascript:return submitonEnterRegister(event);"/>
                    <span class="hint">(format: +Country Code Area Code Number - no spaces)</span>
                    
                    <div class="btn-submit">
                    <a href="#" onkeydown="javascript:return submitonEnterRegister(event);"><img src="<%=request.getContextPath()%>/images/btn-submit-b.gif" 
                    	onMouseOver="style.cursor='hand'" border="0" alt="" title="" onclick="registerFormSubmit()"/>
                    </a>
                    </div>
                    <div class="btn-cancel"><a onclick="self.parent.tb_remove();" href="#"><img src="<%=request.getContextPath()%>/images/btn-cancel-b.gif" border="0" alt="" title="" /></a></div>
                </html:form>
                </div>
            </div>
        </div>
         <div class="loginform-bottom"></div>
    </div>
</body>
 
</html>
<script type="text/javascript">
        function submitonEnter(evt){
        	var charCode = (evt.which) ? evt.which : event.keyCode;
        	if(charCode == "13"){
        		submitForm();
        		return;
        	}
        }
        function submitonEnterRegister(evt){
        	var charCode = (evt.which) ? evt.which : event.keyCode;        	
        	if(charCode == "13"){
        		registerFormSubmit();
        		return;        	
        	}
        }      
        
        </script>
