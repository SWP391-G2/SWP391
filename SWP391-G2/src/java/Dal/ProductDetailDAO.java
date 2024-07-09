/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.Brands;
<<<<<<< HEAD
import Models.ImageDetail;
import Models.ProductDetail;
import java.math.BigDecimal;
=======
import Models.Products;
import Models.ProductDetail;
import java.sql.Date;
>>>>>>> main
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author admin
 */
public class ProductDetailDAO extends DBContext {

    public List<ProductDetail> getPriceAllowSize(int id) {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "select * from Products p join ProductFullDetail pfd \n"
                + " on p.ProductID = pfd.ProductFullDetailID \n"
                + " where pfd.pdProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new ProductDetail(
<<<<<<< HEAD
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"), 
                        rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductSize"),
                        rs.getBigDecimal("ProductPrice"),
                        rs.getInt("ProductAvaiable")));
=======
                        rs.getInt(8),
                        rs.getInt(9), 
                        rs.getString(10),
                        rs.getDate(11),
                        rs.getBoolean(12), 
                        rs.getString(13),
                        rs.getFloat(14),
                        rs.getInt(15),
                        rs.getString(16)));
>>>>>>> main
            }

        } catch (SQLException e) {

        }
        return list;
    }

<<<<<<< HEAD
    public List<ProductDetail> getProductDetailsByProductId(int productId) {
        List<ProductDetail> productDetails = new ArrayList<>();
        String sql = "SELECT * FROM ProductFullDetail WHERE pdProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productDetails.add(new ProductDetail(
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"), 
                        rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductSize"),
                        rs.getBigDecimal("ProductPrice"),
                        rs.getInt("ProductAvaiable")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productDetails;

    }

    //Get Price by Size
    public BigDecimal getProductPriceBySize(int productId, String size) {
        String sql = "SELECT pfd.ProductPrice "
                + "FROM dbo.ProductFullDetail pfd "
                + "JOIN dbo.Products p ON p.ProductID = pfd.pdProductID "
                + "WHERE p.ProductID = ? AND pfd.ProductSize = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ps.setString(2, size);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getBigDecimal("ProductPrice");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public List<ImageDetail> getListImageDetail(int id) {
        List<ImageDetail> list = new ArrayList<>();
        String sql = "select * from  ProductDetailImages where ProductFullDetailID = ?";
        try {
=======
    public List<ProductDetail> getPriceProductSimilar(int id){
        List<ProductDetail> list = new ArrayList<>();
        String sql ="select * from ProductFullDetail where pdProductID = ?";
         try {
>>>>>>> main
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add( new ProductDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getFloat(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
       
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ProductDetail getProductDetail(int id) {
        String sql = "select * from ProductFullDetail where ProductFullDetailID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new ProductDetail(
<<<<<<< HEAD
                        rs.getInt("ProductFullDetailID"),
                        rs.getInt("pdProductID"), rs.getString("ProductDescription"),
                        rs.getDate("ProductCreateDate"),
                        rs.getBoolean("ProductStatus"),
                        rs.getString("ProductSize"),
                        rs.getBigDecimal("ProductPrice"),
                        rs.getInt("ProductAvaiable"));
=======
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getString(3),
                    rs.getDate(4),
                    rs.getBoolean(5),
                    rs.getString(6),
                    rs.getFloat(7),
                    rs.getInt(8),
                    rs.getString(9)
                );

>>>>>>> main
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

<<<<<<< HEAD
    public static void main(String[] args) {
        ProductDetailDAO p = new ProductDetailDAO();
        List<ProductDetail> list = p.getPriceAllowSize(2);
        for (ProductDetail product : list) {
            System.out.println(product.getProductPrice());
=======
    public int getTotalPage(int proId, int status, String size, int pageSize) {
        String sql = "select * from ProductFullDetail";
        boolean whereAdded = false;
        if (proId != -1 || status != -1 || !size.isEmpty()) {
            sql += " WHERE";
            if (proId != -1) {

                sql += " pdProductID = ?";
                whereAdded = true;
            }
            if (status != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " ProductStatus = ?";
                whereAdded = true;
            }

            if (!size.isEmpty()) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " (ProductSize LIKE ?)";
            }
        }
        System.out.println(sql);
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            int parameterIndex = 1;
            if (proId != -1) {
                st.setInt(parameterIndex, proId);
                parameterIndex++;
            }
            if (status != -1) {
                st.setInt(parameterIndex, status);
                parameterIndex++;
            }
            if (!size.isEmpty()) {
                st.setString(parameterIndex, size);

            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int totalRecord = rs.getInt(1);
                int totalPage = totalRecord / pageSize;
                if (totalRecord % pageSize != 0) {
                    totalPage++;
                }
                return totalPage;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 1;
    }

    public int getProductDetailID(int pdID, String size) {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "select * from ProductFullDetail where pdProductID = ? and ProductSize like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pdID);
            st.setString(2, size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductDetail p = new ProductDetail(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getString(3),
                    rs.getDate(4),
                    rs.getBoolean(5),
                    rs.getString(6),
                    rs.getFloat(7),
                    rs.getInt(8),
                    rs.getString(9));
                return p.getProductFullDetailID();
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return 0;
    }

    public List<String> getSize(int id) {
        String sql = "select ProductSize from ProductFullDetail where pdProductID = ?";
        List<String> listSize = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listSize.add(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listSize;
    }

    public ArrayList<ProductDetail> getListProductByFilter(int proId, int status, String size, int pageNo, int pageSize) {
        ArrayList<ProductDetail> listProduct = new ArrayList<>();
        ProductDetail productDetail = new ProductDetail();
        String sql = "select * from ProductFullDetail";
        boolean whereAdded = false;
        if (proId != -1 || status != -1 || !size.isEmpty()) {
            sql += " WHERE";
            if (proId != -1) {
                sql += " pdProductID = ?";
                whereAdded = true;
            }
            if (status != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " ProductStatus = ?";
                whereAdded = true;
            }

            if (!size.isEmpty()) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " (ProductSize LIKE ?)";
            }
        }
        sql += " ORDER BY ProductFullDetailID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int parameterIndex = 1;
            if (proId != -1) {
                st.setInt(parameterIndex, proId);
                parameterIndex++;
            }
            if (status != -1) {
                st.setInt(parameterIndex, status);
                parameterIndex++;
            }
            if (!size.isEmpty()) {
                st.setString(parameterIndex, size);
                parameterIndex++;

            }
            //set the limit and offset parameters for pagination
            st.setInt(parameterIndex, (pageNo - 1) * pageSize);
            parameterIndex++;
            st.setInt(parameterIndex, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                productDetail = new ProductDetail(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getString(3),
                    rs.getDate(4),
                    rs.getBoolean(5),
                    rs.getString(6),
                    rs.getFloat(7),
                    rs.getInt(8),
                    rs.getString(9)
                );
                listProduct.add(productDetail);
            }

        } catch (Exception e) {

        }
        return listProduct;
    }

    public int getLastProductDetailIdByProductId(int proId) {
        String sql = "select count(*) ProductFullDetailID from ProductFullDetail where pdProductID = ? Order by ProductFullDetailID DESC";

        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, proId);
            ResultSet rs = ur.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int getLastProductDetailId() {
        String sql = "select count(*) from ProductFullDetail";

        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ResultSet rs = ur.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public void updateStatus(int proId, int status) {
        String sql = "UPDATE [dbo].[ProductFullDetail]\n"
                + "   SET \n"
                + "[ProductStatus] = ?\n"
                + " WHERE ProductFullDetailID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, status);
            ur.setInt(2, proId);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        
    }

    public void insertNewProductDetail(ProductDetail detail) {
        String sql = "INSERT INTO [dbo].[ProductFullDetail]\n"
                + "           ([pdProductID]\n"
                + "           ,[ProductDescription]\n"
                + "           ,[ProductCreateDate]\n"
                + "           ,[ProductStatus]\n"
                + "           ,[ProductSize]\n"
                + "           ,[ProductPrice]\n"
                + "           ,[ProductAvaiable]\n"
                + "           ,[image])\n"
                + "            VALUES"
                + "           (?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, detail.getPdProductID());
            ur.setString(2, detail.getProductDescription());
            ur.setDate(3, (Date) detail.getProductCreateDate());
            ur.setBoolean(4, detail.getProductStatus());
            ur.setString(5, detail.getProductSize());
            ur.setFloat(6, detail.getProductPrice());
            ur.setInt(7, detail.getProductAvaiable());
            ur.setString(8, detail.getImage());

            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
>>>>>>> main
        }
        ProductDetailDAO productDetailDAO = new ProductDetailDAO();

        int productId = 1;
        String size = "30ml";
        BigDecimal productPrice = productDetailDAO.getProductPriceBySize(productId, size);

        if (productPrice != null) {
            System.out.println("Product Price for Product ID " + productId + " and Size " + size + ": " + productPrice);
        } else {
            System.out.println("Product not found for Product ID " + productId + " and Size " + size);
        }
    }

    public void updateProductDetail(ProductDetail detail) {
        String sql = "UPDATE [dbo].[ProductFullDetail]\n"
                + "     set [ProductDescription] = ?\n"
                + "      ,[ProductStatus] = ?\n"
                + "      ,[ProductSize] = ?\n"
                + "      ,[ProductPrice] = ?\n"
                + "      ,[ProductAvaiable] = ?\n"
                + "      ,[image] = ?\n"
                + " WHERE ProductFullDetailID = ?;";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, detail.getProductDescription());
            ur.setBoolean(2, detail.getProductStatus());
            ur.setString(3, detail.getProductSize());
            ur.setFloat(4, detail.getProductPrice());
            ur.setInt(5, detail.getProductAvaiable());
            ur.setString(6, detail.getImage());
            ur.setInt(7, detail.getProductFullDetailID());
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }


    public ProductDetail getInforProductDetail(int pdID) {

        String sql = "select * from ProductFullDetail where ProductFullDetailID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, pdID);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                ProductDetail p = new ProductDetail(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getString(3),
                    rs.getDate(4),
                    rs.getBoolean(5),
                    rs.getString(6),
                    rs.getFloat(7),
                    rs.getInt(8),
                    rs.getString(9));
                return p;
            }

        } catch (SQLException e) {

        }
        return null;
    }

    public void insetCart(int pdID, int accountID, int quantity, double totalPrice) {
        String sql = "insert into Cart(ProductFullDetailID, AccountID, Quantity, TotalPrice) \n"
                + "values (?,?,?,?);";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, pdID);
            ur.setInt(2, accountID);
            ur.setInt(3, quantity);
            ur.setDouble(4, totalPrice);

            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateMinusAvaiableProductDetail(int avaiable, int pdID) {
        String sql = "UPDATE ProductFullDetail set ProductAvaiable = ? -1 where ProductFullDetailID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, avaiable);
            ur.setInt(2, pdID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateAddAvaiableProductDetail(int avaiable, int pdID) {
        String sql = "UPDATE ProductFullDetail set ProductAvaiable = ? +1 where ProductFullDetailID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, avaiable);
            ur.setInt(2, pdID);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
