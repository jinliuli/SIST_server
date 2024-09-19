/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.93
 * Generated at: 2024-09-19 07:56:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ex11_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("	<meta charset=\"UTF-8\">\r\n");
      out.write("	<title></title>\r\n");
      out.write("	<link rel=\"stylesheet\" href=\"http://bit.ly/3WJ5ilK\">\r\n");
      out.write("	<script src=\"https://kit.fontawesome.com/1ddf83a78d.js\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("	<style>\r\n");
      out.write("	\r\n");
      out.write("	</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<!-- ex11_form.jsp -->\r\n");
      out.write("	<h1>버튼 만들기</h1>\r\n");
      out.write("	\r\n");
      out.write("	<form method=\"POST\" action=\"ex11_ok.jsp\">\r\n");
      out.write("		<table class=\"\">\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>너비(px)</th>\r\n");
      out.write("				<td><input type=\"number\" name=\"width\" min=\"20\" max=\"300\" step=\"10\" value=\"120\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>높이(px)</th>\r\n");
      out.write("				<td><input type=\"number\" name=\"height\" min=\"20\" max=\"300\" step=\"10\" value=\"30\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>텍스트</th>\r\n");
      out.write("				<td><input type=\"text\" name=\"txt\" value=\"Button\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>배경색</th>\r\n");
      out.write("				<td><input type=\"color\" name=\"bgcolor\" value=\"#ffffff\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>글자색</th>\r\n");
      out.write("				<td><input type=\"color\" name=\"fontcolor\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>글자 크기(px)</th>\r\n");
      out.write("				<td><input type=\"number\" name=\"fontsize\" min=\"10\" max=\"100\" value=\"16\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>버튼 개수(ea)</th>\r\n");
      out.write("				<td><input type=\"number\" name=\"count\" min=\"1\" max=\"30\" value=\"1\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>버튼 간격</th>\r\n");
      out.write("				<td>\r\n");
      out.write("				<div>좌우 간격: <input type=\"range\" min=\"0\" max=\"50\" value=\"0\" name=\"leftright\"></div>\r\n");
      out.write("				<div>상하 간격: <input type=\"range\" min=\"0\" max=\"50\" value=\"0\" name=\"topbottom\"></div>\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>아이콘</th>\r\n");
      out.write("				<td>\r\n");
      out.write("					<lable>\r\n");
      out.write("						<input type=\"radio\" name=\"icon\" value=\"없음\">\r\n");
      out.write("						없음\r\n");
      out.write("					</lable>\r\n");
      out.write("					<lable>\r\n");
      out.write("						<input type=\"radio\" name=\"icon\" value=\"house\">\r\n");
      out.write("						<i class=\"fa-solid fa-house\"></i>\r\n");
      out.write("					</lable>\r\n");
      out.write("					<lable>\r\n");
      out.write("						<input type=\"radio\" name=\"icon\" value=\"image\">\r\n");
      out.write("						<i class=\"fa-solid fa-image\"></i>\r\n");
      out.write("					</lable>\r\n");
      out.write("					<lable>\r\n");
      out.write("						<input type=\"radio\" name=\"icon\" value=\"location-dot\">\r\n");
      out.write("						<i class=\"fa-solid fa-location-dot\"></i>\r\n");
      out.write("					</lable>\r\n");
      out.write("					<lable>\r\n");
      out.write("						<input type=\"radio\" name=\"icon\" value=\"github\">\r\n");
      out.write("						<i class=\"fa-brands fa-github\"></i>\r\n");
      out.write("					</lable>\r\n");
      out.write("					<lable>\r\n");
      out.write("						<input type=\"radio\" name=\"icon\" value=\"paperclip\">\r\n");
      out.write("						<i class=\"fa-solid fa-paperclip\"></i>\r\n");
      out.write("					</lable>\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>테두리</th>\r\n");
      out.write("				<td>\r\n");
      out.write("					<select name=\"sel\">\r\n");
      out.write("						<option>감추기</option>\r\n");
      out.write("						<option>보이기</option>\r\n");
      out.write("						\r\n");
      out.write("					</select>\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("		</table>\r\n");
      out.write("		<div>\r\n");
      out.write("			<input type=\"submit\" value=\"만들기\">\r\n");
      out.write("		</div>\r\n");
      out.write("	</form>\r\n");
      out.write("	\r\n");
      out.write("	<script src=\"https://code.jquery.com/jquery-3.7.1.js\"></script>\r\n");
      out.write("	<script src=\"https://bit.ly/4cMuheh\"></script>\r\n");
      out.write("	<script>\r\n");
      out.write("	\r\n");
      out.write("	</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
