
<%@ include file="sessionValue.jsp"%>
<div class="rightsidebar">
	<div class="rightsidebar-inner column">
 				<h4 ><strong style="color: #465AAA; ">Member Center</strong></h4>

			 <br/>Intelligent Blueprinting Software Suite</p>
	    <br/>
		<div id="userInfoDiv" style="display: none; font-size: 11px;">
			<b>Welcome </b>
			<span><b>
			<%
			 	if (currentUser != null) {
			 		if (currentUser.getFirstName() != null) {
			%> 
						<%=currentUser.getFirstName()%> 
				<%
			 		}
			 	 %> <%="  "%> 
			 	 <%
			 		if (currentUser.getLastName() != null) { %>
			 		<%=currentUser.getLastName()%> 
			 		<%}
			 	}
 			%> 
 			</b>
 			</span> 
 			
 			<a href="./logout.do"><img src="<%=request.getContextPath()%>/images/btn-logout.gif"	border="0" alt="" title="" /></a>
 			<br />
			<a href="./userlogin.do?pageOf=download">My Downloads</a>				
		</div>
		
		

		<div class="rightsidebar-box membercenter">
			<div id='changePasswordDiv' style='display: none'>
				<br/>
				<a href='./Welcome.do?forward=changePassword'>Change Password</a>
			</div>
			<div id='forgotPasswordDiv' style='display: none'>
				<a	href='./Welcome.do?forward=forgetPassword'>Forgot Password</a>
			</div>

			<div class="registernow" id="registerNowDiv" style="display: none">
				<a	href="./pop.jsp?keepThis=true&TB_iframe=true&height=628&width=830&modal=true" class="thickbox">
					<img src="<%=request.getContextPath()%>/images/btn-registernow.gif" border="0" alt="" title="" />
				</a>
			</div>
		</div>

	<div class="inputbox-wraper" id="loginDiv" style="display: none">
		<span class="title" style="color: #465AAA;">Login</span>
		<div class="loginholder">
			<%
				Object loginFailureObj = request.getAttribute(Constants.LOGIN_FAILURE);
				if (loginFailureObj != null) {
			%>
			<div style='margin-left: 10px'>
				<html:errors />
			</div>
			<%
				}
			%> 
			<html:form styleId="loginFormId" action="/userlogin?pageOf=download">
				<div class="inputbox">
					<html:text onfocus="makeFieldEmpty(this)" onclick="makeFieldEmpty(this)" value="Email" styleClass="inputclass" property="email" size="15" maxlength="30" />
				</div>
				<div class="inputbox">
					<html:password onfocus="makeFieldEmpty(this)" onclick="makeFieldEmpty(this)" value="Password" styleClass="inputclass" property="password" size="15" maxlength="30" onkeydown="javascript:return submitonEnter(event);" />
				</div>
				<div>
					<a href="#"><img src="<%=request.getContextPath()%>/images/btn-arrow.gif" border="0" alt="" title="" onclick="submitForm()" /></a>
				</div>
			</html:form>
		</div>
	</div>


	<div class="rightsidebar-box announcement">
	<h4 ><strong style="color: #465AAA; ">Thought Leadership</strong></h4>
	 <%@ include file="../user/thoughtLeadershiprss.jsp"%>
	</div>
	
	
	
	<div class="rightsidebar-box announcement" id="partialDivPressRelease1">
		<h4 style="color: #465AAA; ">Press Release</h4>
			<a  target="_blank" href="downloads/press/Intel Press Release .vFINAL.pdf">Adaptivity Launches Its Design Studio: Open Data Center Edition</a>
		<br/><br/>
				<a  target="_blank" href="downloads/press/Hitachi Press Release vFinal.pdf">Adaptivity Design Studio Enhances Hitachi Data Systems Service Offering</a>
		<br/><br/>
			<a  target="_blank" href="downloads/press/Adaptivity_Series_A_Final.pdf">Adaptivity Raises $7.2 Million Round of Financing</a>
		<div class="more">
                     <a href="javascript:showhideInfoDiv('completeDivPressRelease1','partialDivPressRelease1');"><img src="<%=request.getContextPath()%>/images/btn-more-right.gif" border="0" alt="" title="" /></a>
         </div>
 </div>



