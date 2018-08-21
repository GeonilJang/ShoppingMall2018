package shoppingMall.user;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProdListDAO {
	private static ProdListDAO insProdDAO = new ProdListDAO();
	
	private ProdListDAO() {
		
	}
	
	public static ProdListDAO getInstance() {
		return insProdDAO;
	}
	
	//싱클턴 
	private Connection getConnection() {
		Context ctx = null;
		DataSource dataSource = null;
		Connection dbconn = null;
		
		try {
			ctx = new InitialContext();
			dataSource = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
			dbconn = dataSource.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dbconn;
	}
	
	//상품 사양별로 상품 목록 가져오는 비즈니스 로직
	//다른차원 vector 를 이용해봅니다.
	public Vector<ProductDTO>
	
	
	
	
	
	
	
	
}
