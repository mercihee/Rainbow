package com.project.rainbow;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.rainbow.service.AdminService;
import com.project.rainbow.vo.CategoryVO;
import com.project.rainbow.vo.MemberVO;
import com.project.rainbow.vo.ProductVO;
import com.project.rainbow.vo.ReviewVO;

@Controller
public class AdminController {
	
	ModelAndView mv;
	
	@Autowired
	private AdminService as;
	
	// 관리자 화면 
	@RequestMapping(value = "/admin/index")
	public ModelAndView getIndex() throws Exception{
		mv = new ModelAndView();
		mv.setViewName("/admin/index");
		return mv;
	}
	
	// 상품 등록
	@RequestMapping(value = "/admin/product/product_insert")
	public ModelAndView product_insert(CategoryVO vo) throws Exception {
		mv = new ModelAndView();
		mv = as.product_insert(vo);
		return mv;
	}
	
	@RequestMapping(value = "/admin/product/product_insert", method = RequestMethod.POST)
	public ModelAndView product_insert(ProductVO vo, MultipartFile file) throws Exception{
		mv = new ModelAndView();
		mv = as.product_insert(vo, file);
		return mv;		 
	}
	
	// 상품 목록 
	@RequestMapping(value = "/admin/product/product_list")
	public ModelAndView product_list() throws Exception{
		mv = new ModelAndView();
		mv = as.product_list();
		return mv;	
	}
	
	// 상품 조회
	@RequestMapping(value = "/admin/product/product_select")
	public ModelAndView product_select(@RequestParam("n") int pNum) throws Exception {
		mv = new ModelAndView();
		mv = as.product_select(pNum);
		return mv;	
	}
	
	// 상품 수정
	@RequestMapping(value = "/admin/product/product_edit")
	public ModelAndView product_edit(@RequestParam("n") int pNum) throws Exception {
		mv = new ModelAndView();
		mv = as.product_edit(pNum);
		return mv;	
	}
	
	// 상품 수정
	@RequestMapping(value = "/admin/product/product_edit", method = RequestMethod.POST)
	public ModelAndView product_edit(ProductVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		mv = new ModelAndView();
		mv = as.product_edit(vo, file, req);
		return mv;	
	}
	
	// 상품 삭제	
	@RequestMapping(value = "/admin/product/product_delete", method = RequestMethod.POST)
	public ModelAndView product_delete(@RequestParam("n") int pNum) throws Exception {
		mv = new ModelAndView();
		mv = as.product_delete(pNum);
		return mv;	
	}

	// 회원 리스트 
	@RequestMapping(value = "/admin/member/member_list")
	public ModelAndView member_list(MemberVO vo) throws Exception{
		mv = new ModelAndView();
		mv = as.member_list(vo);
		return mv;	
	}
	
	// 리뷰 리스트 
	@RequestMapping(value = "/admin/product/product_review")
	public ModelAndView rv_list(ReviewVO vo) throws Exception{
		mv = new ModelAndView();
		mv = as.rv_list(vo);
		return mv;	
	}
	
	// 리뷰 상세 
	@RequestMapping(value = "/product/review_select")
	public ModelAndView rv_select(@RequestParam("n") int rNum) throws Exception{
		mv = new ModelAndView();
		mv = as.rv_select(rNum);
		return mv;	
	}
	
	// 댓글 삭제 
	@RequestMapping(value="/product/rpDelete")
	public ModelAndView rv_delete(@RequestParam("n") int rpNum, HttpServletRequest req) throws Exception{
		mv = new ModelAndView();
		mv = as.rv_delete(rpNum, req);
		return mv;	
	}

	
}
