<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>会員情報削除確認</title>
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

  <h2>削除してよろしいですか？</h2>

  <p>
    <%= loginUser.getFirstName() %> <%= loginUser.getLastName() %> さん
  </p>

  <br>

  <%-- はいボタン：UserDeleteServletへPOST --%>
  <form action="<%= request.getContextPath() %>/UserDeleteServlet" method="post">
    <button type="submit">はい</button>
  </form>

  <br>

  <%-- いいえボタン：メニュー画面へ戻る --%>
  <form action="<%= request.getContextPath() %>/views/user-menu.jsp" method="get">
    <button type="submit">いいえ</button>
  </form>

</body>
</html>