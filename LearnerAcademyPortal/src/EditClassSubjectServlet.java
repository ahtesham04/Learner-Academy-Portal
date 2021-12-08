



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


public class EditClassSubjectServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int cls_sub_id=Integer.parseInt(request.getParameter("cls_sub_id"));
        int cid=Integer.parseInt(request.getParameter("classname"));
        int sid=Integer.parseInt(request.getParameter("subjectname"));
        System.out.println(cls_sub_id+" "+cid+" "+sid);
        try{
            Connection con=DBConnection.dbCon();
            PreparedStatement ps=con.prepareStatement("update class_subject_master set cid=?,sub_id=? where cls_sub_id=?");
            ps.setInt(1, cid);
            ps.setInt(2, sid);
            ps.setInt(3, cls_sub_id);
            int rs=ps.executeUpdate();
            HttpSession session=request.getSession();
            if(rs>0){
                session.setAttribute("msg1","Subject assigned to a class updated successfully !!!");
                response.sendRedirect("class_subject.jsp");
            }
            else{
                session.setAttribute("msg1","Failed to update the assigned subject to a class !!!");
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
