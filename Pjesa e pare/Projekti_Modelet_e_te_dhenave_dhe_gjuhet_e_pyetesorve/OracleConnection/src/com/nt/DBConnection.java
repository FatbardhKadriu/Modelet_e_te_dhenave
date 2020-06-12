package com.nt;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection dbConnection;

	private final static String username = System.getenv("password");
	private final static String password = System.getenv("password");

	public static Connection getConnection() {
		if(dbConnection == null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				dbConnection = 
						DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:fiekdb", username, password);
				
			} catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		
		return dbConnection;
	}

}
