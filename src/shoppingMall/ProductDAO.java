package shoppingMall;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDAO {
	private static ProductDAO insPDAO = new ProductDAO();
	private ProductDAO() {
		
	}
	
	
	public static ProductDAO getInstance() {
		return insPDAO;
	}
	
	
	//connection pool에서 connection 확보
	private Connection getConnection() {
		Context ctx = null;
		DataSource db = null;
		Connection dbconn = null;
		
		try {
			ctx = new InitialContext();
			db = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
			dbconn = db.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dbconn;
	}
	
	
	//상품등록 모듈
	public int registerProduct(MultipartRequest multi) throws SQLException{
		Connection dbconn = null;
		PreparedStatement ps = null;
		
		
		try {
			dbconn = getConnection();
			String sql = "insert into product values(product_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
			ps = dbconn.prepareStatement(sql);
			
			String pname = multi.getParameter("pname");
			String pcategory_pk = multi.getParameter("pcategory_fk");
			String pcompany = multi.getParameter("pcompany");
			String pimage = multi.getFilesystemName("pimage");
			String pqty = multi.getParameter("pqty");
			String price = multi.getParameter("price");
			String pspec = multi.getParameter("pspec");
			String pcontents = multi.getParameter("pcontents");
			String point = multi.getParameter("point");
			
			ps.setString(1, pname);
			ps.setString(2, pcategory_pk);
			ps.setString(3, pcompany);
			ps.setString(4, pimage);
			ps.setString(5, pqty);
			ps.setString(6, price);
			ps.setString(7, pspec);
			ps.setString(8, pcontents);
			ps.setString(9, point);
			
			int n = ps.executeUpdate();
			return n;
			
		}finally {
			if(ps != null)ps.close();
			if(dbconn != null)dbconn.close();
		}
	}
	
	//상품 리스트 구하기
	public ArrayList<ProductDTO> productAll() throws SQLException{
	
		Connection dbconn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql ="select *  from product order by pnum desc";
		
		try {
			dbconn = getConnection();
			ps = dbconn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> pdtos = makeArrayList(rs);
			return pdtos;
		}finally {
			if(dbconn != null) dbconn.close();
			if( ps!= null) ps.close();
			if( rs != null) rs.close();
		}
	}//productAll();
	
	
	private ArrayList<ProductDTO> makeArrayList(ResultSet rs) throws SQLException{
		
		ArrayList<ProductDTO> pdtos = new ArrayList<ProductDTO>();
		
		while(rs.next()) {
			String pnum = rs.getString(1);
			String pname = rs.getString(2);
			String pcategory_fk = rs.getString(3);
			String pcompany = rs.getString(4);
			String pimage = rs.getString(5);
			int pqty = rs.getInt(6);
			int price = rs.getInt(7);
			String pspec = rs.getString(8);
			String pcontents = rs.getString(9);
			int point = rs.getInt(10);
			Date d = rs.getDate(11);
			String pinputDate = d.toString();
			
			ProductDTO pdto = new ProductDTO(pnum, pname, pcategory_fk,pcompany, pimage, pqty, price, pspec, pcontents, point, pinputDate, 0, 0);
			pdtos.add(pdto);
		}

		return pdtos;
	}//makeArrayList()
	
	
	//selectProduct() 상품번호로 특정상품 가져오기
	public ProductDTO selectProduct(String pnum) throws SQLException {
		Connection dbconn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ProductDTO pdto = null;
		
		
		String sql = "select * from product where pnum=?";
		
		try {
			dbconn = getConnection();
			ps = dbconn.prepareStatement(sql);
			ps.setString(1, pnum);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> pdtos = this.makeArrayList(rs);
			if(pdtos != null && pdtos.size() !=0) {
				pdto = pdtos.get(0);
			}
			return pdto;
		}finally {
			if(dbconn != null) dbconn.close();
			if( ps!= null) ps.close();
			if( rs != null) rs.close();
		}
	}// end of selectProduct
	

	
	//상품정보를 수정처리하는 로직
	public int updateProd(MultipartRequest multi) throws SQLException {
		Connection dbconn = null;
		PreparedStatement ps = null;
		
		String pname = multi.getParameter("pname");
		String pcategory_fk = multi.getParameter("pcategory_fk");
		String pcompany = multi.getParameter("pcompany");
		String pimageNew = multi.getFilesystemName("pimageNew");
		if(pimageNew == null) {
			pimageNew = multi.getParameter("pimageOld");
		}
		
		String pqty = multi.getParameter("pqty");
		String price = multi.getParameter("price");
		String pspec = multi.getParameter("pspec");
		String pcontents = multi.getParameter("pcontents");
		String point = multi.getParameter("point");
		String pnum = multi.getParameter("pnum");
		
		
		
		String sql = "update product set pname=?,"
				+"pcategory_fk=?, pcompany=?, pimage=?,"
				+"pqty=?, price=?, pspec=?, pcontents=?, point=?,"
				+"pinputDate=sysdate where pnum=?";
		
		try {
			dbconn = getConnection();
			ps = dbconn.prepareStatement(sql);
			ps.setString(1, pname);
			ps.setString(2, pcategory_fk);
			ps.setString(3, pcompany);
			ps.setString(4, pimageNew);
			ps.setInt(5, Integer.parseInt(pqty));
			ps.setInt(6, Integer.parseInt(price));
			ps.setString(7, pspec);
			ps.setString(8, pcontents);
			ps.setInt(9, Integer.parseInt(point));
			ps.setInt(10, Integer.parseInt(pnum));
			
			int n = ps.executeUpdate();
			
			return n;
			
		}finally{
			if(dbconn != null) dbconn.close();
			if( ps!= null) ps.close();
		}
	}//updateProd()
	
	
	public int delProd(String pnum) throws SQLException {
		int n = 0;
		Connection dbconn = null;
		PreparedStatement ps = null;
		String sql = "delete from product where pnum=?";
		
		try {
			dbconn = getConnection();
			ps = dbconn.prepareStatement(sql);
			ps.setString(1, pnum);
			n = ps.executeUpdate();
			
			
		}finally {
			if(dbconn != null) dbconn.close();
			if(ps!= null) ps.close();
		}
		return n;
	}//delProd()
	
	
}
