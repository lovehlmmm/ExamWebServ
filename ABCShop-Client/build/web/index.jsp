<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Product</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <style>
            .table{
                background-color: #bcdcea;
                margin: auto;
                padding: 5px;
                width: 90%;
            }
        </style>
        <script src="js/libs/modernizr.min.js"></script>
        <script src="js/libs/jquery-1.10.0.js"></script>
        <script src="js/libs/jquery-ui.min.js"></script>
        <script src="js/libs/bootstrap.min.js"></script>
        <link href="css/bootstrap.css" media="screen" rel="stylesheet">
        <link href="style.css" media="screen" rel="stylesheet">
        <script src="js/general.js"></script>
        <!--End template-->

        <!--Validate Boostrap 3-->
        <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/validate.css">
        <!--End Validate Boostrap 3-->
    </head>

    <body>
        <div class="container_fix">
            <!--login logout-->
            <div class="form_fix">
                <a href="product.jsp"><input type="button" value="Add New Product" /> </a>
            </div>
            <!--messages-->
            <div class="message">
                <c:if test="${not empty message}">
                    <div class="comment-list styled clearfix">
                        <ol>
                            <li class="comment">
                                <div class="comment-body">
                                    <div class="comment-arrow"></div>
                                    <div class="comment-avatar">
                                        <div class="avatar">
                                            <img src="images/messages.png" alt=""/>
                                        </div>
                                    </div>
                                    <div class="comment-text">
                                        <div class="comment-author clearfix">
                                            <a href="#" class="link-author">
                                                <font color="#bd1313">${requestScope.message}</font>
                                            </a>
                                        </div>

                                        <div class="comment-entry">
                                            <font color="#bd1353">
                                            <c:choose>
                                                <c:when test="${not empty items}">
                                                    ----------001-------List not empty----
                                                </c:when>
                                                <c:otherwise> 
                                                    ----------002-------List empty----
                                                </c:otherwise>
                                            </c:choose>
                                            </font>
                                        </div>

                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </li>
                        </ol>
                    </div>
                </c:if>
            </div>



            <!--endContainer-->
            <div class="bang_nhatky">
                <c:if test="${not empty items}">
                    <!--Table 1-->
                    <table border="1" class="table table-hover" >
                        <tr>
                            <th>ID.</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Sell</th>
                            <!--<th>Birth</th>-->
                        </tr>
                        <tbody>
                            <c:forEach var="it" items="${items}">
                                <tr>
                                    <td class="active"><c:out value="${it.id}"/> </td>
                                    <td class="info"><c:out value="${it.name}"/></td>
                                    <td class="danger"><c:out value="${it.price}"/></td>
                                    <td class="success" style="width: 100px;"><c:out value="${it.quantity}"/> </td>
                                    <td class="warning" style="width: 30px;"><span class="btn btn-hover btn-white"><a href="sellServlet"><input type="button" value="Sell"/></a> </span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>

        <!--Validate Boostrap 3-->
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

        <script src="js/validate.js"></script>
        <!--End Boostrap 3-->
    </body>
</html>
