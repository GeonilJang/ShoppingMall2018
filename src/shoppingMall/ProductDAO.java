package shoppingMall;

public class ProductDAO {
	private static ProductDAO insPDAO = new ProductDAO();
	private ProductDAO() {
		
	}
	
	
	public static ProductDAO getInstance() {
		return insPDAO;
	}
	
}
