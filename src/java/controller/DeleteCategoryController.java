package controller;

import dal.CategoryDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteCategoryController", urlPatterns = {"/deleteCategory"})
public class DeleteCategoryController extends HttpServlet {

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    String cid = request.getParameter("cid");
    if (cid != null && !cid.trim().isEmpty()) {
        try {
            int categoryId = Integer.parseInt(cid);
            CategoryDBContext cdb = new CategoryDBContext();
            cdb.deleteCategory(categoryId);
            response.sendRedirect("managerCategory");
        } catch (NumberFormatException ex) {
            // Xử lý khi không thể chuyển đổi cid thành số nguyên
            response.sendRedirect("error.jsp"); // Chuyển hướng đến trang lỗi
        }
    } else {
        response.sendRedirect("error.jsp"); // Chuyển hướng đến trang lỗi nếu cid không hợp lệ
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
