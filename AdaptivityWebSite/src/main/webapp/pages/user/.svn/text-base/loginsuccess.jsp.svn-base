<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.adaptivity.blueprint4it.dao.hibernate.Login"%>
<%@page import="com.adaptivity.blueprint4it.web.common.Constants"%><html xmlns="http://www.w3.org/1999/xhtml">
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
%>
<head>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Adaptivity - Blueprint</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

//function submitForm(){
	//document.loginFormId.submit();
//}
function setact(action){
//document.forms[0].action.value="fileDownload.do";
document.forms[0].action="fileDownload.do";

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
      <!--updated content start-->
      <div class="leftbodyWrapper">
        <!--1st row -->
        <div class="blueBoxTop">
          <div class="leftLogo"><img src="images/blueprintlogo.jpg" alt="" /></div>
          <div class="topBoxLayout">
            <div class="minRequire width270"> <span class="smallbold"><strong>Free</strong> 30-Day Trial Download </span> <span class="bold">Minimum Requirements</span>
              <ul class="miniUlReq">
                <li>Windows: XP-SP2, Vista-SP2, Windows7</li>
                <li>Mac:OSX 10 or later</li>
                <li>Linux:coming soon!</li>
                <li>CPU:1 GHz processor</li>
                <li>RAM:1 GB RAM</li>
                <li>Disk:250 MB</li>
              </ul>
              <ul class="padT10">
                <li><img src="images/windows.gif" alt="" /><span><a title="Download for Windows" href="./fileDownload.do?os=windows" onclick="javascript:pageTracker._trackEvent('FR:Download Page', 'TO:Windows Download', './fileDownload.do?os=windows')">Download for Windows</a><br>
                  <%HttpSession httpSession = request.getSession();
                        if(httpSession != null && httpSession.getAttribute("fileSize.windows") != null){
                        %>
                        <span>(File Size: approx. <%=(String)(httpSession.getAttribute("fileSize.windows"))%>)</span>
                        <%}%></span></li>
                <li><img src="images/mac.gif" alt="" /><span><a href="./fileDownload.do?os=mac" onclick="javascript:pageTracker._trackEvent('FR:Download Page', 'TO:Mac Download', './fileDownload.do?os=mac')" title="Download for Mac OSX">Download for Mac OSX</a><br>
                  <%HttpSession httpSession2 = request.getSession();
                        if(httpSession2 != null && httpSession2.getAttribute("fileSize.mac") != null){
                        %>
                        <span>(File Size: approx. <%=(String)(httpSession2.getAttribute("fileSize.mac"))%>)</span>
                        <%}%></span></li>
                <li><img src="images/acrobat.gif" alt="" /><span><a title="Download tutorial" target="_blank" href="./fileDownload.do?download=tutorial">Download Tutorial</a><br>
                  File size: approx <strong>6.03 MB</strong></span></li>
              </ul>
            </div>
          </div>
        </div>
        <!--1st row -->
        <!--2nd row -->
        <div class="blueBoxTop">
          <div class="leftLogo"><img src="images/modeling-studio.jpg" alt=""/></div>
          <div class="topBoxLayout">
            <div class="minRequire width330">
              <p><img src="images/blue-model.jpg" alt="" /><br />Demo Adaptivity’s latest edition to the Blueprint4IT Lifecycle Suite – the Modeling Studio.  This demo explores the Modeling Studio’s web-based collaboration environment that you can use to quickly document, profile, analyze and link your business workload and IT Supply Chain demographics.</p>
              <ul class="padT10">
                <li><img src="images/zip-icon.png" alt="" border="0"/><span style="width:167px;"><a target="_blank" title="Download Clickthrough Demo" href="<%=request.getContextPath()%>/pdf/Portfolio Modeler Clickthrough v1.5.zip">Download Clickthrough Demo</a><br>
                  File size: approx <strong>5.5 MB</strong></span></li>
              </ul>
            </div>
          </div>
        </div>
        <!--2nd row -->
      </div>
      <!--updated content end-->
    </div>

     <%@ include file="../common/rightSidePanel.jsp"%>
    </div>
</div>
<%@ include file="../common/footerPanel.jsp"%>
</div>
<%@ include file="../common/footerHolder.jsp"%>
</body>
</html>