<div class="rightsidebar-box announcement" id="completeDivPressRelease1" style="display: none">
		<h4 style="color: #465AAA; ">Press Release</h4>
		
		<a  target="_blank" href="downloads/press/Intel Press Release .vFINAL.pdf">Adaptivity Launches Its Design Studio: Open Data Center Edition</a>
		<br/><br/>
				<a  target="_blank" href="downloads/press/Hitachi Press Release vFinal.pdf">Adaptivity Design Studio Enhances Hitachi Data Systems Service Offering</a>
		<br/><br/>
		<a  target="_blank" href="downloads/press/Adaptivity_Series_A_Final.pdf">Adaptivity Raises $7.2 Million Round of Financing</a>
		<br/><br/>
				<a  target="_blank" href="downloads/news/CCJ_Cloud_Revolutionary_2010-10-07.pdf">Enterprise Cloud Computing: Exclusive Q&A with a Cloud Revolutionary</a>
		<br/><br/>
				<a  target="_blank" href="http://ajax.sys-con.com/node/1350317">Adaptivity Named OnDemand Top 100 Winner</a>
		<div class="more">
                <a href="javascript:showhideInfoDiv('partialDivPressRelease1','completeDivPressRelease1');"><img src="<%=request.getContextPath()%>/images/minimize.png" border="0" alt="" title="" /></a>
         </div>
	</div>
	
	
	
	<div class="rightsidebar-box announcement">
		<h4 style="color: #465AAA; ">Featured Content</h4>
            <a  target="_blank" href="downloads/whitepapers/adaptivity design studio ODC edition 012.pdf">Adaptivity Design Studio: Open Datacenter Edition</a>
				<div style="height: 10px;"></div>		
			<a  target="_blank" href="downloads/whitepapers/itLifecycleV1.15.pdf">The Need for Blueprinting</a>
				<div style="height: 10px;"></div>
			<a  target="_blank" href="downloads/Blueprint_Manifest_v12.pdf">Blueprint Manifest</a>
				<div style="height: 10px;"></div>
			<a  target="_blank" href="downloads/OnePager_ValueWeAdd_Web.pdf">Value We Add</a>
				<div style="height: 10px;"></div>
			<a  target="_blank" href="downloads/analysts/451_Adaptivity_Market_Development_04_NOV_2010.pdf">the451 Analyst Report - Adaptivity Blueprint4IT Nov 2010</a>
	</div>

	<div class="rightsidebar-box announcement">
		<h4 style="color: #465AAA; ">Adaptivity Videos</h4>
		<a target="_blank" href="http://www.youtube.com/v/jnuSflyzrAU&hl=en_US&fs=1&rel=0&hd=1&border=1">Blueprinting</a>
		<div style="height: 10px;"></div>
		<a target="_blank" href="http://www.youtube.com/v/T5UTE-FtVRg&hl=en_US&fs=1&rel=0&hd=1&border=1">Lifecycle</a>
		<div style="height: 10px;"></div>
		<a target="_blank" href=" http://www.youtube.com/v/40x3YdwLfQM&hl=en_US&fs=1&rel=0&hd=1&border=1">Workloads</a>
		</div>
	<div style="margin-left:1px; " ><!--<a href="./Welcome.do?forward=contactUs">Contact Us</a>
	--></div>
	
</div>
</div>


<script language="JavaScript">

		function showhideInfoDiv(partialDiv,completeDiv){
			var showDiv = document.getElementById(partialDiv);
			var hideDiv = document.getElementById(completeDiv);
			showDiv.style.display = "block";
			hideDiv.style.display = "none";
		}
        function submitonEnter(evt){
        	var charCode = (evt.which) ? evt.which : event.keyCode;
        	if(charCode == "13"){
        	document.loginFormId.submit();
        	}
        }
        function submitForm(){
        	document.getElementById('loginFormId').submit();
        }
        function makeFieldEmpty(obj){
        	if(obj.value == 'Email' || obj.value == 'Password'){
        		obj.value = '';
        	}
        }
        rightPanelOnLoad();
 </script>