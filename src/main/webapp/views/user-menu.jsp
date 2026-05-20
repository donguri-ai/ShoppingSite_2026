<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>メニュー</title>
</head>
<body>

  <%
    // セッションガード：未ログインならログイン画面へ
    UserBean loginUser = (UserBean) session.getAttribute("userBean");
    if (loginUser == null) {
      response.sendRedirect(request.getContextPath() + "/views/login-in.jsp");
      return;
    }
  %>

  <h2>メニュー</h2>

  <p>ようこそ、<%= loginUser.getLastName() %> <%= loginUser.getFirstName() %> さん！</p>

  <br>

  <form action="<%= request.getContextPath() %>/views/user-edit.jsp" method="get">
    <button type="submit">編集</button>
  </form>

  <br>

  <form action="<%= request.getContextPath() %>/views/user-delete-confirm.jsp" method="get">
    <button type="submit">削除</button>
  </form>

  <br>

  <form action="<%= request.getContextPath() %>/LogoutServlet" method="post">
    <button type="submit">ログアウト</button>
  </form>

</body>
</html>