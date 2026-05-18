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

@WebServlet("/UserAddServlet")
public class UserAddServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コード設定
        request.setCharacterEncoding("UTF-8");

        // セッションからuserBeanを取得
        HttpSession session = request.getSession(false);
        UserBean userBean = (UserBean) session.getAttribute("userBean");

        // 1.1 既存会員チェック（二重登録防止）
        UserDao userDao = new UserDao();
        boolean checkResult = userDao.userCheck(userBean);

        if (!checkResult) {
            // 1.2 登録済みの場合：エラーメッセージをセットしてエラー画面へ
            request.setAttribute("errMessage", "入力したユーザーIDとパスワードは、すでに登録済みです。");
            request.getRequestDispatcher("/views/login-error.jsp")
                   .forward(request, response);
            return;
        }

        // 1.3 未登録の場合：会員情報を登録する
        boolean addResult = userDao.addUser(userBean);

        if (!addResult) {
            // 1.3.2 登録失敗の場合：エラーメッセージをセットしてエラー画面へ
            request.setAttribute("errMessage", "登録エラー");
            request.getRequestDispatcher("/views/login-error.jsp")
                   .forward(request, response);
            return;
        }

        // 3.0 登録成功の場合：セッションを破棄して登録完了画面へ
        session.invalidate();
        response.sendRedirect(request.getContextPath() + "/views/user-success.jsp");
    }
}