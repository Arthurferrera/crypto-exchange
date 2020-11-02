package br.unip.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionFactory {
	
	private static Connection con;
	
	public static Connection getConnection() {
		String URL = "jdbc:sqlserver://localhost:1401;databaseName=dbPim";
//		;user=sa;password=Do123456ck"
		con = null;
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(URL, "sa", "Do123456ck");
		} catch (SQLException e) {
			System.out.println("1"+e.getMessage());
		} catch (Exception e) {
			System.out.println("Não foi possível conectar ao banco"+e.getMessage());
		}
		return con;
	}
	
	public static void closeConnection() {
		if(con != null){
			try {
				con.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}

}
