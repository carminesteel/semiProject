<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../home.css">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="../enter.css" media="all" />
<title>이거어때</title>
</head>
<body>
   <div id=divPage>
   <div id="divTop"><jsp:include page="../top2.jsp" /></div>
		<div class="dropmenu">
			<ul id="dm_ul" style="background:white">
				<li><a id=plist href="/semiProject/product/list.jsp">상품리스트</a></li>&nbsp;&nbsp;&nbsp;

				<li>현황관리
					<ul>
						<li><a class=alist href="/semiProject/stock/list.jsp">재고현황</a></li>
						<li><a class=alist href="/semiProject/sell_status/list.jsp">판매현황</a></li>
						<li><a class=alist href="/semiProject/order/list.jsp">발주현황</a></li>
					</ul>
				</li>&nbsp;&nbsp;&nbsp;
				<li>등록관리
					<ul>
						<li><a class=alist href="/semiProject/cart/cartList.jsp">발주등록</a></li>
						<li><a class=alist href="/semiProject/product/insert.jsp">상품등록</a></li>
					</ul>
				</li>&nbsp;&nbsp;&nbsp;
				<li><a href="/semiProject/bbs/list.jsp" style=text-decoration:none;color:#2569C9>이거어때?</a>
						<ul>
							<li><a class=alist href="/semiProject/bbs/insert.jsp">제안해요</a></li>
						</ul>
					</li>
			</ul>
		</div>
		
	
     <div id=header></div>
      <div id=center>
         <div id=menu><jsp:include page="../menu.jsp" /></div>
         <!-- contents -->
         <div id="contents" style="margin: auto;">
         	<br><br>	<br><br>
            <ul id="holder" class="txtControll">
            </ul>
            <h1 style=margin-bottom:35px;text-align:center>이거어때?</h1>
            <div class="relCon">
               <!-- 아이디어 작성하기 -->
               <div class="proposal idea">
                  <div class="info_comment">
                     <dl>
                        <dt>알려드립니다.</dt>
                        <dd>
                           <ul>
                              <li>단순 불만 사항, 장난성 글, 욕설 및 비방, 광고글, 반복 게시물 등은 예고 없이 삭제될 수
                                 있습니다.</li>
                              <li>게시판 성격에 맞지 않는 글은 임의로 이동되거나 삭제될 수 있습니다.</li>
                           </ul>
                        </dd>
                     </dl>
                  </div>

                  <div class="staffTit mb20">
                     <h3 class="fl">기본 입력 항목</h3>
                     <p class="fr" style="width: 785px; float: right;">
                    
                     </p>
                  </div>
                  <div class="table04 mb40">
                     <form name="frm" action="insert" method="post" style=height:300px;>
                        <table id=tbl  
                          style="table-layout: fixed;">
                           <colgroup>
                              <col width="140">
                              <col width="*">
                           </colgroup>
                           <tbody>
                              <tr>
                                 <th><span>제목</span><img src="check.png" alt="필수 입력 사항"
                                    class="essential"></th>
                                 <td><label for="title"><input type="text"
                                       name="title" class="input_text" id="title"
                                       style="width: 785px;" placeholder="제목은 40자 이내로 작성해주세요." /></label></td>
                              </tr>
                              <tr>
                                 <th><span>내용</span><img src="check.png" alt="필수 입력 사항"
                                    class="essential"></th>
                                 <td class="contentsTxt"><textarea name="contents"
                                       class="textarea" style="width: 795px;" id="content"
                                       value="내용을 입력하세요"></textarea></td>
                              </tr>
                           </tbody>
                        </table>
                        <input type=button id="golist" value="목록" style= "background-color: #2569C9;
  border: none;
  color: white;
  padding: 5px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;">
                        <input type=submit
                           value="아이디어 작성 완료" style= "background-color: #2569C9;
  border: none;
  color: white;
  padding: 5px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;"> <input type=reset value="취소" style= "background-color: #2569C9;
  border: none;
  color: white;
  padding: 5px 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius:10px;">
                     </form>
                  </div>
                  <!--// 아이디어 작성하기 -->
               </div>
            </div>
            <!--// contents -->
         </div>
      </div>
      <div id="divFoot" style="text-align: center"><jsp:include
            page="../footer.jsp" /></div>
   </div>
</body>
<script>

$(".dropmenu ul li").hover(function(){
	$(this).find("ul").stop().fadeToggle(300);
})
	//목록으로 이동
	$("#golist").on("click",function(){
		location.href="/semiProject/bbs/list.jsp";
	});
	
   //값이 들어가있는지 체크하는 식
   $(frm).submit(function(e) {
      e.preventDefault(); //서브밋 방지
      if (!confirm("저장하시겠습니까?"))
         return;

      var title = $(frm.title).val();
      var contents = $(frm.contents).val();

      alert(title + contents);

      if (title == "") {
         alert("제목을 입력하세요!");
         $(frm.title).focus();
      } else if (contents == "") {
         alert("내용을 입력하세요!");
         $(frm.contents).focus();
      } else {
         frm.submit();
      }

   });
</script>
</html>