package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.dao.MemberDAO;
import member.dto.MemberDTO;

public class MemberDAO {

	private MemberDAO() {}
    private static MemberDAO instance = new MemberDAO();
    public static MemberDAO getInstance() {
        return instance;
    }
    
    private Connection conn 		= null;
    private PreparedStatement pstmt = null;
    private ResultSet rs 			= null;
    
    private void getConnection() {
        
    	try {
    		
    		Context initCtx = new InitialContext();
    		Context envCtx = (Context)initCtx.lookup("java:comp/env");
    		DataSource ds = (DataSource)envCtx.lookup("jdbc/member");
    		conn = ds.getConnection();		
		} 
    	catch (Exception e) {
			e.printStackTrace();
		}      
    }
    
    private void getClose() {
    	if (rs != null)    {try {rs.close();}   catch (SQLException e) {}}
    	if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
        if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
    }
    
public void registerMember(MemberDTO memberDTO) {
    	
    	try {
    		
			getConnection();
			pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , NOW())");
			pstmt.setString(1, memberDTO.getMemberId());
			pstmt.setString(2, memberDTO.getMemberNm());
			pstmt.setString(3, memberDTO.getPasswd());
			pstmt.setString(4, memberDTO.getImgNm());
			pstmt.setString(5, memberDTO.getSex());
			pstmt.setString(6, memberDTO.getBirthDt());
			pstmt.setString(7, memberDTO.getHp());
			pstmt.setString(8, memberDTO.getSmsRecvAgreeYn());
			pstmt.setString(9, memberDTO.getEmail());
			pstmt.setString(10, memberDTO.getEmailRecvAgreeYn());
			pstmt.setString(11, memberDTO.getZipcode());
			pstmt.setString(12, memberDTO.getRoadAddress());
			pstmt.setString(13, memberDTO.getJibunAddress());
			pstmt.setString(14, memberDTO.getNamujiAddress());
			pstmt.executeUpdate();
			
		} 
    	catch (Exception e) {
			e.printStackTrace();
		} 
    	finally {
			getClose();
		}  	
    }
}
