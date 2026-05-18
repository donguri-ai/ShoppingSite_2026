<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>会員情報修正完了</title>
</head>
<body>

  <h2>修正登録完了</h2>

  <p>会員情報の修正が完了しました。</p>

  <br>

  <%-- メニュー画面へ戻るボタン --%>
  <form action="<%= request.getContextPath() %>/views/user-menu.jsp" method="get">
    <button type="submit">メニュー画面へ戻る</button>
  </form>

</body>
</html>