<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell Product</title>
        <!-- main JS libs -->
        <script src="js/libs/modernizr.min.js"></script>
        <script src="js/libs/jquery-1.10.0.js"></script>
        <script src="js/libs/jquery-ui.min.js"></script>
        <script src="js/libs/bootstrap.min.js"></script>
        <!-- Style CSS -->
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
            <div class="form_fix">
                <!--table + form-->
                <form action="sellServlet" method="Post" id="contact_form">
                    <div class="field_text">

                        <div class="form-group form-group_fix">
                            ID Product:
                            <select name="id">
                                <option value="0" selected>(please select id)</option>
                                <c:forEach var="it1" items="${items}">
                                    <option value="${it1.id}" /><c:out value="${it1.id}"/> </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group form-group_fix">
                            Quantity: 
                            <input type="number" name="quantity" placeholder="Enter quantity" class="form-control" />
                        </div>
                        <span class="btn btn-large btn-green"><input type="submit" value="Sell" name="action"/></span>
                </form>
            </div>
            <!--end table +form-->
            <div class="message">
                <c:if test="${not empty message or error}">
                    <!--Note-->
                    <div class="comment-list styled clearfix">
                        <ol>
                            <li class="comment">
                                <div class="comment-body">
                                    <div class="comment-arrow"></div>
                                    <div class="comment-avatar">
                                        <div class="avatar">
                                            <img src="images/icon-login.gif" alt=""/>
                                        </div>
                                    </div>
                                    <div class="comment-text">
                                        <div class="comment-author clearfix">
                                            <a href="#" class="link-author"> 
                                                <c:if test="${not empty message}">
                                                    <font color="#bd1313"><c:out value="${requestScope.message}"/></font>
                                                </c:if>
                                            </a>
                                        </div>
                                        <c:if test="${not empty error }">
                                            <font color="#bd1318"><c:out value="${requestScope.error}"/></font>
                                        </c:if>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </li>
                        </ol>
                    </div>
                </c:if>
            </div>
        </div>
        <!--endNote-->

        <!--Validate Boostrap 3-->
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

        <script src="js/validate.js"></script>
        <!--End Boostrap 3-->
    </body>
</html>