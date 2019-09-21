package com.project.rainbow.dao;

import java.util.List;

import com.project.rainbow.vo.CategoryVO;
import com.project.rainbow.vo.MemberVO;
import com.project.rainbow.vo.ProductVO;
import com.project.rainbow.vo.ReplyVO;
import com.project.rainbow.vo.ReviewVO;

public interface AdminDAO {
	
	// 카테고리 
	public List<CategoryVO> category() throws Exception;
	
	// 상품 등록 
	public void product_insert(ProductVO vo) throws Exception;
	
	// 상품 목록 
	public List<ProductVO> product_list() throws Exception;
	
	// 상품 한 개 조회 + 카테고리 조인
	public ProductVO product_select(int pNum) throws Exception;

	// 상품 수정 
	public void product_edit(ProductVO vo) throws Exception;
	
	// 상품 삭제 전 체크 
	public int cartCheck(int pNum) throws Exception;
	
	// 상품 삭제
	public void product_delete(int pNum) throws Exception;
	
	// 회원 리스트
	public List<MemberVO> list(MemberVO vo) throws Exception;
	
	// 회원수 
	public int memberCount(MemberVO vo) throws Exception;
	
	// 리뷰 리스트 
	public List<ReviewVO> rvList(ReviewVO vo) throws Exception;
	
	// 리뷰 상세 
	public ReviewVO rvSelect(int rNum) throws Exception;
		
	// 댓글 리스트 
	public List<ReplyVO> rpList(int rNum) throws Exception;
	
	// 댓글 삭제 
	public void rpDelete(int rpNum) throws Exception;
}
