<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/common.jsp"  %>
<body>
<div class="container">
	<c:out value="${member.name}"/>さん　こんにちは！<br>
	<a href="${pageContext.request.contextPath}/logout/sessionInvalidate">ログアウト</a>
	<h3>書籍在庫数変更画面</h3>
	<div class="span8">
		<div class="row">
			<form:errors path="bookForm.*" />
			<table class="table table-striped">
			  <tr>
			    <th>
			      書籍名
			    </th>
			    <td>
			      ${book.name}
			    </td>
			  </tr>
			  <tr>
			    <th>
			      著者
			    </th>
			    <td>
			      ${book.author}
			    </td>
			  </tr>
			  <tr>
			    <th>
			      出版社
			    </th>
			    <td>
			      ${book.publisher}
			    </td>
			  </tr>
			  <tr>
			    <th>
			      価格
			    </th>
			    <td>
			      <fmt:formatNumber pattern="##,###" value="${book.price}"/>円
			    </td>
			  </tr>
			  <tr>
			    <th>
			      ISBNコード
			    </th>
			    <td>
			      ${book.isbncode}
			    </td>
			  </tr>
			  <tr>
			    <th>
			      発売日
			    </th>
			    <td>
			      <fmt:formatDate value="${book.saledate}" pattern="yyyy年MM月dd日"/>
			    </td>
			  </tr>
			  <tr>
			    <th>
			      説明
			    </th>
			    <td>
			      ${book.explanation}
			    </td>
			  </tr>
			  <tr>
			    <th>
			      画像
			    </th>
			    <td>
			      <img src="img/<c:out value="${book.image}"/>"/>
			    </td>
			  </tr>
			  <tr>
			    <th>
			      在庫数
			    </th>
			    <td>
			    	<form:errors path="bookForm.*"/>
					<form action="/book/update" method="post">
						<input type="text" name="stock"  value="<c:out value="${book.stock}"/>">
						<input type="hidden" name="id" value="<c:out value="${book.id}"/>">
						<input class="btn" type="submit" value="更新">
					</form>
			    </td>
			  </tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>
