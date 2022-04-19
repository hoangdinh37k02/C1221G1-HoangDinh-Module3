package controller;

import model.User;
import service.IUserService;
import service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserControllerServlet", value = {"/user", "/"})
public class UserControllerServlet extends HttpServlet {
    private IUserService iUserService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewUser(request,response);
                break;
            case "search":
                searchByName(request,response);
                break;
            case "edit":
                updateUser(request,response);
                break;
            case "delete":
                request.getRequestDispatcher("list.jsp").forward(request,response);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("create.jsp").forward(request,response);
                break;
            case "search":
                request.getRequestDispatcher("list.jsp").forward(request,response);
                break;
            case "edit":
                showEditForm(request,response);
            case "delete":
                delete(request,response);
                break;
            default:
                List<User> userList = iUserService.getList();
                request.setAttribute("userList", userList);
                request.getRequestDispatcher("list.jsp").forward(request,response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Integer id = Integer.parseInt(request.getParameter("id"));
    iUserService.deleteUser(id);
    response.sendRedirect("/user");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id,name,email,country);
        iUserService.updateUser(user);
        request.getRequestDispatcher("edit.jsp").forward(request,response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        User user = iUserService.selectUser(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("edit.jsp").forward(request,response);
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name").toLowerCase();
        List<User> userList = iUserService.getList();
        List<User> searchList = new ArrayList<>();

        for (User user:userList) {
            if ((user.getName().toLowerCase()).contains(name)){
                searchList.add(user);
            }
        }
        request.setAttribute("list",searchList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        iUserService.save(user);
        request.getRequestDispatcher("create.jsp").forward(request,response);

    }
}
