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

@WebServlet("/UserEditServlet")
public class UserEditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コード設定
        request.setCharacterEncoding("UTF-8");

        // 1.0 セッション自体のnullチェック（セッション切れ）
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/views/session-error.jsp");
            return;
        }

        // 1.1 更新用Beanのnullチェック（セッション切れ）
        UserBean updateBean = (UserBean) session.getAttribute("updateUserBean");
        if (updateBean == null) {
            response.sendRedirect(request.getContextPath() + "/views/session-error.jsp");
            return;
        }

        // 2.0 会員情報更新のBLを呼び出す
        UserDao userDao = new UserDao();
        try {
            userDao.updateUser(updateBean);

        } catch (SQLException e) {
            request.setAttribute("errMessage", "データベースエラーが発生しました：" + e.getMessage());
            request.getRequestDispatcher("/views/login-error.jsp").forward(request, response);
            return;
        }

        // 2.2 更新成功の場合
        // 2.2.1 ログイン中のuserBeanを更新後の情報で上書き
        session.setAttribute("userBean", updateBean);

        // 3.0 更新用セッションを破棄
        session.removeAttribute("updateUserBean");

        // 2.2.2 編集完了画面へ遷移
        response.sendRedirect(request.getContextPath() + "/views/user-edit-success.jsp");
    }
}
