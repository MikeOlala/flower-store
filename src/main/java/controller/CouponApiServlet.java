package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * API Servlet để validate và áp dụng mã giảm giá
 */
@WebServlet("/api/coupon/*")
public class CouponApiServlet extends HttpServlet {
    
    private Gson gson;
    
    // Danh sách mã giảm giá mẫu (trong thực tế sẽ lấy từ database)
    private static final String[][] SAMPLE_COUPONS = {
        // code, type (percent/fixed), value, minOrder, maxDiscount
        {"WELCOME10", "percent", "10", "200000", "100000"},
        {"FREESHIP", "fixed", "30000", "300000", "30000"},
        {"SALE50K", "fixed", "50000", "500000", "50000"},
        {"SUMMER20", "percent", "20", "400000", "150000"},
        {"VIP30", "percent", "30", "1000000", "500000"}
    };
    
    @Override
    public void init() throws ServletException {
        gson = new Gson();
    }
    
    /**
     * POST - Validate mã giảm giá
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        JsonObject jsonResponse = new JsonObject();
        
        String pathInfo = request.getPathInfo();
        
        if (pathInfo != null && pathInfo.equals("/validate")) {
            validateCoupon(request, jsonResponse);
        } else {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Invalid endpoint");
        }
        
        out.print(gson.toJson(jsonResponse));
    }
    
    /**
     * Validate mã giảm giá
     */
    private void validateCoupon(HttpServletRequest request, JsonObject jsonResponse) {
        try {
            String code = request.getParameter("code");
            String subtotalStr = request.getParameter("subtotal");
            
            if (code == null || code.trim().isEmpty()) {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Vui lòng nhập mã giảm giá");
                return;
            }
            
            BigDecimal subtotal = BigDecimal.ZERO;
            if (subtotalStr != null && !subtotalStr.isEmpty()) {
                try {
                    subtotal = new BigDecimal(subtotalStr);
                } catch (NumberFormatException e) {
                    // Ignore
                }
            }
            
            code = code.trim().toUpperCase();
            
            // Tìm mã giảm giá
            String[] coupon = null;
            for (String[] c : SAMPLE_COUPONS) {
                if (c[0].equals(code)) {
                    coupon = c;
                    break;
                }
            }
            
            if (coupon == null) {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Mã giảm giá không tồn tại");
                return;
            }
            
            // Kiểm tra giá trị đơn hàng tối thiểu
            BigDecimal minOrder = new BigDecimal(coupon[3]);
            if (subtotal.compareTo(minOrder) < 0) {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("message", "Đơn hàng tối thiểu " + formatCurrency(minOrder) + " để sử dụng mã này");
                return;
            }
            
            // Tính toán giảm giá
            BigDecimal discountAmount;
            BigDecimal maxDiscount = new BigDecimal(coupon[4]);
            
            if ("percent".equals(coupon[1])) {
                BigDecimal percent = new BigDecimal(coupon[2]);
                discountAmount = subtotal.multiply(percent).divide(new BigDecimal(100));
                if (discountAmount.compareTo(maxDiscount) > 0) {
                    discountAmount = maxDiscount;
                }
            } else {
                discountAmount = new BigDecimal(coupon[2]);
            }
            
            // Trả về kết quả
            JsonObject couponInfo = new JsonObject();
            couponInfo.addProperty("code", coupon[0]);
            couponInfo.addProperty("type", coupon[1]);
            couponInfo.addProperty("value", coupon[2]);
            
            jsonResponse.addProperty("success", true);
            jsonResponse.addProperty("message", "Áp dụng mã giảm giá thành công");
            jsonResponse.add("coupon", couponInfo);
            jsonResponse.addProperty("discountAmount", discountAmount.toString());
            
        } catch (Exception e) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Có lỗi xảy ra: " + e.getMessage());
        }
    }
    
    /**
     * Format tiền tệ
     */
    private String formatCurrency(BigDecimal amount) {
        return String.format("%,.0f₫", amount);
    }
}
