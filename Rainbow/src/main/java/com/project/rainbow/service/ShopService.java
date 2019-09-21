package com.project.rainbow.service;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.rainbow.dao.ShopDAO;
import com.project.rainbow.utils.UploadFileUtils;
import com.project.rainbow.vo.CartListVO;
import com.project.rainbow.vo.CartVO;
import com.project.rainbow.vo.MemberVO;
import com.project.rainbow.vo.OrderDetailVO;
import com.project.rainbow.vo.OrderListVO;
import com.project.rainbow.vo.OrderVO;
import com.project.rainbow.vo.ProductVO;
import com.project.rainbow.vo.ReplyVO;
import com.project.rainbow.vo.ReviewVO;


@Service
public class ShopService {

	ModelAndView mv;
	
	@Autowired
	private ShopDAO sDao;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 상품 리스트
	public ModelAndView getList(ProductVO vo) throws Exception{
		mv = new ModelAndView();
		List<ProductVO> list = sDao.list(vo);
		mv.setViewName("/shop/listAll");
		mv.addObject("list", list);
		return mv;
	}
	
	// 카테고리별 상품 리스트
	public ModelAndView getList(int cCode, int level) throws Exception{
		mv = new ModelAndView();
		int cCodeRef = 0;
		// 1차 
		if(level == 1) {
			cCodeRef = cCode;
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cCode", cCode);
			map.put("cCodeRef", cCodeRef);
			List<ProductVO> list = sDao.list_1(map);
			mv.addObject("list", list);
		}else {
			// 2차
			List<ProductVO> list = sDao.list_2(cCode);
			mv.addObject("list", list);
		}
		
		mv.setViewName("/shop/list");
		
		return mv;
	}
	
	// 상품 조회
	public ModelAndView product_select(int pNum) throws Exception{
		mv = new ModelAndView();
		ProductVO product = sDao.product_select(pNum);
		List<ReviewVO> list = sDao.rvList(pNum);
		List<ReplyVO> reply = sDao.rpList(pNum);
		mv.addObject("reply", reply);
		mv.addObject("product", product);
		mv.addObject("list", list);
		mv.setViewName("/shop/product_select");
		return mv;
	}
	
	// 카트 담기
	public int addCart(CartVO cart, HttpSession session) throws Exception{
		int result = 0;
		MemberVO member = (MemberVO)session.getAttribute("member");
		// 로그인한 아이디를 가져온다.
		if(member != null) {	// 로그인을 했을시 
			cart.setUserId(member.getUserId());
			// 해당 아이디와 상품 번호로 값이 이미 존재하는지 체크한다.
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("userId", cart.getUserId());
			map.put("pNum", cart.getpNum());
			int cartCheck = sDao.cartCheck(map);
			if(cartCheck==0) {
				sDao.addCart(cart);	// 값이 존재하지 않으면 카트 테이블에 insert 한다.
				result=1;
			}else {
				sDao.updateCart(cart);	// 값이 존재하면 정한 수량만큼 update 한다.
				result=1;	// result 값을 넘겨서 장바구니 페이지로 이동한다. 
			}
		}	// 로그인을 안 했을시 session 값이 없기 때문에 카트에 담지 못한다. 
		
		return result;
	}
	
