package _13_TRDT;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/_13_TRDT/Delete.do")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws IOException, ServletException {
    	
    	String supplierId = request.getParameter("supplierId");
    	boolean success = new TRDTDAO().delete(supplierId);
    	System.out.println("刪除成份資料: "+supplierId);
    	
    	request.setAttribute("supplierId", supplierId);
    	
    	if(success == true){
    		RequestDispatcher rd = request.getRequestDispatcher("DeleteSuccess.jsp");
    		rd.forward(request, response);
    	}else{
    		RequestDispatcher rd = request.getRequestDispatcher("DeleteError.jsp");
    		rd.forward(request, response);		
    	}
    }
    	
}   