

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;


@WebServlet("/deleteteacher")
public class DeleteTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int teacherid=Integer.parseInt(request.getParameter("tid"));
        
          try{
            Connection con=DBConnection.dbCon();
            PreparedStatement ps=con.prepareStatement("delete from teachermaster where tid=?");
            ps.setInt(1, teacherid);
            int rs=ps.executeUpdate();
            HttpSession session=request.getSession();
            if(rs>0){
                session.setAttribute("msg1","Teacher deleted successfully !!!");
                response.sendRedirect("teachermaster.jsp");
            }
            else{
                session.setAttribute("msg1","Failed to delete the teacher !!!");
                response.sendRedirect("teachermaster.jsp");
            }
        }catch(Exception e){
        	}
        }
       
    
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 processRequest(request, response);
	}

}
