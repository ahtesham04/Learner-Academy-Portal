


 
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AdminLoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session=request.getSession();
        
        String username=request.getParameter("uname");
        String password=request.getParameter("pass");
        RequestDispatcher disp;
        if(username.equals("admin") && password.equals("pass123")){
            session.setAttribute("username", username);
            disp=request.getRequestDispatcher("index.jsp");
            disp.forward(request, response);
        }
        else{
            session.setAttribute("errmsg", "Error: Invalid login details....!");
            disp=request.getRequestDispatcher("login.jsp");
            disp.forward(request, response);
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
