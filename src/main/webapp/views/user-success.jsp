<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>新規会員登録完了</title>
</head>
<body>

  <h2>新規会員登録完了</h2>

  <p>登録が完了しました。</p>

  <br>
  <form action="<%= request.getContextPath() %>/views/login-in.jsp" method="get">
    <button type="submit">ログイン画面へ戻る</button>
  </form>

</body>
</html>