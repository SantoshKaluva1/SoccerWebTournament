package com.referee.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.referee.registration.model.Referee;

public class RefereeDao {
	public int registerReferee(Referee referee) throws ClassNotFoundException{
		int result = 0;
		String INSERT_REFEREE = "Insert into soccer (firstName,lastName,address,ussfNumber,"
				+ "city,state,zip,primaryEmail,phoneNumber,grade,yearsAt,yearsAsUsfReferee,"
				+ "age,preferredLocation,comfortLevel,profile,crew"
				+ ",teamName, gender,teamNumber) values (?,?,?,?,?,?,?,"
				+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
		
		try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
				+ "mysql_database?useSSL=false","root","root");
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REFEREE);
				){
			preparedStatement.setString(1, referee.getFirstName());
			preparedStatement.setString(2, referee.getLastName());
			preparedStatement.setString(3, referee.getAddress());
			preparedStatement.setString(5, referee.getCity());
			preparedStatement.setString(6, referee.getState());
			preparedStatement.setInt(7, referee.getZip());
			preparedStatement.setString(8, referee.getPrimaryEmail());
			preparedStatement.setLong(9, referee.getPhoneNumber());
			preparedStatement.setInt(10, referee.getGrade());
			preparedStatement.setInt(11, referee.getYearsAt());
			preparedStatement.setInt(12, referee.getYearsAsUsfReferee());
			preparedStatement.setInt(13, referee.getAge());
			preparedStatement.setString(14, referee.getPreferredLocation());
			preparedStatement.setString(15, referee.getComfortLevel());
			preparedStatement.setString(16, referee.getProfile());
			preparedStatement.setString(17, referee.getCrew());
			preparedStatement.setString(19, referee.getTeamName());
			preparedStatement.setString(20, referee.getGender());
			preparedStatement.setInt(21, referee.getTeamNumber());
			
			result = preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
