<%-- 
    Document   : order
    Created on : Jul 3, 2024, 12:37:58 AM
    Author     : hatru
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Status</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .main-content {
                padding: 20px;
            }
            .os-header {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }
            .os-header svg {
                margin-right: 15px;
            }
            .os-header-heading {
                margin-left: 15px;
            }
            .product-thumbnail img {
                max-width: 50px;
                max-height: 50px;
            }
            .section {
                margin-bottom: 20px;
            }
            .content-box {
                border: 1px solid #e0e0e0;
                border-radius: 5px;
                padding: 15px;
            }
            .content-box-row {
                margin-bottom: 10px;
            }
            .step-footer {
                margin-top: 20px;
            }
            .order-summary-section {
                margin-bottom: 20px;
            }
            .total-line-table {
                width: 100%;
            }
            .total-line-table td {
                padding: 5px 10px;
            }
        </style>
    </head>
    <body>
        <div class="main-content container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="section">
                        <div class="section-header os-header">
                            <svg width="50" height="50" xmlns="http://www.w3.org/2000/svg" fill="none" stroke="#000" stroke-width="2" class="hanging-icon checkmark">
                            <path class="checkmark_circle" d="M25 49c13.255 0 24-10.745 24-24S38.255 1 25 1 1 11.745 1 25s10.745 24 24 24z"></path>
                            <path class="checkmark_check" d="M15 24.51l7.307 7.308L35.125 19"></path>
                            </svg>
                            <div class="os-header-heading">
                                <h2 class="os-header-title">
                                    Order Successful
                                </h2>

                                <span class="os-order-number">
                                    Order ID: ${requestScope.orderID}
                                </span>
                                <span class="os-description">
                                    Thank you for your purchase!
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="section thank-you-checkout-info">
                        <div class="section-content">
                            <div class="content-box">
                                <div class="content-box-row content-box-row-padding content-box-row-no-border">
                                    <h2>Order Information</h2>
                                </div>
                                <div class="content-box-row content-box-row-padding">
                                    <div class="section-content">
                                        <div class="section-content-column">
                                            <h3>Shipping Information</h3>
                                            <p>${requestScope.fullname}<br>${requestScope.phone}<br>${requestScope.addressdetails}<br>${requestScope.ward}<br>${requestScope.district}<br>${requestScope.city}<br>Vietnam</p>
                                            <h3>Payment Method</h3>
                                            <p>COD (Cash on Delivery)</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="step-footer">
                        <a href="/" class="step-footer-continue-btn btn btn-primary">
                            <span class="btn-content">Continue Shopping</span>
                        </a>
                        <p class="step-footer-info">
                            <i class="icon icon-os-question"></i>
                            <span>Need help? <a href="mailto:support@namperfume.net">Contact us</a></span>
                        </p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="sidebar-content">
                        <div class="order-summary">
                            <h2 class="visually-hidden">Order Summary</h2>
                            <div class="order-summary-sections">
                                <div class="order-summary-section order-summary-section-product-list" data-order-summary-section="line-items">

                                    <table class="product-table table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col"><span class="visually-hidden">Image</span></th>
                                                <th scope="col"><span class="visually-hidden">Description</span></th>
                                                <th scope="col"><span class="visually-hidden">Size</span></th>
                                                <th scope="col"><span class="visually-hidden">Quantity</span></th>
                                                <th scope="col"><span class="visually-hidden">Price</span></th>
                                            </tr>
                                        </thead>
                                       
                                        <c:forEach items="${requestScope.listcart}" var="cart" varStatus="loop">
                                            <tbody>
                                                <tr class="product" data-product-id="1019508805" data-variant-id="1043378289">
                                                    <td class="product-image">
                                                        <div class="product-thumbnail">
                                                            <div class="product-thumbnail-wrapper">
                                                                <img class="product-thumbnail-image" alt="Product Image" src="${listproduct[loop.index].getImage()}">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="product-description">
                                                        <span class="product-description-name order-summary-emphasis">${listcart[loop.index].getName()}</span>
                                                        
                                                    </td>
                                                    <td class="product-description">
                                                        <span class="product-description-name order-summary-emphasis">${listproduct[loop.index].getProductSize()}</span>
                                                        
                                                    </td>
                                                    <td class="product-description">
                                                        <span class="product-description-name order-summary-emphasis">${listcart[loop.index].getQuantity()}</span>
                                                        
                                                    </td>
                                                    <td class="product-price">
                                                        <span class="order-summary-emphasis">${listproduct[loop.index].getProductPrice()}$</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                                <div class="order-summary-section order-summary-section-total-lines payment-lines" data-order-summary-section="payment-lines">
                                    <table class="total-line-table table table-borderless">
                                        <thead>
                                            <tr>
                                                <th scope="col"><span class="visually-hidden">Description</span></th>
                                                <th scope="col"><span class="visually-hidden">Price</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="total-line total-line-shipping">
                                                <td class="total-line-name">Shipping Fee</td>
                                                <td class="total-line-price">
                                                    <span class="order-summary-emphasis" data-checkout-total-shipping-target="0">Free</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tfoot class="total-line-table-footer">
                                            <tr class="total-line">
                                                <td class="total-line-name payment-due-label">
                                                    <span class="payment-due-label-total">Total</span>
                                                </td>
                                                <td class="total-line-name payment-due">
                                                    <span class="payment-due-currency">USD</span>
                                                    <span class="payment-due-price" data-checkout-payment-due-target="137750000">${requestScope.total}</span>
                                                    <span class="checkout_version" display:none="" data_checkout_version="0"></span>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>