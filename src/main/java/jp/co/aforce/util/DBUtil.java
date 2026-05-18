package jp.co.aforce.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	
	
    // 自分のDB名に合わせて変更してください
    private static final String URL      = "jdbc:mysql://localhost:3306/shoppingsite_koga?characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
    private static final String USER     = "root";
    private static final String PASSWORD = "admin";
    
    
    /**
     * DB接続を取得する
     */
    public static Connection getConnection() throws SQLException {
    	
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBCドライバが見つかりません", e);
        }
    	
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    
    
    
    
}
