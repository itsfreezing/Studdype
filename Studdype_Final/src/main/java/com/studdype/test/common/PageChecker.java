package com.studdype.test.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageChecker {
	// 한게시글에 하루에 1번만 조회수 함수
		public int chkVisited(HttpServletRequest request, HttpServletResponse response, String cookieName, String b_no) {
			int isVisit = 0; // 온 게시판?
			int isVisitPage = 0; // 온 게시글?
			Cookie[] cookies = request.getCookies(); // 모든 쿠키

			for (Cookie cookie : cookies) { // 모든 쿠키 조회

				if (cookie.getName().equals(cookieName)) { // 자유게시판에 온적이 있으면
					isVisit = 1;

					// freeboardvisit 쿠키에 글번호가 있으면
					if (cookie.getValue().contains(b_no)) {
						isVisitPage = 1; // 온적있음 -> 1
					} else { // 없으면
						cookie.setValue(cookie.getValue() + "_" + b_no); // 쿠키값 + '_게시글번호' 업데이트해줌
						response.addCookie(cookie); // 쿠키 추가
					}
				}
			}

			if (isVisit == 0) { // 자유게시판 첫 접근이면 쿠키 생성
				Cookie cookie = new Cookie(cookieName, b_no);
				cookie.setMaxAge(60 * 60 * 24); // 쿠키 하루생존
				response.addCookie(cookie); // 쿠키 추가
			}

			return isVisitPage;
		}
}
