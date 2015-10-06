<%@ page import="java.util.*" %> 
<%@ page import="com.adaptivity.blueprint4it.util.RSSItemVO" %> 
<%@ page import="com.adaptivity.blueprint4it.web.common.Constants" %> 

<%
List<RSSItemVO> ceoList = (List<RSSItemVO>) request.getAttribute(Constants.CEO_BLOG_LIST);
%>
<Table>
<tr>
<td height="10"></td>
</tr>
<tr>
<td>
<b>CEO Blog</b>&nbsp;<img alt="feed=icon" src="images/feed-icon.gif">
</td>
</tr>
<%if(ceoList != null){
	for(RSSItemVO rssItemVO : ceoList){
		%>
		<tr>
		<td>
		<a href="<%=rssItemVO.getLink() %>" target="_blank"> <%=rssItemVO.getTitle() %> </a>
		</td>
		</tr>
		<%
	}
}
%>

</Table>