	// 카트 수량 업데이트 
	public int editStock(CartVO cart, HttpSession session) throws Exception{
		int result = 0;
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member != null) {
			cart.setUserId(member.getUserId());
			sDao.editStock(cart);
			result=1;
		} 
		return result;
	}
	
	// 카트 개수
	public ModelAndView cart_number(String userId) throws Exception{
		mv = new ModelAndView();
		
		return mv;
	}
		
	// 카트 합계
	public ModelAndView getResultCartAll(String userId) throws Exception{
		mv = new ModelAndView();
		
		return mv;
	}
	
	// 카트 리스트
	public ModelAndView cartList(HttpSession session) throws Exception{
		mv = new ModelAndView();
		 MemberVO member = (MemberVO)session.getAttribute("member");	// session 값을 가져온다. 
		 int dbCount = sDao.cart_number(member.getUserId());	
		 // 로그인한 아이디로 카트 테이블에 담긴 값이 있는지 조회.
		  
		 if(dbCount != 0) {
			 List<CartListVO> cartList = sDao.cartList(member.getUserId()); 
			 // 해당 아이디의 테이블 값을 cartList에 담는다.
			 int cartPrice = sDao.getResultCartAll(member.getUserId());
			 // 카트 테이블 상품의 총 금액을 가져온다.
			 int ship = 0;
			 int allPrice = 0;
			 if(cartPrice <= 100000){	
				ship = 2500; // 금액이 100000원 이하일 때 배송비가 붙는다. 
				allPrice = cartPrice + ship;
			}else {
				allPrice = cartPrice;
			}

			mv.addObject("cartPrice", cartPrice);
			mv.addObject("list", cartList);
			mv.addObject("allPrice", allPrice);
			mv.addObject("dbCount", dbCount);
			mv.addObject("ship", ship);
		}else {
			mv.addObject("dbCount", dbCount);
			mv.setViewName("/shop/cartList");
		}
		
		return mv;
	}
	
	// 카트 선택 삭제 
	public void cartSelectDelete(CartVO cart) throws Exception{
		sDao.cartSelectDelete(cart);
	}
	
	// 선택 주문 
	public ModelAndView selectBuy(CartListVO cart, String[] chkName) throws Exception{
		mv = new ModelAndView();
		int cartNum = 0;
		int cartPrice = 0;
		int allPrice = 0;
		int ship = 0;
		List<CartListVO> list = new ArrayList();
		
		for(String val:chkName){
			cartNum = Integer.parseInt(val);
			cart = sDao.selectBuy(cartNum);
			cartPrice += cart.getCartStock() * cart.getpPrice();
			list.add(cart);
		}
		
		int num = cart.getCartNum();
		
		if(cartPrice<=100000) {
			ship = 2500;
			allPrice = cartPrice + ship;
		}else {
			allPrice = cartPrice;
		}
		
		mv.addObject("num", num);
		mv.addObject("list", list);
		mv.addObject("cartPrice", cartPrice);
		mv.addObject("allPrice", allPrice);
		mv.addObject("ship", ship);
		mv.setViewName("/shop/selectBuy");
		return mv;
	}
		
	// 주문 작성 
	public ModelAndView orderInfo(@RequestParam("chkName") String[] chkName, HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception{
		mv = new ModelAndView();
		
		MemberVO member = (MemberVO)session.getAttribute("member");  
		String userId = member.getUserId();
		int cartNum = 0;
		
		Calendar cal = Calendar.getInstance();	// 캘린더를 이용하여 연/월/일을 추출한다. 
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		  
		for(int i = 1; i <= 6; i ++) {		// 고유한 주문번호를 생성하기 위해
			subNum += (int)(Math.random() * 10); // 6자리의 랜덤 숫자로 subNum을 더한다.
		}								
		  
		String orderId = ymd + "_" + subNum;	// 날짜_랜덤숫자 6자리 주문번호. 

		order.setOrderId(orderId);
		order.setUserId(userId);
		sDao.orderInfo(order);
		orderDetail.setOrderId(orderId);   

		for(String val:chkName){
			cartNum = Integer.parseInt(val);
			System.out.println(cartNum);
			orderDetail.setCartNum(cartNum);
			System.out.println("오더디테일==="+orderDetail.getCartNum());
			sDao.orderInfo_Details(orderDetail);
			sDao.select_order_delete(cartNum);
		}
		
		mv.setViewName("redirect:/shop/orderList"); 
		return mv;
	}
	
	// 주문 목록 
	public ModelAndView orderList(HttpSession session, OrderVO order) throws Exception{
		mv = new ModelAndView();
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		order.setUserId(userId);
		List<OrderVO> orderList = sDao.orderList(order);
		mv.addObject("orderList", orderList);
		mv.setViewName("/shop/orderList");
		return mv;
	}
			
	// 주문 상세 정보 
	public ModelAndView orderView(HttpSession session, @RequestParam("n") String orderId,
		       OrderVO order) throws Exception{
		mv = new ModelAndView();
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		  
		order.setUserId(userId);
		order.setOrderId(orderId);
		  
		List<OrderListVO> orderView = sDao.orderView(order);
		mv.addObject("orderView", orderView);
		mv.setViewName("/shop/orderView");
		return mv;
	}
	
	// 특정상품 구매했는지 체크 
	public int orderCheck(HttpSession session, int pNum) throws Exception{
		int result = 0;
		MemberVO member = (MemberVO)session.getAttribute("member");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", member.getUserId());
		map.put("pNum", pNum);
		if(member != null) {
			result = sDao.orderCheck(map);
		}
		return result;
	}
	
	// 리뷰 작성
	public ModelAndView review_write(@RequestParam("n") int pNum) throws Exception {
		mv = new ModelAndView();
		ProductVO product = sDao.product_select(pNum);
		mv.addObject("product", product);
		mv.setViewName("/shop/review_write");
		return mv;
	}
	
	// 리뷰 등록 
	public ModelAndView rvInsert(HttpSession session, ReviewVO vo, MultipartFile file) throws Exception{
		mv = new ModelAndView();
		MemberVO member = (MemberVO)session.getAttribute("member");
		 String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월일 폴더를 생성
		 String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
		   
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  
			 // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
			  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	
			  // gdsImg에 원본 파일 경로 + 파일명 저장
			  vo.setrImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			  
		}else{  // 첨부된 파일이 없으면
			 fileName = "null";
			 vo.setrImg(fileName);
		}
		
		vo.setUserId(member.getUserId());
		vo.setUserName(member.getUserName());
		sDao.rvInsert(vo);
		mv.setViewName("redirect:/shop/product_select?n="+vo.getpNum());
		return mv;
	}

	// 리뷰 수정 
	public ModelAndView rvEdit(@RequestParam("n") int rNum) throws Exception{
		mv = new ModelAndView();
		ReviewVO vo = sDao.rvSelect(rNum);
		mv.addObject("product", vo);
		mv.setViewName("/shop/review_edit");
		return mv;
	}

	// 리뷰 수정
	@RequestMapping(value = "/shop/review_edit", method = RequestMethod.POST)
	public ModelAndView review_edit(@RequestParam("n") int rNum, ReviewVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		mv = new ModelAndView();
		// 새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				  
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("rImg")).delete();
			   
			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			   
			vo.setrImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		   
		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setrImg(req.getParameter("rImg"));
		}
		vo.setrNum(rNum);
		sDao.rvEdit(vo);
		mv.setViewName("redirect:/shop/product_select?n="+vo.getpNum());
		return mv;
	}
	
	// 리뷰 삭제
	public ModelAndView rvDelete(@RequestParam("n") int rNum, ReviewVO vo) throws Exception{
		mv = new ModelAndView();
		vo = sDao.rvSelect(rNum);
		sDao.rvDelete(rNum);
		mv.setViewName("redirect:/shop/product_select?n="+vo.getpNum());
		return mv;
	}

	// 리뷰 댓글 
	public ModelAndView insertReply(ReplyVO vo, HttpSession session) throws Exception{
		mv = new ModelAndView();
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setUserId(member.getUserId());
		sDao.insertReply(vo);
		mv.setViewName("redirect:/shop/product_select?n="+vo.getpNum());
		return mv;
	}
		
	// 검색 
	public ModelAndView shopSearch(ProductVO vo) throws Exception{
		mv = new ModelAndView();
		int result = sDao.searchCount(vo);
		
		if(result != 0) {
			List<ProductVO> list = sDao.shopSearch(vo);
			mv.addObject("list", list);
		}else {
			String text = "해당 상품이 존재하지 않습니다.";
			mv.addObject("text", text);
		}
		mv.addObject("sname", vo.getpName());
		mv.setViewName("/shop/search");
		return mv;
	}
		
}
