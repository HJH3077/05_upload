<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// <form action="result.jsp" method="post" enctype="multipart/form-data">를 사용하면
	// request를 사용할 수 없다. 파라미터 값이 null임.
	// cos.jar 안에 존재하는 MultipartRequest 클래스를 사용해야 된다.
	
	// String name = request.getParameter("name");
	// System.out.println("name : " + name);  =>  null 이 나옴.
	// method를 get으로하면 파라미터 값은 오는데 업로드파일이 오지않음
	
	// cos.jar안에 있는 MultipartRequest 클래스의 주요 메소드
 	// String 인자는 input type="file" name="name"의 "name" 부분이다.
	// - getParameter(String) : String
 	// - geparameterValues(String) : String[]
 	// - getOriginalFileName(String) : 업로드 당시의 파일이름
 	// - getFilesystemName(String) : 저장 당시의 파일이름
 	// - getContentType(String) : 해당 문서의 종류
 	// - getFile(String) : 업로드된 파일을 FileClass 객체로 변경해서 처리하자
 	//					   .getName() : 파일 이름
 	//					   .length() : 파일 크기를 byte 처리
 	//					   .lastModified : 마지막 수정날짜 등을 구할 수 있다.
 	
 	// 1. 실제 파일이 저장될 위치를 구하자 (톰켓안의 프로젝트 안에 위치)
 	String path = getServletContext().getRealPath("/upload"); // c가 아닌 톰켓의 프로젝트 안임
 	
 	// 2. MutipartRequest 객체 생성
 	MultipartRequest mr =
 		new MultipartRequest(
 					request, 		// 요청정보
 					path, 	 		// 저장위치
 					100*1024*1024, 	//업로드 용량(100MB)
 					"utf-8",		// 인코딩(한글처리)
 					new DefaultFileRenamePolicy() // 파일이름 중복 처리
 				);
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>