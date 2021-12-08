



import dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EditSubjectServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int subjectid=Integer.parseInt(request.getParameter("subid"));
        String subjectname=request.getParameter("subname");
          try{
            Connection con=DBConnection.dbCon();
            PreparedStatement ps=con.prepareStatement("update subjectmaster set sname=? where sub_id=?");
            ps.setString(1,subjectname);
            ps.setInt(2, subjectid);
            int rs=ps.executeUpdate();
            HttpSession session=request.getSession();
            if(rs>0){
                session.setAttribute("msg1","Subject updated successfully !!!");
                response.sendRedirect("subjectmaster.jsp");
            }
            else{
                session.setAttribute("msg1","Failed to update the subject !!!");
                response.sendRedirect("subjectmaster.jsp");
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
