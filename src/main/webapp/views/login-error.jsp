<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ログインエラー</title>
</head>
<body>

  <h2>ログインエラー</h2>

  <%
    String errMessage = (String) request.getAttribute("errMessage");
  %>
  <p style="color:red;">
    <%= errMessage != null ? errMessage : "ユーザーIDまたはパスワードが一致しません。" %>
  </p>

  <br>
  <form action="<%= request.getContextPath() %>/views/login-in.jsp" method="get">
    <button type="submit">ログイン画面へ戻る</button>
  </form>

</body>
</html>