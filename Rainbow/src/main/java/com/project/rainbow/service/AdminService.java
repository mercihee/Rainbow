package com.project.rainbow.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.rainbow.dao.AdminDAO;
import com.project.rainbow.utils.UploadFileUtils;
import com.project.rainbow.vo.CategoryVO;
import com.project.rainbow.vo.MemberVO;
import com.project.rainbow.vo.ProductVO;
import com.project.rainbow.vo.ReplyVO;
import com.project.rainbow.vo.ReviewVO;

@Service
public class AdminService {
	
	ModelAndView mv;
	
	@Autowired
	private AdminDAO aDao;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 상품 등록
	public ModelAndView product_insert(CategoryVO vo) throws Exception {
		mv = new ModelAndView();
		List<CategoryVO> category = null;
		category = aDao.category();	// CategoryVO 형태의 List변수에 DB 값을 입력한다. 
		mv.addObject("category", JSONArray.fromObject(category)); // 카테고리를 JSON타입으로 변경하여 모델에 넣는다. 
		return mv;
	}

	public ModelAndView product_insert(ProductVO vo, MultipartFile file) throws Exception{
		mv = new ModelAndView();
		 String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정한다. 
		 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 날짜 폴더를 생성한다. 
		 String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
		   
		 if(file != null) {
			  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	
			  // pImg에 원본 파일 경로 + 파일명을 저장한다. 
			  vo.setpImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			  // pImg2에 썸네일 파일 경로 + 썸네일 파일명을 저장한다. 
			  vo.setpImg2(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			  
			 } else {  // 첨부된 파일이 없을시 
			  fileName = File.separator + "images" + File.separator + "noimage.png";
			  // 미리 준비된 noimage.png파일을 대신 출력한다. 
			  vo.setpImg(fileName);
			  vo.setpImg2(fileName);
		 }
		 
		aDao.product_insert(vo);		
		mv.setViewName("redirect:/admin/index");
		return mv;
	}
	
	// 상품 목록 
	public ModelAndView product_list() throws Exception{
		mv = new ModelAndView();
		List<ProductVO> list = aDao.product_list();
		mv.addObject("list", list);
		mv.setViewName("/admin/product/product_list");
		return mv;
	}	
	
	// 상품 조회
	public ModelAndView product_select(@RequestParam("n") int pNum) throws Exception {
		mv = new ModelAndView();
		ProductVO product = aDao.product_select(pNum);
		mv.addObject("product", product);
		mv.setViewName("/admin/product/product_select");
		return mv;
	}
	
	// 상품 수정
	public ModelAndView product_edit(@RequestParam("n") int pNum) throws Exception {
		mv = new ModelAndView();
		ProductVO product = aDao.product_select(pNum);
		List<CategoryVO> category = null;
		category = aDao.category();
		mv.addObject("product", product);
		mv.addObject("category", JSONArray.fromObject(category));
		return mv;
	}
	
	// 상품 수정
	public ModelAndView product_edit(ProductVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		mv = new ModelAndView();
		// 새로운 파일이 등록되었는지 체크 
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			  
		   // 기존 파일 삭제
		   new File(uploadPath + req.getParameter("pImg")).delete();
		   new File(uploadPath + req.getParameter("pImg2")).delete();
		   
		   // 새로 첨부한 파일을 등록
		   String imgUploadPath = uploadPath + File.separator + "imgUpload";
		   String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		   String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		   
		   vo.setpImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		   vo.setpImg2(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	   
		} else { // 새로운 파일이 등록되지 않았다면 기존 이미지를 그대로 사용한다. 
		   vo.setpImg(req.getParameter("pImg"));
		   vo.setpImg2(req.getParameter("pImg2"));
		}
		
		aDao.product_edit(vo);
		mv.setViewName("redirect:/admin/product/product_list");
		return mv;
	}
	
	// 상품 삭제	
	public ModelAndView product_delete(@RequestParam("n") int pNum) throws Exception {
		mv = new ModelAndView(); 
		aDao.product_delete(pNum);
		mv.setViewName("redirect:/admin/product/product_list");
		return mv;
	}

	// 회원 리스트 
	public ModelAndView member_list(MemberVO vo) throws Exception{
		mv = new ModelAndView();	
		List<MemberVO> list = aDao.list(vo);
		mv.addObject("list", list);
		mv.setViewName("/admin/member/member_list");
		return mv;
	}
	
	// 리뷰 리스트 
	public ModelAndView rv_list(ReviewVO vo) throws Exception{
		mv = new ModelAndView();
		List<ReviewVO> list = aDao.rvList(vo);
		mv.addObject("list", list);
		mv.setViewName("/admin/product/product_review");
		return mv;
	}
	
	// 리뷰 상세 
	public ModelAndView rv_select(@RequestParam("n") int rNum) throws Exception{
		mv = new ModelAndView();
		ReviewVO rv = aDao.rvSelect(rNum);
		List<ReplyVO> list = aDao.rpList(rNum);
		mv.addObject("rv", rv);
		mv.addObject("reply", list);
		mv.setViewName("/admin/product/review_select");
		return mv;
	}
	
	// 댓글 삭제 
	public ModelAndView rv_delete(@RequestParam("n") int rpNum, HttpServletRequest req) throws Exception{
		mv = new ModelAndView();
		String rNum = req.getParameter("rNum");
		aDao.rpDelete(rpNum);
		mv.setViewName("redirect:/admin/product/review_select?n="+rNum);
		return mv;
	}	
	
	
	
}
