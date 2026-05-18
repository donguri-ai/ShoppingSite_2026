package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBean;

@WebServlet("/UserEditConfirmServlet")
public class UserEditConfirmServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コード設定
        request.setCharacterEncoding("UTF-8");

        // 1.0 編集画面から受け取った情報を更新用Beanにセット
        // ※ログイン中のセッションuserBeanとは別に更新用のBeanを作成する
        UserBean updateBean = new UserBean();
        updateBean.setUserId(request.getParameter("userId"));
        updateBean.setPassword(request.getParameter("password"));
        updateBean.setFirstName(request.getParameter("firstName"));
        updateBean.setLastName(request.getParameter("lastName"));
        updateBean.setAddress(request.getParameter("address"));
        updateBean.setMailAddress(request.getParameter("mailAddress"));

        // 2.0 更新用BeanをセッションにセットA
        // ※"updateUserBean" というキーで保存（ログイン中の"userBean"とは別キー）
        HttpSession session = request.getSession();
        session.setAttribute("updateUserBean", updateBean);

        // 3.0 編集確認画面へ遷移
        response.sendRedirect(request.getContextPath() + "/views/user-edit-confirm.jsp");
    }
}