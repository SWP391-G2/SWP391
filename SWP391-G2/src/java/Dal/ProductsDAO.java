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
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11)));
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
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11)));
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
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11));
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
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11));
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
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11));

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
                sql += " (ProductName LIKE '?')";
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
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getString(11));
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
                sql += " (ProductName LIKE '?')";
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
                if (totalPage % pageSize != 0) {
                    totalPage++;
                }
                return totalPage;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        ProductsDAO  dao = new ProductsDAO();
        System.out.println( dao.getTotalPage(-1, -1, "", 1, 3));
        System.out.println(dao.getListProductByFilter(-1, -1, "", 1, 1, 3).size());
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
