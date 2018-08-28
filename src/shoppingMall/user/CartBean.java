package shoppingMall.user;

import java.util.Vector;

import shoppingMall.ProductDTO;

public class CartBean {
	private Vector<ProductDTO> cartList;
	
	public CartBean() {
		cartList = new Vector<ProductDTO>(3,1);
	}//기본생성자
	
	public void addProd(ProdListDAO pdao, String pnum, String pqty, String pspec) {

		int addPqty = Integer.parseInt(pqty.trim());

		//장바구니에 추가하고자 하는 상품이 존재 하는 경우 수량만 증가.		
		for(ProductDTO pd: cartList) {
			if(pnum.equals(pd.getPnum())){
				
				pd.setPqty(pd.getPqty()+addPqty);
				return;
				
			}
		}//end for
		
		
		//장바구니에 추가하고자 하는 상품이 존재하지 않을 경우.
		ProductDTO pdto = pdao.getProduct(pnum,pspec); //상품번호로 해시테이블로 부터 정보를 가져오기
		
		if(pdto!=null) {
			pdto.setPqty(addPqty);
			cartList.add(pdto);
		}
		
	}//addProd
	
	
	//장바구니에 있는 모든 상품 리스트를 가져오는 모듈
	public Vector<ProductDTO> getAllProducts(){
		return cartList;
	}
	
	
	//장바구니 수량 수정
	public void setModify(String pnum, String pqty) {
		int qty = Integer.parseInt(pqty.trim());
		for(ProductDTO pd:cartList) {
			if(pnum.equals(pd.getPnum())) {
				if(qty==0) {
					//삭제처리
					cartList.removeElement(pd);
					break;
				}else {
					pd.setPqty(qty);
					break;
				}
			}
		}
	}
	
	//장바구니 상품 삭제
	public void delProd(String pnum) {
		for(ProductDTO pd : cartList) {
			if(pnum.equals(pd.getPnum())) {
				cartList.removeElement(pd);
				break;
			}
		}
	}
	
	
	
	
	
	
}
