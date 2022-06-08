package com.spboot.tx.config;

import com.jntoo.db.ConnectionConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@Component
public class DatabaseConfig implements ConnectionConfig {
    @Resource
    private ApplicationContext context;


    @Override
    public Connection getConn() {

        //return null;
        DataSource source = context.getBean(DataSource.class);
        try {
            Connection connection = source.getConnection();
            return connection;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        throw new RuntimeException("运行错误，获取数据库链接失败");
    }

    @Override
    public void closeConn(Connection connection) {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
