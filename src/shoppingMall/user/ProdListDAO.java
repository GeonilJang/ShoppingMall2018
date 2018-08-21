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
	
	//��Ŭ�� 
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
	
	//��ǰ ��纰�� ��ǰ ��� �������� ����Ͻ� ����
	//�ٸ����� vector �� �̿��غ��ϴ�.
	public Vector<ProductDTO>
	
	
	
	
	
	
	
	
}
