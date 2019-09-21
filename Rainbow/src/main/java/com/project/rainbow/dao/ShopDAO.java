package com.project.rainbow.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.rainbow.vo.CartListVO;
import com.project.rainbow.vo.CartVO;
import com.project.rainbow.vo.OrderDetailVO;
import com.project.rainbow.vo.OrderListVO;
import com.project.rainbow.vo.OrderVO;
import com.project.rainbow.vo.ProductVO;
import com.project.rainbow.vo.ReplyVO;
import com.project.rainbow.vo.ReviewVO;

@Repository
public interface ShopDAO {

	// 상품 리스트
	public List<ProductVO> list(ProductVO vo) throws Exception;
	
	// 카테고리 상품 리스트 1
	public List<ProductVO> list_1(HashMap<String, Object> map) throws Exception;

	// 카테고리 상품 리스트 2
	public List<ProductVO> list_2(int cCode) throws Exception;
	
	// 상품 조회
	public ProductVO product_select(int pNum) throws Exception;
	
	// 리뷰 리스트 
	public List<ReviewVO> rvList(int pNum) throws Exception;
		
	// 댓글 리스트 
	public List<ReplyVO> rpList(int pNum) throws Exception;
	
	// 카트 담기
	public void addCart(CartVO cart) throws Exception;
	
	// 카트에 담겨있는 제품인지 확인 
	public int cartCheck(HashMap<String, Object> map) throws Exception;
	
	// 카트 수량 업데이트 
	public void editStock(CartVO cart) throws Exception;
	
	// 카트에 동일한 제품이 담겨있을 때 수량만 업데이트 
	public void updateCart(CartVO cart) throws Exception;
	
	// 카트 개수
	public int cart_number(String userId) throws Exception;
	
	// 카트 합계
	public int getResultCartAll(String id) throws Exception;
	
	// 카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	
	// 카트 선택 삭제 
	public void cartSelectDelete(CartVO cart) throws Exception;
	
	// 선택 주문 
	public CartListVO selectBuy(int cartNum) throws Exception;
	
	// 주문 작성 
	public void orderInfo(OrderVO order) throws Exception;
	
	// 주문 상세 정보 
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	// 주문한 상품 카트에서 삭제 
	public void select_order_delete(int cartNum) throws Exception;
	
	// 회원 주문 목록 
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	// 회원 주문 상세 목록 
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	// 검색 카운트 조회
	public int searchCount(ProductVO vo) throws Exception;
	
	// 검색 
	public List<ProductVO> shopSearch(ProductVO vo) throws Exception;
	
	// 특정상품 구매했는지 체크 
	public int orderCheck(HashMap<String, Object> map) throws Exception;
	
	// 리뷰 등록 
	public void rvInsert(ReviewVO vo) throws Exception;
	
	// 리뷰 수정 
	public void rvEdit(ReviewVO vo) throws Exception;
	
	// 리뷰 상세 
	public ReviewVO rvSelect(int rNum) throws Exception;
	
	// 리뷰 삭제
	public void rvDelete(int rNum) throws Exception;
	
	// 리뷰 댓글 
	public void insertReply(ReplyVO reply) throws Exception;

	
}
