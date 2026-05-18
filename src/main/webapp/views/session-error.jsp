<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>セッションエラー</title>
</head>
<body>

  <h2>セッションエラー</h2>

  <p style="color:red;">セッションの有効期限が切れました。<br>再度ログインしてください。</p>

  <br>

  <%-- ログイン画面へ戻るボタン --%>
  <form action="<%= request.getContextPath() %>/views/login-in.jsp" method="get">
    <button type="submit">ログイン画面へ戻る</button>
  </form>

</body>
</html>
