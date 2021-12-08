



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


public class AddSubTecherServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int cid=Integer.parseInt(request.getParameter("classname"));
        int sid=Integer.parseInt(request.getParameter("subjectname"));
        int tid=Integer.parseInt(request.getParameter("teachername"));
         try{
            Connection con=DBConnection.dbCon();
            PreparedStatement ps=con.prepareStatement("insert into class_sub_teacher_master (cid,sub_id,tid) values(?,?,?)");
            ps.setInt(1, cid);
            ps.setInt(2, sid);
            ps.setInt(3, tid);
            int rs=ps.executeUpdate();
            HttpSession session=request.getSession();
            if(rs>0){
                session.setAttribute("msg1","Teacher assigned to a class subject successfully !!!");
                response.sendRedirect("subject_teacher.jsp");
            }
            else{
                session.setAttribute("msg1","Failed to assign the teacher !!!");
                response.sendRedirect("subject_teacher.jsp");
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
