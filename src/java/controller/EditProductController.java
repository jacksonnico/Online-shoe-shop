/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditProductController", urlPatterns = {"/edit"})
public class EditProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Product product = new Product();
        product.setId(Integer.parseInt(request.getParameter("id")));
        product.setName(request.getParameter("name"));
        product.setImageUrl(request.getParameter("image"));
        product.setPrice(Double.parseDouble(request.getParameter("price"))); // Corrected parameter name
        product.setTiltle(request.getParameter("title"));
        product.setDescription(request.getParameter("description"));
        product.setCategoryId(Integer.parseInt(request.getParameter("category")));
        
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        int cid = a.getUid();
        product.setSell_ID(cid);
        
        ProductDBContext pdb = new ProductDBContext();
        pdb.updateProduct(product);
        
            response.sendRedirect("manager"); 
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

