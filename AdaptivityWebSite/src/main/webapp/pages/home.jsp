<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.adaptivity.blueprint4it.web.common.Constants"%>
<%@page import="com.adaptivity.blueprint4it.beans.DownloadProperties"%>
<%@page import="com.adaptivity.blueprint4it.services.ServiceFinder"%><html xmlns="http://www.w3.org/1999/xhtml">
<%

response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<head>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" /> 
<meta http-equiv="Pragma" content="no-cache" />
<title>Adaptivity - Blueprint4IT</title>
<!--[if lte IE 6]>
<script type="text/javascript" src="js/supersleight-min.js"></script>
<![endif]-->

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<%
DownloadProperties downloadProperties = (DownloadProperties) ServiceFinder.getContext(request).getBean("downloadProperties");
String windowsFileSize = downloadProperties.getWindowsFileSize();
%>


function submitForm(){
	document.getElementById('loginFormId').submit();
}
function makeFieldEmpty(obj){
	if(obj.value == 'Email' || obj.value == 'Password'){
		obj.value = '';
	}
}
</script>
<script type="text/javascript" src="js/matching_columns.js" language="javascript"></script>
</head>
<body>
<div class="bodybg">
<div class="pagewrap">
	<div class="topnav">
    	<%@ include file="../pages/common/topMenu.jsp"%> 
    </div>

    <div class="content">		    	
		 <div class="contentmain column">
                    <div style="height: 2px;"></div>
              <div class="img "> <a href="./Welcome.do?forward=product" > <img  src="<%=request.getContextPath()%>/images/Home_Animation_Revisions.gif"  /></a></div>
                	
              <div style="display: block; overflow:hidden; float: left; width: 100%; "> 	
               <table cellpadding="0" cellspacing="0" border="0">
                <tr > <td height="5px"> </td></tr>
                <tr>
                <td>
                <div class="img"><a href="./Welcome.do?forward=aboutUs"/><img src="<%=request.getContextPath()%>/images/HomePageButtons_Value.png" /></div>
                </td>
                <td  width="9px"> </td>
                <td>
                <div class="img"> <a href="./Welcome.do?forward=solution"/><img src="<%=request.getContextPath()%>/images/HomePageButtons_Solutions.png" /></div>
                </td>
                  <td width="9px"></td> 
                <td>
                <div class="img"> <a href="./Welcome.do?forward=product"/><img src="<%=request.getContextPath()%>/images/HomePageButtons_Products.png" /></div>
                </td>
               </tr>
               
                </table>
                </div>
		</div>
       <%@ include file="../pages/common/rightSidePanel.jsp"%>
    </div>
</div>
<%@ include file="./common/footerPanel.jsp"%>
</div>
<%@ include file="./common/footerHolder.jsp"%>
<%
		Object msgObj = request.getAttribute(Constants.DISPLAY_MSG);
		if(msgObj != null){
			%>
			<script type="text/javascript">
			alert('<%=msgObj.toString() %>');
			</script>
			<%
		}
		%>
</body>
</html>