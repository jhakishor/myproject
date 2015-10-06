<table border="0" cellspacing="0" cellpadding="0" align="right" style=" width : 770px;">
   <tr align="right">
   	<td width="77%" height="20" class="text_secondary_nav">&nbsp;</td>
   	
   	  <% if ("model".equals(submenu_name)) {%>
      	<td colspan="1" height="20" class="text_secondary_nav hiLighter">Plan</td>
      <%} else {%>
      	<td colspan="1" class="text_secondary_nav"><a href="./Welcome.do?forward=product&submenu_name=model">Plan</a></td>
      <%}%>
      <% if ("design".equals(submenu_name)) {%>
      	<td colspan="1" height="20" class="text_secondary_nav hiLighter">Design</td>
      <%} else {%>
      	<td colspan="1" class="text_secondary_nav"><a href="./Welcome.do?forward=product&submenu_name=design">Design</a></td>
      <%}%>
   	  <% if ("govern".equals(submenu_name)) {%>
      	<td colspan="1" height="20" class="text_secondary_nav hiLighter">Govern</td>
      <%} else {%>
      	<td colspan="1" class="text_secondary_nav"><a href="./Welcome.do?forward=product&submenu_name=govern">Govern</a></td>
      <%}%>
    </tr>
    <tr><td colspan="7" style="align: left; padding-top:5px; width : 1061px;"><hr /></td></tr>
</table>