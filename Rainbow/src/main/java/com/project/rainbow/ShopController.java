package com.project.rainbow;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.rainbow.service.ShopService;
import com.project.rainbow.vo.CartListVO;
import com.project.rainbow.vo.CartVO;
import com.project.rainbow.vo.OrderDetailVO;
import com.project.rainbow.vo.OrderListVO;
import com.project.rainbow.vo.OrderVO;
import com.project.rainbow.vo.ProductVO;
import com.project.rainbow.vo.ReplyVO;
import com.project.rainbow.vo.ReviewVO;

@Controller
public class ShopController {
	
	ModelAndView mv;
	
	@Autowired
	private ShopService ss;
	
	@RequestMapping(value = "/")
	public ModelAndView home() {
		mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	// 상품 전체 리스트 
	@RequestMapping(value = "/shop/listAll")
	public ModelAndView getList(ProductVO vo) throws Exception{
		mv = new ModelAndView();
		mv = ss.getList(vo);
		return mv;
	}
	
	// 카테고리별 상품 리스트
	@RequestMapping(value = "/shop/list")
	public ModelAndView getList(@RequestParam("c") int cCode, @RequestParam("l") int level, Model model) throws Exception {
		mv = new ModelAndView();
		mv = ss.getList(cCode, level);
		return mv;
	}
	
	 // 상품 상세 페이지
	 @RequestMapping(value = "/shop/product_select")
	 public ModelAndView getView(@RequestParam("n") int pNum) throws Exception {
		 mv = new ModelAndView();
		 mv = ss.product_select(pNum);
		 return mv;
	 }
	 
	 // 카트 담기
	 @ResponseBody
	 @RequestMapping(value = "/shop/product_select/addCart", method = RequestMethod.POST)
	 public int addCart(CartVO cart, HttpSession session) throws Exception {
		int result = ss.addCart(cart, session);
		return result;
	 }
	
	 // 수량 업데이트 
	 @ResponseBody
	 @RequestMapping(value = "/shop/editStock", method = RequestMethod.POST)
	 public int editStock(CartVO cart, HttpSession session) throws Exception{
		 int result = ss.editStock(cart, session);
		 return result;
	 }
	 
	 // 카트 리스트
	 @RequestMapping(value = "/shop/cartList")
	 public ModelAndView getCartList(HttpSession session) throws Exception {
		  mv = new ModelAndView();
		  mv = ss.cartList(session);
		  return mv;
	}
	 
	 // 카트 선택 삭제 
	 @ResponseBody
	 @RequestMapping(value="/shop/cartSelectDelete")
	 public int cartSelectDelete(CartVO cart, String[] chkName) throws Exception {
		int result = 0;
		int cartNum = 0;
		
		for(String val:chkName){
			cartNum = Integer.parseInt(val);
			cart.setCartNum(cartNum);
			ss.cartSelectDelete(cart);
		}
		result=1;

		return result;
	 }
	 
	 // 선택 주문
	 @RequestMapping(value="/shop/selectBuy")
	 public ModelAndView selectBuy(CartListVO cart, @RequestParam("chkName") String[] chkName) throws Exception {
		mv = new ModelAndView();
		mv = ss.selectBuy(cart, chkName);
		return mv;
	 }
	 
	 // 주문 작성 페이지 
	 @RequestMapping(value = "/shop/selectBuy", method = RequestMethod.POST)
	 public ModelAndView getorderList(@RequestParam("chkName") String[] chkName, HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		  mv = new ModelAndView();
		  mv = ss.orderInfo(chkName, session, order, orderDetail);
		  return mv;
	}
	 
	 // 주문 목록
	 @RequestMapping(value = "/shop/orderList")
	 public ModelAndView getOrderList(HttpSession session, OrderVO order) throws Exception {
		 mv = new ModelAndView();
		 mv = ss.orderList(session, order);
		 return mv;
	 }
	 
	// 주문 상세 목록
	 @RequestMapping(value = "/shop/orderView")
	 public ModelAndView getOrderList(HttpSession session, @RequestParam("n") String orderId,
		       OrderVO order) throws Exception {
		 mv = new ModelAndView();
		 mv = ss.orderView(session, orderId, order);
		 return mv;
	 }	 
	 
	// 특정 상품 주문했는지 체크 
	@ResponseBody
	@RequestMapping(value="/shop/product_select/orderCheck")
	public int orderCheck(ProductVO pvo, OrderListVO vo, HttpSession session, int pNum) throws Exception{
		int result = ss.orderCheck(session, pNum);
		return result;
	}
	
	// 리뷰 작성
	@RequestMapping(value = "/shop/review_write")
	public ModelAndView review_write(@RequestParam("n") int pNum, Model model) throws Exception {
		mv = new ModelAndView();
		mv = ss.review_write(pNum);
		return mv;
	}	
	 
	@RequestMapping(value = "/shop/review_write", method = RequestMethod.POST)
	public ModelAndView postProductInsert(ReviewVO vo, HttpSession session, MultipartFile file) throws Exception{
		mv = new ModelAndView();
		mv = ss.rvInsert(session, vo, file);
		return mv;
	}
	
	// 리뷰 수정
	@RequestMapping(value = "/shop/review_edit")
	public ModelAndView getProductEdit(@RequestParam("n") int rNum) throws Exception {
		mv = new ModelAndView();
		mv = ss.rvEdit(rNum);
		return mv;
	}

	@RequestMapping(value = "/shop/review_edit", method = RequestMethod.POST)
	public ModelAndView review_edit(@RequestParam("n") int rNum, ReviewVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		mv = new ModelAndView();
		mv = ss.review_edit(rNum, vo, file, req);
		return mv;
	}
	
	// 리뷰 삭제 
	@RequestMapping(value = "/shop/review_delete")
	public ModelAndView oneDelete(@RequestParam("n") int rNum, ReviewVO vo) throws Exception {
		mv = new ModelAndView();
		mv = ss.rvDelete(rNum, vo);
		return mv;
	}

	// 리뷰 댓글 
	@RequestMapping(value = "/shop/product_select", method=RequestMethod.POST)
	public ModelAndView insertReply(ReplyVO vo, HttpSession session) throws Exception{
		mv = new ModelAndView();
		mv = ss.insertReply(vo, session);
		return mv;
	}

	// 검색
	 @RequestMapping(value = "/shop/search")
	 public ModelAndView shopSearch (ProductVO vo) throws Exception{
		 mv = new ModelAndView();
		 mv = ss.shopSearch(vo);
		 return mv;
	 }
	
}
