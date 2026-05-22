<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>会員情報編集</title>
</head>
<body>

  <%
    // セッションガード：未ログインならログイン画面へ
    UserBean loginUser = (UserBean) session.getAttribute("userBean");
    if (loginUser == null) {
      response.sendRedirect(request.getContextPath() + "/views/login-in.jsp");
      return;
    }

    // 確認画面から「戻る」で戻った場合は updateUserBean の値を優先して表示する
    UserBean displayUser = (UserBean) session.getAttribute("updateUserBean");
    if (displayUser == null) {
      displayUser = loginUser;
    }
  %>

  <h2>会員情報編集登録</h2>

  <%-- エラーメッセージ表示 --%>
  <%
    String errMessage = (String) request.getAttribute("errMessage");
    if (errMessage != null) {
  %>
    <p style="color:red;"><%= errMessage %></p>
  <% } %>

  <form action="<%= request.getContextPath() %>/UserEditConfirmServlet" method="post">

    <%-- userId・passwordは非表示項目としてセッションから渡す --%>
    <input type="hidden" name="userId"   value="<%= loginUser.getUserId() %>">
    <input type="hidden" name="password" value="<%= loginUser.getPassword() %>">

    <table>
      <tr>
        <td>名前（姓） ：</td>
        <td>
          <input type="text" name="lastName"
                 value="<%= displayUser.getLastName() %>"
                 maxlength="32" required>
        </td>
      </tr>
      <tr>
        <td>名前（名） ：</td>
        <td>
          <input type="text" name="firstName"
                 value="<%= displayUser.getFirstName() %>"
                 maxlength="32" required>
        </td>
      </tr>
      <tr>
        <td>住所 ：</td>
        <td>
          <input type="text" name="address"
                 value="<%= displayUser.getAddress() %>"
                 maxlength="128" required>
        </td>
      </tr>
      <tr>
        <td>メールアドレス ：</td>
        <td>
          <input type="email" name="mailAddress"
                 value="<%= displayUser.getMailAddress() %>"
                 maxlength="128" required>
        </td>
      </tr>
    </table>

    <br>
    <button type="submit">確認</button>

  </form>

  <br>
  <%-- メニュー画面へ戻る --%>
  <form action="<%= request.getContextPath() %>/views/user-menu.jsp" method="get">
    <button type="submit">メニュー画面へ戻る</button>
  </form>

</body>
</html>