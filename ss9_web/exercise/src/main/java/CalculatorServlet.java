import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("Product Name");
        double productPrice = Double.parseDouble(request.getParameter("List Price"));
        double discount = Double.parseDouble(request.getParameter("Discount Percent"));

        double discountAmount = productPrice*discount*0.01;

        request.setAttribute("discount", discountAmount);
        request.getRequestDispatcher("result.jsp").forward(request, response);
//        PrintWriter writer = response.getWriter();
//        writer.println("<html>");
//        writer.println("<h1>Product Name: " + productName + "</h1>");
//        writer.println("<br>");
//        writer.println("<h1>Discount Amount: " + discountAmount + "</h1>");
//        writer.println("</html>");
    }
}
