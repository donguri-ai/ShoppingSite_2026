package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1.0 セッションを取得して破棄する
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // 1.1 ログアウト完了画面へ遷移
        response.sendRedirect(request.getContextPath() + "/views/user-logout.jsp");
    }
}