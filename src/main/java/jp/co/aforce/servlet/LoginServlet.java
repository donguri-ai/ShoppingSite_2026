package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBean;
import jp.co.aforce.dao.UserDao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コード設定
        request.setCharacterEncoding("UTF-8");

        // 1.0 ログイン画面から入力値を取得
        String userId   = request.getParameter("userId");
        String password = request.getParameter("password");

        // 1.1 DAOを呼び出してログインチェック
        UserDao userDao = new UserDao();
        UserBean userBean = userDao.loginCheck(userId, password);

        if (userBean != null) {
            // 1.2 取得成功：セッションにuserBeanをセットしてメニュー画面へ
            HttpSession session = request.getSession();
            session.setAttribute("userBean", userBean);

            response.sendRedirect(request.getContextPath() + "/views/user-menu.jsp");

        } else {
            // 1.3 取得失敗：エラーメッセージをセットしてログインエラー画面へ
            request.setAttribute("errMessage", "ユーザーIDまたはパスワードが一致しません。");

            request.getRequestDispatcher("/views/login-error.jsp")
                   .forward(request, response);
        }
    }
}