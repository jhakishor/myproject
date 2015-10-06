
<%@page import="com.adaptivity.blueprint4it.web.common.Constants"%>
<%@page import="com.adaptivity.blueprint4it.dao.hibernate.Login"%>

<script type="text/javascript">
<%
HttpSession currentSession = request.getSession();
String email = null;
Login currentUser = null;
if(currentSession != null){
	Object userEmailObj = currentSession.getAttribute("email");
	if(userEmailObj != null){
		email = (String)userEmailObj;
	}
	Object currentUserObj = currentSession.getAttribute(Constants.CURRENT_USER);
	if(currentUserObj != null){
		currentUser = (Login) currentUserObj;
	}
	
}
%>
function rightPanelOnLoad(){
<%
	
if(email != null){
	%>
document.getElementById('registerNowDiv').style.display = 'none';
document.getElementById('loginDiv').style.display = 'none';
document.getElementById('userInfoDiv').style.display = 'block';
document.getElementById('changePasswordDiv').style.display = 'block';
document.getElementById('forgotPasswordDiv').style.display = 'none';

<%	
	}else{
	%>
document.getElementById('registerNowDiv').style.display = 'block';
document.getElementById('loginDiv').style.display = 'block';
document.getElementById('userInfoDiv').style.display = 'none';
document.getElementById('changePasswordDiv').style.display = 'none';
document.getElementById('forgotPasswordDiv').style.display = 'block';

<%
	}
	%>

}

</script>