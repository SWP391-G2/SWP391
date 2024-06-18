/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

import context.DBContext;
import Models.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Models.Categories;
import Models.SubCategories;
import java.sql.Date;

/**
 *
 * @author ROG
 */
public class ProductsDAO extends DBContext {

    public List<Products> loadProducts() {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                pro.add(new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }

        } catch (SQLException e) {

        }
        return pro;
    }

    public List<Products> getPaging(int index) {
        List<Products> pro = new ArrayList<>();
        String sql = "select * from Products order by productID OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY;";
        //chay lenhj truy van
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 12);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                pro.add(new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }

        } catch (SQLException e) {

        }
        return pro;
    }

    public int getCount() {
        String sql = "Select count(*) from products";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);

            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    // List Products of Men
    public List<Products> getProductMen() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM Products ";
        return list;
    }

    // List Products of Women
    public List<Products> getProductWomen() {
        List<Products> list = new ArrayList<>();
        String sql = "";
        return list;
    }

    // List Products of Unisex
    public List<Products> getProductUnisex() {
        List<Products> list = new ArrayList<>();
        String sql = "";
        return list;
    }

    // List Products by Category
    public List<Products> getProductsByCategory(int categoryid) {
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM Products p "
                + " JOIN SubCategories sc ON p.SubCategoryID = sc.SubCategoryID "
                + " JOIN Categories c ON sc.CategoryID = c.CategoryID "
                + " WHERE c.CategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products product = new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8));
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    // List Products by SubCategory
    public List<Products> getProductBySubCategory(int subcategoryid) {
        List<Products> products = new ArrayList<>();
        String sql = "SELECT * FROM Products p"
                + "JOIN SubCategories sc ON p.SubCategoryID = sc.SubCategoryID"
                + "WHERE sc.SubCategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subcategoryid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products product = new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8));
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    //Get Product by ProductID
    public Products getProductByProductID(int id) {
        String sql = "select * from Products where ProductID=?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, id);
            ResultSet rs = ur.executeQuery();
            while (rs.next()) {
                Products product = new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8));

                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public ArrayList<Products> getListProductByFilter(int cateId, int status, String search, int brandId, int pageNo, int pageSize) {
        ArrayList<Products> listProduct = new ArrayList<>();
        Products product = new Products();
        String sql = "select * from Products";
        boolean whereAdded = false;
        if (cateId != -1 || status != -1 || brandId != -1 || !search.isEmpty()) {
            sql += " WHERE";
            if (cateId != -1) {
                sql += " fk_category_id = ?";
                whereAdded = true;
            }
            if (status != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " ProductStatus = ?";
                whereAdded = true;
            }
            if (brandId != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " BrandID = ?";
                whereAdded = true;
            }
            if (!search.isEmpty()) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " (ProductName LIKE ?)";
            }
        }

        sql += " ORDER BY ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int parameterIndex = 1;
            if (cateId != -1) {
                st.setInt(parameterIndex, cateId);
                parameterIndex++;
            }
            if (status != -1) {
                st.setInt(parameterIndex, status);
                parameterIndex++;
            }
            if (brandId != -1) {
                st.setInt(parameterIndex, brandId);
                parameterIndex++;
            }
            if (!search.isEmpty()) {
                st.setString(parameterIndex, "%" + search + "%");
                parameterIndex++;

            }
            //set the limit and offset parameters for pagination
            st.setInt(parameterIndex, (pageNo - 1) * pageSize);
            parameterIndex++;
            st.setInt(parameterIndex, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                product = new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8));
                listProduct.add(product);
            }

        } catch (Exception e) {

        }
        return listProduct;
    }

    public int getTotalPage(int cateId, int status, String search, int brandId, int pageSize) {
        String sql = "select count(*) from Products";
        boolean whereAdded = false;
        if (cateId != -1 || status != -1 || brandId != -1 || !search.isEmpty()) {
            sql += " WHERE";
            if (cateId != -1) {
                sql += " fk_category_id = ?";
                whereAdded = true;
            }
            if (status != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " ProductStatus = ?";
                whereAdded = true;
            }
            if (brandId != -1) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " BrandID = ?";
                whereAdded = true;
            }
            if (!search.isEmpty()) {
                if (whereAdded) {
                    sql += " AND";
                }
                sql += " (ProductName LIKE ?)";
            }
        }
        System.out.println(sql);
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            int parameterIndex = 1;
            if (cateId != -1) {
                st.setInt(parameterIndex, cateId);
                parameterIndex++;
            }
            if (status != -1) {
                st.setInt(parameterIndex, status);
                parameterIndex++;
            }
            if (brandId != -1) {
                st.setInt(parameterIndex, brandId);
                parameterIndex++;
            }
            if (!search.isEmpty()) {
                st.setString(parameterIndex, "%" + search + "%");

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
        return 0;
    }

    public int getLastProductId() {
        String sql = "select Top 1 ProductID from Products Order by ProductID DESC";

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

    public void insertNewProduct(Products product) {
        String sql = "INSERT INTO [dbo].[Products] (\n"
                + "    [ProductName],\n"
                + "    [ProductCreateDate],\n"
                + "    [ProductStatus],\n"
                + "    [BrandID],\n"
                + "    [ProductImageUrl],\n"
                + "    [fk_category_id])\n"
                + "VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, product.getProductName());
            ur.setDate(2, (Date) product.getProductCreateDate());
            ur.setInt(3, product.getProductStatus());
            ur.setInt(4, product.getBrandID());
            ur.setString(5, product.getProductImageUrl());
            ur.setInt(6, product.getFk_category_id());
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public void updateStatus(int proId, int status) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET \n"
                + "[ProductStatus] = ?\n"
                + " WHERE ProductID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setInt(1, status);
            ur.setInt(2, proId);
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public void updateProduct(Products product) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [ProductName] = ?\n"
                + "      ,[ProductStatus] = ?\n"
                + "      ,[ProductImageUrl] = ?\n"
                + "      ,[BrandID] = ?\n"
                + "      ,[fk_category_id] = ?\n"
                + "WHERE ProductID = ?";
        try {
            PreparedStatement ur = connection.prepareStatement(sql);
            ur.setString(1, product.getProductName());
            ur.setInt(2, product.getProductStatus());
            ur.setString(3, product.getProductImageUrl());
            ur.setInt(4, product.getBrandID());
            ur.setInt(5, product.getFk_category_id());
            ur.setInt(6, product.getProductID());
            ur.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        ProductsDAO dao = new ProductsDAO();
        Products product = new  Products(10, "d", 0, "1", 2, 1);
        dao.updateProduct(product);
//        Date date = new Date(System.currentTimeMillis());
//        Products product = new Products("test", date, 1, "1", 1, 1);
//        dao.insertNewProduct(product);
        System.out.println(dao.getTotalPage(1, -1, "", -1, 10));

        System.out.println(dao.getListProductByFilter(-1, -1, "men", -1, 1, 10).size());
        System.out.println(dao.getLastProductId());

    }

//    public static void main(String[] args) {
//        ProductsDAO Pdao = new ProductsDAO();
//        /*System.out.println(Pdao.loadProducts().size());
//        System.out.println(Pdao.getPaging(2).size());
//
//        System.out.println(Pdao.getCount());*/
//        Products p = Pdao.getProductByProductID(1);
//        System.out.println(p.getProductImageUrl());
//
//        System.out.println(Pdao.getCount());
//        int categoryId = 1; // example category ID
//        List<Products> products = Pdao.getProductsByCategory(categoryId);
//        products.forEach(product -> System.out.println("Product ID: " + product.getProductID()
//                + ", Name: " + product.getProductName()));
//    }
}
