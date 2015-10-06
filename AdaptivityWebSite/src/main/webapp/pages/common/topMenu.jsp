<%@ page import="java.util.*" %> 
<%@ page import="com.adaptivity.blueprint4it.web.common.Constants" %> 
<%@ page import="com.adaptivity.blueprint4it.dao.hibernate.*" %>

<ul id="nav">
	<%
Object object = request.getAttribute(Constants.MENU_LIST);

if(object != null){
	List<Menu> menuItemList = (List<Menu>)object;
	if(menuItemList.size() > 0){
		out.print("<li class='first'>&nbsp;</li>");
		Iterator<Menu> menuItemIterator = menuItemList.iterator();
		while(menuItemIterator.hasNext()){
			Menu menuItem = menuItemIterator.next();
			StringBuilder url = new StringBuilder(menuItem.getUrl());
			if(menuItem.getParam() != null && menuItem.getParam() != "" && menuItem.getParam().length() >0){
				url.append("?"+menuItem.getParam());
			}
			out.print("<li><a style='width: 128px; align: center;' href='");
			%><%=url%>
			<%
			if(menuItem.getMenuName().equalsIgnoreCase("Register now!")
			|| menuItem.getMenuName().equalsIgnoreCase("Contact Us")){
			    out.print("' class='thickbox'><span class='active'>");
			}else{
				out.print("'><span >");
			}
			%><%=menuItem.getMenuName()%>
			<%
			out.print("</span></a></li>");
		}
	}
	
}
%></ul><div style="height: 5px;"></div>