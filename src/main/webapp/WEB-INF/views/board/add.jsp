<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/template/head.jsp"/>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
</head>
<body id="page-id">
	<div id="wrapper">
		<!-- side bar -->
		<c:import url="/WEB-INF/views/template/sidebar.jsp"/>
		<%-- <c:import url="./template/sidebar.jsp"/> --%>
		<!-- side bar -->
		
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
        	<!-- Main Content -->
            <div id="content">
            	<!-- top bar -->
            	<c:import url="/WEB-INF/views/template/topbar.jsp"/>
            	<!-- top bar -->
            	
            	<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">게시글 등록</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>
                    
                    <!-- Content Row -->
					<div class="row justify-content-center">
					    <div class="col-md-7">
					        <div class="card shadow-sm mb-4">
					            <div class="card-body">
					                <form method="post">
					                	<input type="hidden" name="boardNum" value="${dto.boardNum}">
					                    <div class="form-group mb-3">
					                        <label for="witer" class="text-dark">작성자</label>
					                        <input id="witer" type="text" class="form-control" name="boardWriter" placeholder="작성자를 입력하세요">
					                    </div>
					                    <div class="form-group mb-3">
					                        <label for="title" class="text-dark">제목</label>
					                        <input id="title" type="text" class="form-control" name="boardTitle" placeholder="제목을 입력하세요">
					                    </div>					
					                    <div class="form-group mb-4">
					                        <label for="contents" class="text-dark">내용</label>
					                        <textarea id="contents" class="form-control" name="boardContents" rows="6" placeholder="내용을 입력하세요"></textarea>
					                    </div>					
					                    <button type="submit" class="btn btn-primary mr-1">
					                        등록하기
					                    </button>		
					                    <a href="list" class="btn btn-outline-primary" role="button">목록으로</a>			
					                </form>					
					            </div>
					        </div>					
					    </div>
					</div>	            	
            	</div>
	            <!-- /.container-fluid -->	            	
            </div>
            <!-- End of Main Content -->
            
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
            
    	</div>    
	</div>
	<c:import url="/WEB-INF/views/template/foot.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js">	</script>
	<script type="text/javascript">
		$("#contents").summernote();
	</script>
</body>
</html>