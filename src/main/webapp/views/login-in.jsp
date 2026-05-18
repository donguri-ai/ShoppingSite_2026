<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ログイン</title>
</head>
<body>

  <h2>ログイン画面</h2>

  <%-- エラーメッセージ表示 --%>
  <%
    String errMessage = (String) request.getAttribute("errMessage");
    if (errMessage != null) {
  %>
    <p style="color:red;"><%= errMessage %></p>
  <% } %>

  <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
    <table>
      <tr>
        <td>ID ：</td>
        <td><input type="text" name="userId" maxlength="50" required></td>
      </tr>
      <tr>
        <td>パスワード ：</td>
        <td><input type="password" name="password" maxlength="50" required></td>
      </tr>
    </table>
    <br>
    <button type="submit">ログイン</button>
  </form>

  <br>
  <form action="<%= request.getContextPath() %>/views/user-add.jsp" method="get">
    <button type="submit">新規会員登録</button>
  </form>

</body>
</html>