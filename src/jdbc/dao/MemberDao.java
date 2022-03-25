package jdbc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jdbc.dto.MemberDto;

public class MemberDao {
    private Connection conn;
    private Statement stmt;
    private ResultSet rs;

    private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String user = "student";
	private static final String pwd = "1234";
    
	//-------------------------------------------------------------------------
	// Constructor
	//-------------------------------------------------------------------------
    public MemberDao(){
        try{
        	Class.forName(driver);
        	System.out.println("Oracle 드라이버 로딩 성공");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
 
	//-------------------------------------------------------------------------
	// get Connection
	//-------------------------------------------------------------------------
    public void getConnection(){
        try{
        	conn = DriverManager.getConnection(url, user, pwd);
			System.out.println("Connection 생성 성공");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

	//-------------------------------------------------------------------------
	// insert Data using parameter
	//-------------------------------------------------------------------------
    public int setData(String name, int height, int weight, int age, String sex) {
    	int nRet = -1;
    	try {
			stmt = conn.createStatement();
			System.out.println("Statement 생성 성공");
			String query = "INSERT INTO member VALUES "
					+ "( '" + name + "' , '" + height + "', '" + weight + "' , " + age + " , '" + sex + "' )";
			System.out.println(query);
			nRet = stmt.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return nRet;
    }
    
	//-------------------------------------------------------------------------
	// insert Data using DTO(VO)
	//-------------------------------------------------------------------------
    public int setData(MemberDto dto) {
    	int nRet = -1;
    	try {
			stmt = conn.createStatement();
			System.out.println("Statement 생성 성공");
			String query = "INSERT INTO member VALUES "
					+ "( '" + dto.getName() + "' , '" + dto.getHeight() + "', '" + dto.getWeight() + "' , " + dto.getAge() + " , '" + dto.getSex() + "' )";
			System.out.println(query);
			nRet = stmt.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return nRet;
    }
    
	//-------------------------------------------------------------------------
	// Search All Data
	//-------------------------------------------------------------------------
    public void getData(){
        try{          
        	stmt = conn.createStatement();
			String query2 = "SELECT * FROM member";
			System.out.println(query2);
			rs = stmt.executeQuery(query2);
			while (rs.next()) {
				System.out.print("이름은>>" + rs.getString("name"));
				System.out.print(" 키는>>" + rs.getString("height"));
				System.out.print(" 체중은>>" + rs.getString("weight"));
				System.out.print(" 나이는>>" + rs.getInt("age"));
				System.out.println(" 성별은>>" + rs.getString("sex"));
			}
        }catch(Exception e){
            e.printStackTrace();
        }
    }
 
	//-------------------------------------------------------------------------
	// Search All Data returning List
	//-------------------------------------------------------------------------
    public List getListData(){
    	List list = new ArrayList();
        try{          
        	stmt = conn.createStatement();
			String query2 = "SELECT * FROM member";
			System.out.println(query2);
			rs = stmt.executeQuery(query2);
			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setName(rs.getString("name"));
				System.out.print("이름은>>" + rs.getString("name"));
				
				dto.setHeight(rs.getInt("height"));
				System.out.print(" 키는>>" + rs.getString("height"));
				
				dto.setWeight(rs.getInt("weight"));
				System.out.print(" 체중은>>" + rs.getString("weight"));
				
				dto.setAge(rs.getInt("age"));
				System.out.print(" 나이는>>" + rs.getInt("age"));
				
				dto.setSex(rs.getString("sex"));
				System.out.println(" 성별은>>" + rs.getString("sex"));
				
				list.add(dto);
			}
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
 
	//-------------------------------------------------------------------------
	// Close Connection
	//-------------------------------------------------------------------------
    public void closeConnection(){
 
        try{
        	if(rs != null) rs.close();
			stmt.close();
			conn.close();
 
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
