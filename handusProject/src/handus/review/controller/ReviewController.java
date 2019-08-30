package handus.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.member.service.MemberService;
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
	@RequestMapping("/drawReview")
	public List<ReviewStudio> drawReview(int sNum){
		System.out.println(reviewService.getAllRS());
		return reviewService.getAllRS();
	}
	
	@ResponseBody
	@RequestMapping("/writeReview")
	public boolean writeReview(int mNum, int grade, String content, int sNum) {
		System.out.println(mNum+" "+grade+" "+content+" "+sNum);
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
}
