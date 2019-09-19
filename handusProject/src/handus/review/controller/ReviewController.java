package handus.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.member.service.MemberService;
import handus.model.ReviewItem;
import handus.model.ReviewStudio;
import handus.review.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	
	@ResponseBody
	@RequestMapping("/drawReviewS")
	public List<ReviewStudio> drawReview(int sNum){
		return reviewService.getAllRS();
	}
	@ResponseBody
	@RequestMapping("/writeReviewS")
	public boolean writeReview(int mNum, int grade, String content, int sNum) {
		ReviewStudio review = new ReviewStudio();
		review.setRs_content(content);
		review.setRs_m_pk(mNum);
		review.setRs_m_name("임시이름11"); 	// 회원번호로 회원이름 가져오기 
		review.setRs_grade(grade);
		review.setRs_s_pk(sNum);
		if(reviewService.writeReviewStudio(review)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping("/removeReviewS")
	public boolean removeReview(int rsNum){
		if(reviewService.removeReviewStudio(rsNum)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping("/modifyReviewS")
	public boolean modifyReview(ReviewStudio review) {
		System.out.println(review);
		if(reviewService.modifyReviewStudio(review)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping("/countReviewS")
	public int countReview(int sNum) {
		System.out.println(sNum);
		return reviewService.selectCountRs(sNum);
	}
	// -------------------------------------------------------------------
	@ResponseBody
	@RequestMapping("/drawReviewI")
	public List<ReviewItem> drawReviewI(int iNum){
		return reviewService.getAllRI();
	}
	@ResponseBody
	@RequestMapping("/writeReviewI")
	public boolean writeReviewI(int mNum, int grade, String content, int iNum) {
		ReviewItem review = new ReviewItem();
		review.setRi_content(content);
		review.setRi_m_pk(mNum);
		review.setRi_m_name("임시이름11"); 	// 회원번호로 회원이름 가져오기 
		review.setRi_grade(grade);
		review.setRi_i_pk(iNum);
		if(reviewService.writeReviewItem(review)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping("/removeReviewI")
	public boolean removeReviewI(int riNum){
		if(reviewService.removeReviewItem(riNum)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping("/modifyReviewI")
	public boolean modifyReview(ReviewItem review) {
		if(reviewService.modifyReviewItem(review)) {
			return true;
		}
		return false;
	}
	@ResponseBody
	@RequestMapping("/countReviewI")
	public int countReviewI(int iNum) {
		return reviewService.selectCountRI(iNum);
	}
}
