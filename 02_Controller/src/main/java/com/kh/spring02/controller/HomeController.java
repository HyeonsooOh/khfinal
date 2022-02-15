package com.kh.spring02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 컨트롤러임을 명시(등록한다)
public class HomeController {
	
	/*
	 * 컨트롤러 클래스 내부
	 * 메소드를 만들어서 요청에 대한 처리내용을 작성
	 * => 메소드는 항상 public 으로 구현
	 * => 반환(return) 데이터는 반드시 연결될 주소가 포함(== 문자열 형식)
	 * => 메소드명은 내맘대로
	 * => 매개변수는 있어도되고 없어도 된다.
	 */
	
	//@RequestMapping(value="url맵핑값")
	// 요청에 대한 맵핑(url 연결) 을 설정하였다.
	@RequestMapping(value="/home.do")
	public String home() {
		// 처리할 코드
		// 값뽑아서 -> vo 가공하고 -> Service 단으로 토스 -> 결과에 따라서 응답뷰 지정
		
		// return "응답뷰 파일의 위치";
		// 결과에 따라서 응답뷰 지정
		
		return "home";
	}
	@RequestMapping(value="/test.do")
	public String test() {
		return "test";
}
	

	@RequestMapping(value="/java.do")
	
	public String java() {
		
		return "java";	
		}
}
