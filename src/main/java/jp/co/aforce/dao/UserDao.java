package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jp.co.aforce.beans.UserBean;
import jp.co.aforce.util.DBUtil;

public class UserDao {

    /**
     * ログイン時にユーザーIDとパスワードの一致チェックを行う
     * 一致すればUserBeanを返す、しなければnullを返す
     */
    public UserBean loginCheck(String userId, String password) {
        UserBean user = null;
        String sql = "SELECT * FROM users WHERE userId = ? AND password = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new UserBean();
                    user.setUserId(rs.getString("userId"));
                    user.setPassword(rs.getString("password"));
                    user.setFirstName(rs.getString("firstName"));
                    user.setLastName(rs.getString("lastName"));
                    user.setAddress(rs.getString("address"));
                    user.setMailAddress(rs.getString("mailAddress"));
                    user.setCreatedAt(rs.getString("created_at"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    /**
     * 会員情報登録時にuserIDが登録済みかチェックする
     * 未登録：true / 登録済み：false
     */
    public boolean userCheck(UserBean userBean) {
    	
    	
        String sql = "SELECT * FROM users WHERE userId = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userBean.getUserId());

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return false; // 登録済み
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true; // 未登録
    }

    /**
     * 会員情報を登録する
     * 成功：true / 失敗：false
     */
    public boolean addUser(UserBean userBean) {
        String sql = "INSERT INTO users (userId, password, firstName, lastName, address, mailAddress) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userBean.getUserId());
            pstmt.setString(2, userBean.getPassword());
            pstmt.setString(3, userBean.getFirstName());
            pstmt.setString(4, userBean.getLastName());
            pstmt.setString(5, userBean.getAddress());
            pstmt.setString(6, userBean.getMailAddress());

            pstmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 会員情報を更新する
     * 成功：true / 失敗：false
     */
    public boolean updateUser(UserBean userBean) {
        String sql = "UPDATE users SET password = ?, firstName = ?, lastName = ?, address = ?, mailAddress = ? WHERE userId = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userBean.getPassword());
            pstmt.setString(2, userBean.getFirstName());
            pstmt.setString(3, userBean.getLastName());
            pstmt.setString(4, userBean.getAddress());
            pstmt.setString(5, userBean.getMailAddress());
            pstmt.setString(6, userBean.getUserId());

            pstmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 会員情報を削除する
     * 成功：true / 失敗：false
     */
    public boolean deleteUser(UserBean userBean) {
        String sql = "DELETE FROM users WHERE userId = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userBean.getUserId());
            pstmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    

    
    
    
    
    
}