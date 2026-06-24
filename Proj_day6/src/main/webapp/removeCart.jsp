<%@ page contentType="text/html; charset=UTF-8" 
	import="java.util.ArrayList, dto.Book, dao.BookRepository"%>
<%
	String id=request.getParameter("id");
	if (id==null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}
	
	BookRepository dao=BookRepository.getInstance();
	
	Book book=dao.getBookById(id);
	if (book==null) {
		response.sendRedirect("exceptionNoBookId.jsp");
	}
	
	ArrayList<Book> cartList=(ArrayList<Book>) session.getAttribute("cartlist");
	Book goodsQnt=new Book();
	for (int i=0; i < cartList.size(); i++) {
		goodsQnt=cartList.get(i);
		if (goodsQnt.getBookId().equals(id)) {
			cartList.remove(goodsQnt);
		}
		
		response.sendRedirect("cart.jsp");
	}
%>