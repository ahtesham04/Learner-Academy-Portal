



import dao.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddStudentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException{
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        
        String firstname=request.getParameter("fname");
        String lastname=request.getParameter("lname");
        String fatname=request.getParameter("fatname");
        String motname=request.getParameter("motname");
        String dob=request.getParameter("dob");
        String gender = request.getParameter("gender");
        long mobile=Long.parseLong(request.getParameter("mobile"));
        String email = request.getParameter("email");
        String address=request.getParameter("address");
        int cid=Integer.parseInt(request.getParameter("classnm"));
        try{
            Connection con=DBConnection.dbCon();
            PreparedStatement ps=con.prepareStatement("insert into studentmaster(firstname,lastname,dob,gender,mobile,email,address,father_name,mother_name,cid) values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, dob);
            ps.setString(4, gender);
            ps.setLong(5, mobile);
            ps.setString(6, email);
            ps.setString(7, address);
            ps.setString(8, fatname);
            ps.setString(9, motname);
            ps.setInt(10,cid);
            int rs=ps.executeUpdate();
            
            if(rs>0){
                session.setAttribute("msg1","Student added successfully !!!");
                response.sendRedirect("studentmaster.jsp");
            }
            else{
                session.setAttribute("msg1","Failed to add the student !!!");
                response.sendRedirect("studentmaster.jsp");
            }
        }catch(Exception e){
            System.out.println("Error :"+e);
        
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddStudentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddStudentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
