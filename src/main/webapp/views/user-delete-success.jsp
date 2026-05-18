<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>会員情報削除完了</title>
</head>
<body>

  <h2>会員情報削除完了</h2>

  <p>会員情報を削除しました。</p>

  <br>

  <%-- ログイン画面へ戻るボタン --%>
  <form action="<%= request.getContextPath() %>/views/login-in.jsp" method="get">
    <button type="submit">ログイン画面へ戻る</button>
  </form>

</body>
</html>