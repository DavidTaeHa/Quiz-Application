package com.example.quizapp;

import javax.sql.DataSource;
import java.sql.SQLException;
import com.mysql.cj.jdbc.MysqlDataSource;

public class SQLDS {

    private static DataSource ds;

    static {
        //Single-responsibility principle
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName("localhost");
        dataSource.setPortNumber(3306);
        dataSource.setDatabaseName("quiz_app"); // insert database name
        dataSource.setUser("root");
        dataSource.setPassword("rootuser"); // insert password
        try {
            dataSource.setAllowMultiQueries(true);
            dataSource.setServerTimezone("UTC");
            dataSource.setRewriteBatchedStatements(true); // To get the actual benefits of Batch Processing in MySQL
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ds = dataSource;
    }

    public static DataSource getDs() {
        return ds;
    }
}
