
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;


public class AddClassSubjectServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int cid=Integer.parseInt(request.getParameter("classname"));
        int sid=Integer.parseInt(request.getParameter("subjectname"));
         try{
            Connection con=DBConnection.dbCon();
            PreparedStatement ps=con.prepareStatement("insert into class_subject_master (cid,sub_id) values(?,?)");
            ps.setInt(1, cid);
            ps.setInt(2, sid);
            int rs=ps.executeUpdate();
            HttpSession session=request.getSession();
            if(rs>0){
                session.setAttribute("msg1","Subject assigned to a class successfully !!!");
                response.sendRedirect("class_subject.jsp");
            }
            else{
                session.setAttribute("msg1","Failed to assign the subject !!!");
                response.sendRedirect("class_subject.jsp");
            }
        }catch(Exception e){}
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
