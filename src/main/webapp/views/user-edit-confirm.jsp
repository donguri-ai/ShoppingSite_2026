<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>会員情報編集確認</title>
</head>
<body>

  <%
    // セッションガード：更新用Beanがなければログイン画面へ
    UserBean updateBean = (UserBean) session.getAttribute("updateUserBean");
    if (updateBean == null) {
      response.sendRedirect(request.getContextPath() + "/views/login-in.jsp");
      return;
    }
  %>

  <h2>登録する内容はよろしいですか？</h2>

  <table>
    <tr>
      <td>名前（姓） ：</td>
      <td><%= updateBean.getFirstName() %></td>
    </tr>
    <tr>
      <td>名前（名） ：</td>
      <td><%= updateBean.getLastName() %></td>
    </tr>
    <tr>
      <td>住所 ：</td>
      <td><%= updateBean.getAddress() %></td>
    </tr>
    <tr>
      <td>メールアドレス ：</td>
      <td><%= updateBean.getMailAddress() %></td>
    </tr>
  </table>

  <br>

  <%-- 登録ボタン：UserEditServletへPOST --%>
  <form action="<%= request.getContextPath() %>/UserEditServlet" method="post">
    <button type="submit">登録</button>
  </form>

  <br>

  <%-- 戻るボタン：編集画面へ戻る --%>
  <form action="<%= request.getContextPath() %>/views/user-edit.jsp" method="get">
    <button type="submit">戻る</button>
  </form>

</body>
</html>