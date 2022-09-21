package com.one.apedia.movie.json;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

public class DataInsert {
	public static void main(String[] args) {
		
		java.sql.Statement stmt = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		InputStream is=DataInsert.class.getResourceAsStream("over2000movies.json");
		//파일에서 문자열 읽어들이기  buffered
		
		try {
			String driverClassName = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@14.63.164.99:1521:xe";
			String user = "batman1";//batman1
			String password = "tiger";
			
			//JDBC Driver Loading
			Class.forName(driverClassName);
			
			//JDBC Connection getting
			conn = DriverManager.getConnection(url, user, password);
			
			System.out.println("DB 연결 성공");
			System.out.println("** Driver:" + driverClassName + ", Connection:" + conn);
			
			int fileSize = is.available();
			
			byte[] buffer = new byte[fileSize];
	        is.read(buffer);
	        is.close();
	        
	        //json파일명을 가져와서 String 변수에 담음
	        String jsonData = new String(buffer, "UTF-8");
			
			JSONArray arr=new JSONArray(jsonData);
			for(int i=0; i<arr.length(); i++) {
				JSONObject obj=arr.getJSONObject(i);
				String id=obj.getString("id");
				String title=obj.getString("title");
				JSONArray genres=obj.getJSONArray("genres");
				List<String> genre=new ArrayList<String>();
				for(int j=0; j<genres.length(); j++) {
					JSONObject obj2=genres.getJSONObject(j);
					genre.add(obj2.getString("name"));	
				}
				String string_genre=genre.toString();
				String original_title=obj.getString("original_title");
				String overview=obj.getString("overview");
				String poster_path=obj.getString("poster_path");
				String release_date=obj.getString("release_date");
				Integer runtime=obj.getInt("runtime");
				String backdrop_path=obj.getString("backdrop_path");
				
				String SQL = "insert into movie(num, title, genre, original_title, overview,"
						+ " poster_path, release_date, runtime, backdrop_path) values(movie_seq.nextval,?,?,?,?,?,?,?,?)";
				
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1,title);
				pstmt.setString(2,string_genre);// (2,genre);
				pstmt.setString(3,original_title);
				pstmt.setString(4,overview);
				//String toBeUpdated = "";
				//StringReader overview = new StringReader(toBeUpdated);
				//pstmt.setCharacterStream(4,overview,toBeUpdated.getBytes().length);
				pstmt.setString(5,poster_path);
				pstmt.setString(6,release_date);
				pstmt.setInt(7, runtime);
				pstmt.setString(8,backdrop_path);
			
				//PreParedStatement 객체 생성, 객체 생성시 SQL 문장 저장	
				int r = pstmt.executeUpdate();
			}
				//String genresString=genres.toString();
				//System.out.println(genresString);
				//SQL문 작성
				
			}catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
					if (stmt != null)
						stmt.close();
				} catch (Exception e) {
				}
			}	
	}
}
