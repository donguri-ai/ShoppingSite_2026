<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.UserBean" %>
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

  <%-- エラー時に入力値を復元する --%>
  <%
    UserBean inputBean = (UserBean) request.getAttribute("inputBean");
    String userId      = (inputBean != null && inputBean.getUserId()     != null) ? inputBean.getUserId()     : "";
    String password    = (inputBean != null && inputBean.getPassword()   != null) ? inputBean.getPassword()   : "";
    String lastName    = (inputBean != null && inputBean.getLastName()   != null) ? inputBean.getLastName()   : "";
    String firstName   = (inputBean != null && inputBean.getFirstName()  != null) ? inputBean.getFirstName()  : "";
    String address     = (inputBean != null && inputBean.getAddress()    != null) ? inputBean.getAddress()    : "";
    String mailAddress = (inputBean != null && inputBean.getMailAddress()!= null) ? inputBean.getMailAddress(): "";
  %>

  <form action="<%= request.getContextPath() %>/UserAddConfirmServlet" method="post" autocomplete="off">

    <table>
      <tr>
        <td>ユーザーID ：</td>
        <td><input type="text"     name="userId"      maxlength="10"  required autocomplete="off"          value="<%= userId %>"></td>
      </tr>
      <tr>
        <td>パスワード ：</td>
        <td><input type="password" name="password"    maxlength="32"  required autocomplete="new-password" value="<%= password %>"></td>
      </tr>
      <tr>
        <td>名前（姓） ：</td>
        <td><input type="text"     name="lastName"    maxlength="32"  required value="<%= lastName %>"></td>
      </tr>
      <tr>
        <td>名前（名） ：</td>
        <td><input type="text"     name="firstName"   maxlength="32"  required value="<%= firstName %>"></td>
      </tr>
      <tr>
        <td>住所 ：</td>
        <td><input type="text"     name="address"     maxlength="128" required value="<%= address %>"></td>
      </tr>
      <tr>
        <td>メールアドレス ：</td>
        <td><input type="email"    name="mailAddress" maxlength="128" required value="<%= mailAddress %>"></td>
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
