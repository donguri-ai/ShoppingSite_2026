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

@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {

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

        // 1.1 セッションからuserBeanを取得
        UserBean userBean = (UserBean) session.getAttribute("userBean");
        if (userBean == null) {
            response.sendRedirect(request.getContextPath() + "/views/session-error.jsp");
            return;
        }

        // 2.0 会員情報削除のBLを呼び出す
        UserDao userDao = new UserDao();
        boolean result = userDao.deleteUser(userBean);

        if (!result) {
            // 2.1 削除失敗の場合：エラーメッセージをセットしてエラー画面へ
            request.setAttribute("errMessage", "登録エラー");
            request.getRequestDispatcher("/views/login-error.jsp")
                   .forward(request, response);
            return;
        }

        // 2.2 削除成功の場合
        // 2.2.1 セッションを破棄
        session.invalidate();

        // 2.2.2 削除完了画面へ遷移
        response.sendRedirect(request.getContextPath() + "/views/user-delete-success.jsp");
    }
}