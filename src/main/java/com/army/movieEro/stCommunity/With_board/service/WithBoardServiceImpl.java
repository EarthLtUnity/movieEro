package com.army.movieEro.stCommunity.With_board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.stCommunity.With_board.dao.WithBoardDao;
import com.army.movieEro.stCommunity.With_board.vo.WithBoard;
import com.army.movieEro.stCommunity.With_board.vo.WithBoard_sub;

@Service("bService")
public class WithBoardServiceImpl implements WithBoardService {

	@Autowired
	WithBoardDao bDao;
	
	// 리스트 갯수 가져오기
	@Override
	public int getListCount() {
		return bDao.getListCount();
	}

	// 메인 Table 전체 출력
	@Override 
	public ArrayList<WithBoard> selectList(int currentPage, int limit) {
		System.out.println("service Impl");
		return bDao.selectList(currentPage, limit);
	}

	// 서브 Table 전체 출력
	@Override
	public ArrayList<WithBoard_sub> selectListsub(int currentPage, int limit) {
		return bDao.selectListsub(currentPage, limit);
	}
	
	// 게시판 추가
	@Override
	public int insertBoard(WithBoard b) {
		return bDao.insertBoard(b);
	}

	// 결제 & 참여
	@Override
	public int withReserve(int bNo, String bNo_id) {
		// 유효성 검증
		WithBoard_sub wSub = new WithBoard_sub();
		wSub.setWITH_BOARD_NO(bNo);
		wSub.setWITH_BOARD_NOW_ID(bNo_id);
		return bDao.withReserve(wSub);		
	}

	// Search
	// searchListCount
	@Override
	public int getListCountSearch(String keyword) {
		return bDao.getListCountSearch(keyword);
	}
	
	// searchList
	@Override
	public HashMap<String, Object> searchList(int currentPage, int limit, String word) {
		
		// 검색한 게시판
		ArrayList<WithBoard> list = bDao.searchList(currentPage, limit, word);
		
		// 전체 sub 게시글 정보 (검색한 게시판 NO 와 비교할 원본)
		ArrayList<WithBoard_sub> list_sub = bDao.selectListsub(currentPage, limit);
		
		// 비교한 결과를 받을 List
		ArrayList<WithBoard_sub> sub_result = new ArrayList<WithBoard_sub>();
		
		// 두 개의 객체를 넘길 하나의 Map 객체 (최종적으로 넘길 값)
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i = 0; i< list.size() ; i++) {
			System.out.println(list.get(i).getWITH_BOARD_NO()+"번째 검색 시작합니다.");
			for(int j = 0 ; j < list_sub.size() ; j++) {
				if(list.get(i).getWITH_BOARD_NO() == list_sub.get(j).getWITH_BOARD_NO()) {
					System.out.println(i+"번째에 해당하는 join 정보" + list_sub.get(j));
					sub_result.add(list_sub.get(j));
				}
			}
		}
		
		map.put("searchList", list);
		map.put("searchSubList", sub_result);
		
		return map;
	}

	@Override
	public int writerPhoneNumber(String writerId) {
		System.out.println("22"+writerId);
		return bDao.writerPhoneNumber(writerId);
		
	}
}
