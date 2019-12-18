package com.nt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Njesite_Matese {

	private String madhesia;
	private String njesia;

	public String getMadhesia() {
		return madhesia;
	}

	public void setMadhesia(String madhesia) {
		this.madhesia = madhesia;
	}

	public String getNjesia() {
		return njesia;
	}

	public void setNjesia(String njesia) {
		this.njesia = njesia;
	}

	public Njesite_Matese(String madhesia, String njesia) {
		super();
		this.madhesia = madhesia;
		this.njesia = njesia;
	}

	public static boolean addMadhesi(String madhesia, String njesia) {
		String query = "INSERT INTO Njesite_Matese(madhesia, njesia) VALUES(?,?)";
		try {
			PreparedStatement preparedStatement = DBConnection.getConnection().prepareStatement(query);

			preparedStatement.setString(1, madhesia);
			preparedStatement.setString(2, njesia);
			return (preparedStatement.executeUpdate() > 0);
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public static boolean updateMadhesi(String madhesia, String njesia) {
		String query = "UPDATE Njesite_Matese SET njesia=? WHERE madhesia=?";

		try {
			PreparedStatement preparedStatement = DBConnection.getConnection().prepareStatement(query);

			preparedStatement.setString(1, njesia);
			preparedStatement.setString(2, madhesia);

			return (preparedStatement.executeUpdate() > 0);
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public static boolean deleteMadhesi(String madhesia) {
		String query = "Delete from Njesite_Matese where madhesia=?";
		try {
			PreparedStatement preparedStatement = DBConnection.getConnection().prepareStatement(query);
			preparedStatement.setString(1, madhesia);
			return (preparedStatement.executeUpdate() > 0);
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public static List<Njesite_Matese> getMadhesite() {
		List<Njesite_Matese> madhesiteList = new ArrayList();

		String query = "Select * from Njesite_Matese";

		try {
			PreparedStatement preparedStatement = DBConnection.getConnection().prepareStatement(query);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Njesite_Matese njesite = new Njesite_Matese(resultSet.getString(1), resultSet.getString(2));
				madhesiteList.add(njesite);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return madhesiteList;
	}
}