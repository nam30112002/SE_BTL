package com.example.se_btl.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLConnection {
    public static Statement statement;

    static {
        try {
            statement = SQLConnection.getSqlConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static Statement getSqlConnection() throws SQLException, ClassNotFoundException {
        String dbURL = "jdbc:sqlserver://localhost\\MAYAO;database=quanlynhankhau;user=sa;password=123456;encrypt=false";
        Connection conn = DriverManager.getConnection(dbURL);
        return conn.createStatement();
    }
}
