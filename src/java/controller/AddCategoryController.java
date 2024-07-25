/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;


/**
 *
 * @author Admin
 */
@WebServlet(name = "AddCategoryController", urlPatterns = {"/addcategory"})
public class AddCategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            if (name != null && !name.trim().isEmpty()) { // Kiểm tra xem tên danh mục có hợp lệ không
                CategoryDBContext cdb = new CategoryDBContext();
                cdb.insertCategory(name);
                response.sendRedirect("managerCategory"); // Chuyển hướng đến trang quản lý danh mục sau khi thêm thành công
            } else {
                out.println("Invalid category name"); // In ra thông báo lỗi nếu tên danh mục không hợp lệ
            }
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
