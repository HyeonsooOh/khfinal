package com.kh.laundry.reserve.model.service;

import java.util.List;
import java.util.Map;

import com.kh.laundry.repair.model.vo.MultiRepair;
import com.kh.laundry.reserve.model.vo.Reserve;
import com.kh.laundry.reserve.model.vo.ReserveDetail;
import com.kh.laundry.washing.model.vo.Lcategory;
import com.kh.laundry.washing.model.vo.MultiCategory;

public interface ReserveService {

	// 세탁 상세 옵션들을 가져오는 메서드 틀
	List<Lcategory> selectLaundry();

	// 세탁예약을 넣는 메서드 틀
	int insertReserve(Reserve reserve);

	// 위에 세탁예약에서 예약번호를 가져오는 메서드 틀
	Reserve selectReserve(Reserve reserve);

	// 위에서 얻어온 세탁 예약번호로 세탁테이블에 선택한 세탁옵션들을 넣기
	int insertLaundry(int rNum, MultiCategory multiCategory);

	// 예약번호를 얻은 후에 수선테이블에 선택한 수선옵션들을 넣기
	int insertRepair(int rNum, MultiRepair multiRepair);
	
	//정민
	//관리자모드 서비스관리에서 예약서비스 리스트 메소드 틀
	List<Reserve> resServiceList();
	
	//관리자모드 서비스관리에서 예약서비스 리스트 배달예정 날짜 수정하기
	int updateRes(Map<String,String> reserve2);
	
	
	
	// 재웅
	// 페이징에 필요한 예약 갯수
		int reserveCount(int memNum);
		int reserveTypeCount(Map<String, Object> param);

	// 예약내역 리스트 조회
	List<Reserve> selectResList(Map<String, Object> param);
	List<Reserve> selectResTypeList(Map<String, Object> param);
	
	// 예약내역 상세정보 조회
	List<ReserveDetail> resListDetail(int resNum);

}
