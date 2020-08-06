package sell_status;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import database.SqlVO;


@WebServlet(value= {"/Sell_Status/list"})
public class Sell_StatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html;charset=UTF-8"); 
        PrintWriter out=response.getWriter();
        Sell_StatusDAO dao=new Sell_StatusDAO();
    switch(request.getServletPath()) {
 case "/Sell_Status/list": 
      SqlVO sqlVO=new SqlVO(); 
      String key=request.getParameter("key")==null?"product_code":request.getParameter("key"); 
      String word=request.getParameter("word")==null?"":request.getParameter("word"); 
      String order=request.getParameter("order")==null?"product_code":request.getParameter("order"); 
      String desc=request.getParameter("key")==null?"":request.getParameter("desc"); 
      String page=request.getParameter("page")==null?"1":request.getParameter("page"); 
      String perPage=request.getParameter("perPage")==null?"5":request.getParameter("perPage");
      sqlVO.setKey(key); 
      sqlVO.setWord(word); 
      sqlVO.setOrder(order); 
      sqlVO.setDesc(desc); 
      sqlVO.setPage(Integer.parseInt(page)); 
      sqlVO.setPerPage(Integer.parseInt(perPage)); 
      out.println(dao.slist(sqlVO)); 
      break; 
    } 
} 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
