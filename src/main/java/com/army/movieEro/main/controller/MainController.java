package com.army.movieEro.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.army.movieEro.main.JsonUtil;
import com.army.movieEro.main.service.MainService;
import com.army.movieEro.member.service.MemberService;

@Controller
public class MainController {
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value="main.do")
	public String goHome(@RequestParam(value="param", required=false) String param, Model model) {
		System.out.println("MainController 도착!!");

		List<HashMap> nowPlayingList = mainService.selectNowPlayingList(param);
		
		for (int i = 0; i < nowPlayingList.size(); i++) {
			System.out.println(nowPlayingList.get(i));
		}
		
		model.addAttribute("nowPlayingList", nowPlayingList);
		
		return "main/main";
	}

	// 개봉한 영화목록 출력
	@RequestMapping(value="nowPlayingView.do", produces="application/json; charset=utf-8")
	@ResponseBody 		
	public String ajaxNowPlayingView(@RequestParam(value="param", required=false) String param) {
		List<HashMap> nowPlayingList = mainService.selectNowPlayingList(param);
		
		for (int i = 0; i < nowPlayingList.size(); i++) {
			System.out.println(nowPlayingList.get(i));
		}	
		
		return JsonUtil.ListToJson(nowPlayingList);
	}	
	
	// 비동기로 공지사항 출력
	@RequestMapping(value="noticeView.do", produces="application/json; charset=utf-8")
	@ResponseBody 		
	public String ajaxNoticeView(@RequestParam(value="param", required=false) String param) {
		List<HashMap> notiBoardList = mainService.selectBoardList(param);
		
//		for (int i = 0; i < notiBoardList.size(); i++) {
//			System.out.println(notiBoardList.get(i));
//		}
		
		return JsonUtil.ListToJson(notiBoardList);
	}

}
