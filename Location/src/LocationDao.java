import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class LocationDao {
	
	public void si_insert(List<SiDto> dtos) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO LOCATION_SI VALUES(SISEQ.NEXTVAL,?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			int cnt = 0;
			
			for(int i = 0; i < dtos.size(); i++) {
				SiDto dto = dtos.get(i);
				
				
				pstm.setString(1, dto.getSi_name());
				
				pstm.addBatch();
				cnt++;
			}
			
			int[] result = pstm.executeBatch();
			
			for(int i = 0; i < result.length; i++) {
				if(result[i] == -2) {
					res++;
				}
			}
			
			if(res == dtos.size()) {
				System.out.println("insert 성공");
			}else {
				System.out.println("insert 실패");
				rollback(con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
	}
	
	public void gu_insert(List<GuDto> dtos) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO LOCATION_GU VALUES(GUSEQ.NEXTVAL,?,?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			int cnt = 0;
			
			for(int i = 0; i < dtos.size(); i++) {
				GuDto dto = dtos.get(i);
				
				
				pstm.setInt(1, dto.getSi_no());
				pstm.setString(2, dto.getGu_name());
				
				pstm.addBatch();
				cnt++;
			}
			
			int[] result = pstm.executeBatch();
			
			for(int i = 0; i < result.length; i++) {
				if(result[i] == -2) {
					res++;
				}
			}
			
			if(res == dtos.size()) {
				System.out.println("insert 성공");
			}else {
				System.out.println("insert 실패");
				rollback(con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
	}
}
