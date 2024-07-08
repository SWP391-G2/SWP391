/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;


import Models.ProductsHome;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ROG
 */
public class ProductsDAO extends DBContext {

    public List<ProductsHome> loadProducts() {
        List<ProductsHome> products = new ArrayList<>();
        String sql = "SELECT p.*, "
                + "MIN(pd.ProductPrice) AS priceMin, "
                + "MAX(pd.ProductPrice) AS priceMax "
                + "FROM Products p "
                + "LEFT JOIN ProductFullDetail pd ON p.ProductID = pd.pdProductID "
                + "GROUP BY p.ProductID, p.CategoryID, p.ProductName, p.ProductCreateDate, "
                + "p.ProductStatus, p.ProductImageUrl, p.BrandID, p.UpdateDescription";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsHome product = new ProductsHome(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("BrandID"),
                        rs.getBigDecimal("priceMin"),
                        rs.getBigDecimal("priceMax")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //Top best seller 
    public List<ProductsHome> getTopBestSellers(String number) {
        List<ProductsHome> products = new ArrayList<>();
        String sql = "SELECT TOP " + number + " p.ProductID, p.CategoryID, p.ProductName, p.ProductCreateDate, "
                + "p.ProductStatus, p.ProductImageUrl, p.BrandID, p.UpdateDescription, "
                + "MIN(pd.ProductPrice) AS priceMin, "
                + "MAX(pd.ProductPrice) AS priceMax "
                + "FROM Products p "
                + "JOIN ProductFullDetail pd ON p.ProductID = pd.pdProductID "
                + "WHERE p.CategoryID <> 4 "
                + "GROUP BY p.ProductID, p.CategoryID, p.ProductName, p.ProductCreateDate, "
                + "p.ProductStatus, p.ProductImageUrl, p.BrandID, p.UpdateDescription "
                + "ORDER BY NEWID()";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsHome product = new ProductsHome(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("BrandID"),
                        rs.getBigDecimal("priceMin"),
                        rs.getBigDecimal("priceMax")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // List Products by Category
    public List<ProductsHome> getProductsByCategory(int categoryid) {
        List<ProductsHome> products = new ArrayList<>();
        String sql = "SELECT p.*, "
                + "MIN(pd.ProductPrice) AS priceMin, "
                + "MAX(pd.ProductPrice) AS priceMax "
                + "FROM Products p "
                + "JOIN ProductFullDetail pd ON p.ProductID = pd.pdProductID "
                + "JOIN Categories c ON p.CategoryID = c.CategoryID "
                + "WHERE p.CategoryID = ? AND c.Status = 1 "
                + "GROUP BY p.ProductID, p.ProductName, p.ProductCreateDate, "
                + "p.ProductStatus, p.ProductImageUrl, p.BrandID, p.CategoryID, p.UpdateDescription";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsHome product = new ProductsHome(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("BrandID"),
                        rs.getBigDecimal("priceMin"),
                        rs.getBigDecimal("priceMax")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //List Products by Brand
    public List<ProductsHome> getProductsByBrand(int brandid) {
        List<ProductsHome> products = new ArrayList<>();
        String sql = "SELECT p.*, "
                + "MIN(pd.ProductPrice) AS priceMin, "
                + "MAX(pd.ProductPrice) AS priceMax "
                + "FROM Products p "
                + "JOIN ProductFullDetail pd ON p.ProductID = pd.pdProductID "
                + "JOIN Categories c ON p.CategoryID = c.CategoryID "
                + "WHERE p.BrandID = ? AND c.Status = 1 "
                + "GROUP BY p.ProductID, p.ProductName, p.ProductCreateDate, "
                + "p.ProductStatus, p.ProductImageUrl, p.BrandID, p.CategoryID, p.UpdateDescription";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, brandid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsHome product = new ProductsHome(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("BrandID"),
                        rs.getBigDecimal("priceMin"),
                        rs.getBigDecimal("priceMax")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //Search by check box BrandID
    public List<ProductsHome> searchByCheckboxBrand(int[] brandIds) {
        List<ProductsHome> products = new ArrayList<>();
        String sql = "SELECT p.*, "
                + "MIN(pd.ProductPrice) AS priceMin, "
                + "MAX(pd.ProductPrice) AS priceMax "
                + "FROM Products p "
                + "JOIN ProductFullDetail pd ON p.ProductID = pd.pdProductID "
                + "WHERE 1=1 ";
        if (brandIds != null && brandIds.length > 0) {
            sql += "AND p.BrandID IN (";
            for (int i = 0; i < brandIds.length; i++) {
                sql += brandIds[i];
                if (i < brandIds.length - 1) {
                    sql += ",";
                }
            }
            sql += ") ";
        }
        sql += "GROUP BY p.ProductID, p.CategoryID, p.ProductName, p.ProductCreateDate, "
                + "p.ProductStatus, p.ProductImageUrl, p.BrandID, p.UpdateDescription";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsHome product = new ProductsHome(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("BrandID"),
                        rs.getBigDecimal("priceMin"),
                        rs.getBigDecimal("priceMax")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //Search by check box CategoryID
    public List<ProductsHome> searchByCheckbox(int[] categoryIds) {
        List<ProductsHome> products = new ArrayList<>();
        String sql = "SELECT p.*, "
                + "MIN(pd.ProductPrice) AS priceMin, "
                + "MAX(pd.ProductPrice) AS priceMax "
                + "FROM Products p "
                + "JOIN ProductFullDetail pd ON p.ProductID = pd.pdProductID "
                + "WHERE 1=1 ";
        if (categoryIds != null && categoryIds.length > 0) {
            sql += "AND p.CategoryID IN (";
            for (int i = 0; i < categoryIds.length; i++) {
                sql += categoryIds[i];
                if (i < categoryIds.length - 1) {
                    sql += ",";
                }
            }
            sql += ") ";
        }
        sql += "GROUP BY p.ProductID, p.CategoryID, p.ProductName, p.ProductCreateDate, "
                + "p.ProductStatus, p.ProductImageUrl, p.BrandID, p.UpdateDescription";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsHome product = new ProductsHome(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("BrandID"),
                        rs.getBigDecimal("priceMin"),
                        rs.getBigDecimal("priceMax")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //Get products by category and brand
    public List<ProductsHome> getProductsByCategoriesAndBrands(int[] categoryIds, int[] brandIds) {
        List<ProductsHome> products = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT p.*, "
                + "MIN(pd.ProductPrice) AS priceMin, "
                + "MAX(pd.ProductPrice) AS priceMax "
                + "FROM Products p "
                + "JOIN ProductFullDetail pd ON p.ProductID = pd.pdProductID "
                + "WHERE 1=1 ");

        if (categoryIds != null && categoryIds.length > 0) {
            sql.append("AND p.CategoryID IN (");
            for (int i = 0; i < categoryIds.length; i++) {
                sql.append(categoryIds[i]);
                if (i < categoryIds.length - 1) {
                    sql.append(",");
                }
            }
            sql.append(") ");
        }

        if (brandIds != null && brandIds.length > 0) {
            sql.append("AND p.BrandID IN (");
            for (int i = 0; i < brandIds.length; i++) {
                sql.append(brandIds[i]);
                if (i < brandIds.length - 1) {
                    sql.append(",");
                }
            }
            sql.append(") ");
        }

        sql.append("GROUP BY p.ProductID, p.CategoryID, p.ProductName, p.ProductCreateDate, "
                + "p.ProductStatus, p.ProductImageUrl, p.BrandID, p.UpdateDescription");

        try {
            PreparedStatement ps = connection.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsHome product = new ProductsHome(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("BrandID"),
                        rs.getBigDecimal("priceMin"),
                        rs.getBigDecimal("priceMax")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    //Search by name ajax in refine
    public List<ProductsHome> searchByName(String text) {
        List<ProductsHome> products = new ArrayList<>();
        String sql = "SELECT p.*, "
                + "MIN(pd.ProductPrice) AS priceMin, "
                + "MAX(pd.ProductPrice) AS priceMax "
                + "FROM Products p "
                + "JOIN ProductFullDetail pd ON p.ProductID = pd.pdProductID "
                + "WHERE p.ProductName LIKE ? "
                + "GROUP BY p.ProductID, p.CategoryID, p.ProductName, p.ProductCreateDate, "
                + "p.ProductStatus, p.ProductImageUrl, p.BrandID, p.UpdateDescription";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + text + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsHome product = new ProductsHome(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("BrandID"),
                        rs.getBigDecimal("priceMin"),
                        rs.getBigDecimal("priceMax")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Get list product by page
    public List<ProductsHome> getListByPage(List<ProductsHome> list, int start, int end) {
        ArrayList<ProductsHome> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<ProductsHome> getProductsByPriceRange(int minPrice, int maxPrice) {
        List<ProductsHome> products = new ArrayList<>();
        String sql = "SELECT p.*, "
                + "origPrices.priceMin AS priceMin, "
                + "origPrices.priceMax AS priceMax "
                + "FROM Products p "
                + "JOIN ProductFullDetail pd ON p.ProductID = pd.pdProductID "
                + "JOIN (SELECT pdProductID, "
                + "             MIN(ProductPrice) AS priceMin, "
                + "             MAX(ProductPrice) AS priceMax "
                + "      FROM ProductFullDetail "
                + "      GROUP BY pdProductID) origPrices "
                + "ON p.ProductID = origPrices.pdProductID "
                + "WHERE pd.ProductPrice BETWEEN ? AND ? "
                + "GROUP BY p.ProductID, p.CategoryID, p.ProductName, p.ProductCreateDate, "
                + "         p.ProductStatus, p.ProductImageUrl, p.BrandID, p.UpdateDescription, "
                + "         origPrices.priceMin, origPrices.priceMax";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, minPrice);
            ps.setInt(2, maxPrice);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductsHome product = new ProductsHome(
                        rs.getInt("ProductID"),
                        rs.getInt("CategoryID"),
                        rs.getString("ProductName"),
                        rs.getDate("ProductCreateDate"),
                        rs.getInt("ProductStatus"),
                        rs.getString("ProductImageUrl"),
                        rs.getInt("BrandID"),
                        rs.getBigDecimal("priceMin"),
                        rs.getBigDecimal("priceMax")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public static void main(String[] args) {
        ProductsDAO productsDAO = new ProductsDAO();

        // Fetch top best sellers
//        List<Products> topBestSellers = productsDAO.getTopBestSellers("5");
//
//        // Print the products
//        for (Products product : topBestSellers) {
//            System.out.println("Product ID: " + product.getProductID());
//            System.out.println("Product Name: " + product.getProductName());
//            System.out.println("Price Min: " + product.getPriceMin());
//            System.out.println("Price Max: " + product.getPriceMax());
//            System.out.println("-------------");
//        }
        List<ProductsHome> priceRange = productsDAO.getProductsByPriceRange(25, 50);
        for (ProductsHome products : priceRange) {
            System.out.println(products.getPriceMax());
        }
          List<ProductsHome> products = productsDAO.getTopBestSellers("5");
        for (ProductsHome product : products) {
            System.out.println(product.getProductName());
        }
    }

}
