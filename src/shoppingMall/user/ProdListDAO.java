package shoppingMall.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import shoppingMall.ProductDTO;

public class ProdListDAO {
	
	private static ProdListDAO insProdDAO = new ProdListDAO();
	
	private Vector<ProductDTO> pdtos;
	private Vector<ProductDTO> pdtos2;
	
	//hashTable
	Hashtable <String, Vector<ProductDTO>> hashTable = new Hashtable<String, Vector<ProductDTO>>();
	
	
	private ProdListDAO() {
		pdtos = new Vector<ProductDTO>(3,2); //처음 3개 2개씩 추가
		pdtos2 = new Vector<ProductDTO>(3,2); //처음 3개 2개씩 추가
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
	public Vector<ProductDTO> selectByPspec(String pspec) throws Exception{
		Connection dbconn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			dbconn = getConnection();
			String sql ="select * from product where pspec = ?";
			ps = dbconn.prepareStatement(sql);
			ps.setString(1,  pspec);
			rs = ps.executeQuery();
			
			
			pdtos = this.makeVector(rs);
			//상품사양별로 목록을 해시테이블에 저장
			hashTable.put(pspec, pdtos);
			
			return pdtos;
			
			
		}finally {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(dbconn != null) dbconn.close();
		}
		
	}//selectByPspec()
	
	
	
	public Vector<ProductDTO> makeVector(ResultSet rs) throws Exception{
		Vector<ProductDTO> v = new Vector<ProductDTO>();
		
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
			
			ProductDTO pdto = new ProductDTO(pnum, pname, pcategory_fk,pcompany, 
									pimage,pqty,price,pspec, pcontents,point,pinputDate,0,0);
			v.add(pdto);
		}
		return v;
	}
	
	//카테고리별로 상품리스트 가져오기@
	public Vector<ProductDTO> selectByCat(String category_fk) throws Exception{
		
		Connection dbconn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from product where pcategory_fk = ?";
		try {
			dbconn = getConnection();
			ps = dbconn.prepareStatement(sql);
			ps.setString(1, category_fk);
			rs = ps.executeQuery();
			
			pdtos2 = this.makeVector(rs);
			hashTable.put(category_fk, pdtos2);
			return pdtos2;
			
		}finally {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(dbconn != null) dbconn.close();
		}
	}
	
	
	//상품번호로 상품 정보가져오는 비즈니스 로직
	public Vector<ProductDTO> selecByPnum(String pnum) throws Exception{
		Connection dbconn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql ="select * from product where pnum=?";
		
		
		try {
			dbconn= getConnection();
			ps = dbconn.prepareStatement(sql);
			ps.setString(1, pnum);
			rs = ps.executeQuery();
			
			Vector<ProductDTO> v = this.makeVector(rs);
			return v;

		}finally {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(dbconn != null) dbconn.close();
		}
	}
	
	
	//
	public ProductDTO getProduct(String pnum, String pspec) {
		
		Vector<ProductDTO> v = hashTable.get(pspec);
		for(ProductDTO pd: v) {
			if(pnum.equals(pd.getPnum())) {
				return pd;
			}
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
}
