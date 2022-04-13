import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculateServlet", value = "/calculate")
public class CalculateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        float first_number = Float.parseFloat(request.getParameter("first_operand"));
        float last_number = Float.parseFloat(request.getParameter("last_operand"));
        String operator = request.getParameter("operator");

        String result = "Không thể chia cho 0";
        try {
            result = String.valueOf(Calculator.calculate(first_number,last_number,operator));
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("result", result);
        request.setAttribute("first_number", first_number);
        request.setAttribute("last_number", last_number);
        request.setAttribute("operator", operator);
        request.getRequestDispatcher("/calculate.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
