package shoppingMall.user;

import java.util.Vector;

import shoppingMall.ProductDTO;

public class CartBean {
	private Vector<ProductDTO> cartList;
	
	public CartBean() {
		cartList = new Vector<ProductDTO>(3,1);
	}//�⺻������
	
	public void addProd(ProdListDAO pdao, String pnum, String pqty, String pspec) {

		int addPqty = Integer.parseInt(pqty.trim());

		//��ٱ��Ͽ� �߰��ϰ��� �ϴ� ��ǰ�� ���� �ϴ� ��� ������ ����.		
		for(ProductDTO pd: cartList) {
			if(pnum.equals(pd.getPnum())){
				
				pd.setPqty(pd.getPqty()+addPqty);
				return;
				
			}
		}//end for
		
		
		//��ٱ��Ͽ� �߰��ϰ��� �ϴ� ��ǰ�� �������� ���� ���.
		ProductDTO pdto = pdao.getProduct(pnum,pspec); //��ǰ��ȣ�� �ؽ����̺�� ���� ������ ��������
		
		if(pdto!=null) {
			pdto.setPqty(addPqty);
			cartList.add(pdto);
		}
		
	}//addProd
	
	
	//��ٱ��Ͽ� �ִ� ��� ��ǰ ����Ʈ�� �������� ���
	public Vector<ProductDTO> getAllProducts(){
		return cartList;
	}
	
	
	//��ٱ��� ���� ����
	public void setModify(String pnum, String pqty) {
		int qty = Integer.parseInt(pqty.trim());
		for(ProductDTO pd:cartList) {
			if(pnum.equals(pd.getPnum())) {
				if(qty==0) {
					//����ó��
					cartList.removeElement(pd);
					break;
				}else {
					pd.setPqty(qty);
					break;
				}
			}
		}
	}
	
	//��ٱ��� ��ǰ ����
	public void delProd(String pnum) {
		for(ProductDTO pd : cartList) {
			if(pnum.equals(pd.getPnum())) {
				cartList.removeElement(pd);
				break;
			}
		}
	}
	
	
	
	
	
	
}
