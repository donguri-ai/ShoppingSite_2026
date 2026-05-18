<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>新規会員登録</title>
</head>
<body>

  <h2>新規会員登録</h2>

  <%-- エラーメッセージ表示 --%>
  <%
    String errMessage = (String) request.getAttribute("errMessage");
    if (errMessage != null) {
  %>
    <p style="color:red;"><%= errMessage %></p>
  <% } %>

  <form action="<%= request.getContextPath() %>/UserAddConfirmServlet" method="post">

    <table>
      <tr>
        <td>ユーザーID ：</td>
        <td><input type="text" name="userId" maxlength="10" required></td>
      </tr>
      <tr>
        <td>パスワード ：</td>
        <td><input type="password" name="password" maxlength="32" required></td>
      </tr>
      <tr>
        <td>名前（姓） ：</td>
        <td><input type="text" name="firstName" maxlength="32" required></td>
      </tr>
      <tr>
        <td>名前（名） ：</td>
        <td><input type="text" name="lastName" maxlength="32" required></td>
      </tr>
      <tr>
        <td>住所 ：</td>
        <td><input type="text" name="address" maxlength="128" required></td>
      </tr>
      <tr>
        <td>メールアドレス ：</td>
        <td><input type="email" name="mailAddress" maxlength="128" required></td>
      </tr>
    </table>

    <br>
    <button type="submit">確認</button>

  </form>

  <br>
  <%-- ログイン画面へ戻るリンク --%>
  <form action="<%= request.getContextPath() %>/views/login-in.jsp" method="get">
    <button type="submit">ログイン画面へ戻る</button>
  </form>

</body>
</html>