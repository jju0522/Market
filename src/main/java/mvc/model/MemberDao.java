package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mvc.database.DBConnection;

public class MemberDao {
    
    // 회원 전체 정보 출력
    public List<MemberDto> getMemberList() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<MemberDto> res = new ArrayList<>();

        String sql = "SELECT * FROM member";

        try {
            conn = DBConnection.getConnection(); // 이 부분에서 ClassNotFoundException 처리가 필요합니다.
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MemberDto tmp = new MemberDto();
                tmp.setId(rs.getString("id"));
                tmp.setPassword(rs.getString("password"));
                tmp.setName(rs.getString("name"));
                tmp.setNickname(rs.getString("nickname"));
                tmp.setMail(rs.getString("mail"));
                tmp.setPhone(rs.getString("phone"));
                tmp.setRegist_day(rs.getString("regist_day"));

                res.add(tmp);
            }

        } catch (ClassNotFoundException | SQLException e) { // ClassNotFoundException 추가
            e.printStackTrace();
        } finally {            
            try {                
                if (rs != null) 
                    rs.close();                            
                if (pstmt != null) 
                    pstmt.close();                
                if (conn != null) 
                    conn.close();                                                
            } catch (Exception ex) {
                throw new RuntimeException(ex.getMessage());
            }        
        }       
        return res;
    }
}
