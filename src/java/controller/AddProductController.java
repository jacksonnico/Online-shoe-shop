package controller;

import dal.ProductDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Product;

@WebServlet(name = "AddProductController", urlPatterns = {"/add"})
public class AddProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Lấy thông tin sản phẩm từ request
        String name = request.getParameter("name");
        String imageUrl = request.getParameter("image");
        String priceStr = request.getParameter("price");
        String title = request.getParameter("title");
        String categoryStr = request.getParameter("category");
        String description = request.getParameter("description");
        
        // Kiểm tra giá trị null
        if (name == null || imageUrl == null || priceStr == null || title == null || categoryStr == null || description == null) {
            // Xử lý trường hợp các tham số không tồn tại
            // Thông báo lỗi hoặc thực hiện xử lý khác theo yêu cầu
            return;
        }
        
        // Chuyển đổi giá trị price và category thành kiểu dữ liệu tương ứng
        double price = Double.parseDouble(priceStr);
        int categoryId = Integer.parseInt(categoryStr);
        
        // Tạo sản phẩm mới
        Product product = new Product();
        product.setName(name);
        product.setImageUrl(imageUrl);
        product.setPrice(price);
        product.setTiltle(title);
        product.setCategoryId(categoryId);
        product.setDescription(description);
        
        // Lấy thông tin người dùng từ session
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int sellId = account.getUid();
        product.setSell_ID(sellId);
        
        // Thêm sản phẩm vào cơ sở dữ liệu
        ProductDBContext pdb = new ProductDBContext();
        pdb.inSertProduct(product);
        
        // Chuyển hướng đến trang "manager"
        response.sendRedirect("manager");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
