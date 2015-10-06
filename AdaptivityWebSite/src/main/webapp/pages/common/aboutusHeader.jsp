<table border="0" cellspacing="0" cellpadding="0" style=" width : 770px;">
   <tr>
   	<td width="70%" height="30" class="text_secondary_nav">&nbsp;</td>
   	
   	  <% if ("profile".equals(aboutus_flow_name)) {%>
      	<td colspan="1" height="30" class="text_secondary_nav hiLighter">Profile</td>
      <%} else {%>
      	<td colspan="1" class="text_secondary_nav"><a href="./Welcome.do?forward=aboutUs&aboutus_flow_name=profile">Profile</a></td>
      <%}%>
      
       <% if ("executiveteam".equals(aboutus_flow_name)) {%>
      	<td colspan="1" height="30" class="text_secondary_nav hiLighter">Executive Team</td>
      <%} else {%>
      	<td colspan="1" class="text_secondary_nav"><a href="./Welcome.do?forward=aboutUs&aboutus_flow_name=executiveteam">Executive Team</a></td>
      <%}%>
      
       <% if ("awards".equals(aboutus_flow_name)) {%>
      	<td colspan="1" height="30" class="text_secondary_nav hiLighter">Awards</td>
      <%} else {%>
      	<td colspan="1" class="text_secondary_nav"><a href="./Welcome.do?forward=aboutUs&aboutus_flow_name=awards">Awards</a></td>
      <%}%>      
    </tr>
    <tr><td colspan="4" style="align:right; padding-top:5px;"><hr /></td></tr>
</table>