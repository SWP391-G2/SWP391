/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

/**
 *
 * @author pna29
 */
import Models.ProductDetail;
import Models.Products;
import Models.ProductsHome;
import Models.WishlistItems;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WishlistDAO extends DBContext {

    public void addToWishlist(int accountID, int productID) {
        String sql = "INSERT INTO Wishlist (AccountID, ProductID, DateAdded) VALUES (?, ?, GETDATE())";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, accountID);
            stmt.setInt(2, productID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<WishlistItems> getWishlistByAccountId(int accountID) {
        String sql = "SELECT w.WishlistID, w.AccountID, w.ProductID, w.DateAdded, "
                + "p.ProductName, p.ProductCreateDate, p.ProductStatus, p.ProductImageUrl, p.BrandID, p.CategoryID, "
                + "MIN(pd.ProductPrice) AS priceMin, MAX(pd.ProductPrice) AS priceMax, "
                + "pd.ProductFullDetailID, pd.ProductDescription, pd.ProductCreateDate AS DetailCreateDate, pd.ProductStatus AS DetailStatus, "
                + "pd.ProductSize, pd.ProductPrice, pd.ProductAvaiable, pd.image "
                + "FROM Wishlist w "
                + "JOIN Products p ON w.ProductID = p.ProductID "
                + "LEFT JOIN ProductFullDetail pd ON w.ProductID = pd.pdProductID "
                + "WHERE w.AccountID = ? "
                + "GROUP BY w.WishlistID, w.AccountID, w.ProductID, w.DateAdded, "
                + "p.ProductName, p.ProductCreateDate, p.ProductStatus, p.ProductImageUrl, p.BrandID, p.CategoryID, "
                + "pd.ProductFullDetailID, pd.ProductDescription, pd.ProductCreateDate, pd.ProductStatus, "
                + "pd.ProductSize, pd.ProductPrice, pd.ProductAvaiable, pd.image";

        List<WishlistItems> wishlist = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, accountID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                WishlistItems item = new WishlistItems();
                item.setWishlistID(rs.getInt("WishlistID"));
                item.setAccountID(rs.getInt("AccountID"));
                item.setProductID(rs.getInt("ProductID"));
                item.setDateAdded(rs.getDate("DateAdded"));

                ProductsHome product = new ProductsHome();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setProductCreateDate(rs.getDate("ProductCreateDate"));
                product.setProductStatus(rs.getInt("ProductStatus"));
                product.setProductImageUrl(rs.getString("ProductImageUrl"));
                product.setBrandID(rs.getInt("BrandID"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setPriceMin(rs.getBigDecimal("PriceMin"));
                product.setPriceMax(rs.getBigDecimal("PriceMax"));

                ProductDetail productFullDetail = new ProductDetail();
                productFullDetail.setProductFullDetailID(rs.getInt("ProductFullDetailID"));
                productFullDetail.setPdProductID(rs.getInt(2));
                productFullDetail.setProductDescription(rs.getString("ProductDescription"));
                productFullDetail.setProductCreateDate(rs.getDate("DetailCreateDate"));
                productFullDetail.setProductStatus(rs.getInt("DetailStatus"));
                productFullDetail.setProductSize(rs.getString("ProductSize"));
                productFullDetail.setProductPrice(rs.getBigDecimal("ProductPrice"));
                productFullDetail.setProductAvaiable(rs.getInt("ProductAvaiable"));
                productFullDetail.setImage(rs.getString("image"));

                item.setProduct(product);
                item.setProductFullDetail(productFullDetail);
                wishlist.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return wishlist;
    }

    public void removeFromWishlist(int accountID, int productID) {
        String sql = "DELETE FROM Wishlist WHERE AccountID = ? AND ProductID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, accountID);
            stmt.setInt(2, productID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        WishlistDAO wlDAO = new WishlistDAO();
        System.out.println(wlDAO.getWishlistByAccountId(1).size());
    }
}
