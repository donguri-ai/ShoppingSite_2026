package jp.co.aforce.servlet;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBean;
import jp.co.aforce.dao.UserDao;

@WebServlet("/UserAddConfirmServlet")
public class UserAddConfirmServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コード設定
        request.setCharacterEncoding("UTF-8");

        // 1.1 フォームの入力値をUserBeanにセット
        UserBean userBean = new UserBean();
        userBean.setUserId(request.getParameter("userId"));
        userBean.setPassword(request.getParameter("password"));
        userBean.setFirstName(request.getParameter("firstName"));
        userBean.setLastName(request.getParameter("lastName"));
        userBean.setAddress(request.getParameter("address"));
        userBean.setMailAddress(request.getParameter("mailAddress"));

        // 1.2 既存会員チェック
        UserDao userDao = new UserDao();
        try {
            boolean result = userDao.userCheck(userBean);

            if (result) {
                // 1.3 未登録の場合：セッションにuserBeanをセットして確認画面へ
                HttpSession session = request.getSession();
                session.setAttribute("userBean", userBean);
                response.sendRedirect(request.getContextPath() + "/views/user-add-confirm.jsp");

            } else {
                // 1.4 登録済みの場合：エラーメッセージと入力値をセットして登録画面へ戻る
                request.setAttribute("errMessage", "入力したユーザーIDとパスワードは、すでに登録済みです。");
                request.setAttribute("inputBean", userBean);
                request.getRequestDispatcher("/views/user-add.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            request.setAttribute("errMessage", "データベースエラーが発生しました：" + e.getMessage());
            request.setAttribute("inputBean", userBean);
            request.getRequestDispatcher("/views/user-add.jsp").forward(request, response);
        }
    }
}
