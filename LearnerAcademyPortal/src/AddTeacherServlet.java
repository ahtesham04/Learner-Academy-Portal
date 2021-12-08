



import dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddTeacherServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session=request.getSession();
        
        String firstname=request.getParameter("fname");
        String lastname=request.getParameter("lname");
        String email = request.getParameter("email");
        long mobile=Long.parseLong(request.getParameter("mobile"));
        String gender = request.getParameter("gender");
        String city=request.getParameter("city");
        String address=request.getParameter("address");
        
        try{
            Connection con=DBConnection.dbCon();
            PreparedStatement ps=con.prepareStatement("insert into teachermaster(firstname,lastname,email,gender,city,mobile,address) values(?,?,?,?,?,?,?)");
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, email);
            ps.setString(4, gender);
            ps.setString(5, city);
            ps.setLong(6, mobile);
            ps.setString(7, address);
            int rs=ps.executeUpdate();
            
            if(rs>0){
                session.setAttribute("msg1","Teacher added successfully !!!");
                response.sendRedirect("teachermaster.jsp");
            }
            else{
                session.setAttribute("msg1","Failed to add the Teacher !!!");
                response.sendRedirect("teachermaster.jsp");
            }
        }catch(Exception e){
            System.out.println("Error :"+e);
        
        }
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
