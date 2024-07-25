<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>NXC Store</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <%@include file="components/navBarComponent.jsp" %>
    <%@include file="FalseUser.jsp" %>

    <!-- Header-->
    <header class="mt-2">
        <div class="container">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="assets/anh1.png" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="https://media-api.advertisingvietnam.com/oapi/v1/media?uuid=public%2Fwp-content%2Fuploads%2F2019%2F03%2FNike-2.jpg&resolution=1440x756&type=image" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="assets/3.png" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="assets/4.png" class="d-block w-100" alt="..." />
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </header>

    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row">
                <div class="col-md-3 mb-5">
                    <h3>List Categories</h3>
                    <ul class="list-group category_block">
                        <c:forEach items="${listCategories}" var="C">
                            <li class="list-group-item text-white ${tag == C.cid? "active":""}">
                                <a href="category?categoryId=${C.cid}">${C.cname}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-md-9">
                    <h3>List Products</h3>
                    <!-- Search form -->
                    <form action="search" class="mb-3">
                        <div class="input-group">
                            <input type="text" class="form-control form-control-sm" placeholder="Search products" name="keyword">
                            <button class="btn btn-primary btn-sm" type="submit">Search</button>
                        </div>
                    </form>
                    <form action="home" method="GET">
                        <label for="sort">Sort by Price:</label>
                        <select name="sort" id="sort">
                            <option value="default">Default</option>
                            <option value="asc">Low to High</option>
                            <option value="desc">High to Low</option>
                        </select>
                        <button type="submit">Sort</button>
                    </form>


                    <c:choose>
                        <c:when test="${listProducts==null || listProducts.size()==0}">
                            Not founds
                        </c:when>
                        <c:otherwise>
                            <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="home?page=${page-1}&sort=${param.sort}">Previous</a></li>
                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                        <li class="page-item ${i == page?"active":""}">
                                            <a class="page-link" href="home?page=${i}&sort=${param.sort}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item"><a class="page-link" href="home?page=${page+1}&sort=${param.sort}">Next</a></li>
                                </ul>
                            </nav>
                        </c:otherwise>
                    </c:choose>

                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center">
                        <c:forEach items="${listProducts}" var="P">
                            <div class="col mb-5">
                                ${P.id}
                                <div class="card h-100">
                                    <!-- Product image-->
                                    <a href="detail?productId=${P.id}">
                                        <img class="card-img-top" src="${P.imageUrl}" alt="..." />
                                    </a>
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">${P.name}</h5>
                                            <!-- Product reviews-->
                                            <div class="d-flex justify-content-center small text-warning mb-2">
                                                <div class="bi-star-fill">${P.tiltle}</div>
                                            </div>
                                            <!-- Product price-->
                                            $${P.price}
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="components/footerComponent.jsp" %>
</body>
</html>
