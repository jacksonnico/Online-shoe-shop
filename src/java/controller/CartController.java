/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CartController", urlPatterns = {"/carts"})
public class CartController extends BaseRequiredAuthenController {

    protected void processRequests(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }
        
        // Calculate total money and ensure quantity is not negative
        double totalMoney = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productId = entry.getKey();
            Cart cart = entry.getValue();
            
            // Ensure quantity is not negative
            int quantity = Math.max(0, cart.getQuantity());
            cart.setQuantity(quantity);
            
            totalMoney += quantity * cart.getProduct().getPrice();
        }
        
        request.setAttribute("totalMoney", totalMoney);
        request.setAttribute("carts", carts);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequests(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequests(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}