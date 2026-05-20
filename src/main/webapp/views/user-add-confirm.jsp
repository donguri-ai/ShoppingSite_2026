<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>新規会員登録確認</title>
</head>
<body>

  <%
    // セッションガード
    UserBean userBean = (UserBean) session.getAttribute("userBean");
    if (userBean == null) {
      response.sendRedirect(request.getContextPath() + "/views/login-in.jsp");
      return;
    }
  %>

  <h2>登録する内容はよろしいですか？</h2>

  <table>
    <tr>
      <td>ユーザーID ：</td>
      <td><%= userBean.getUserId() %></td>
    </tr>
    <tr>
      <td>パスワード ：</td>
      <td><%= userBean.getPassword() %></td>
    </tr>
    <tr>
      <td>名前（姓） ：</td>
      <td><%= userBean.getLastName() %></td>
    </tr>
    <tr>
      <td>名前（名） ：</td>
      <td><%= userBean.getFirstName() %></td>
    </tr>
    <tr>
      <td>住所 ：</td>
      <td><%= userBean.getAddress() %></td>
    </tr>
    <tr>
      <td>メールアドレス ：</td>
      <td><%= userBean.getMailAddress() %></td>
    </tr>
  </table>

  <br>

  <%-- 登録ボタン：UserAddServletへPOST --%>
  <form action="<%= request.getContextPath() %>/UserAddServlet" method="post">
    <button type="submit">登録</button>
  </form>

  <br>

  <%-- 戻るボタン：入力画面へ戻る --%>
  <form action="<%= request.getContextPath() %>/views/user-add.jsp" method="get">
    <button type="submit">戻る</button>
  </form>

</body>
</html>