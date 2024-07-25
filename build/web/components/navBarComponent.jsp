 <%-- 

--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<script>
    function login() {
        window.location.href = "login.jsp";
    }
    function logout() {
        window.location.href = "logout";

    }
</script>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="home">NXC Store</a>
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">

            <c:choose>
                <c:when test="${acc != null}">
                    <div class="d-flex my-2">
                        <a class="btn btn-outline-dark me-2" href="carts">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                        </a>
                    </div>
                    <div class="dropdown me-5">
                        <a class="btn btn-light dropdown-toggle me-2 " style="border: black solid 1px; margin-left: 10px" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle me-2 ms-2"></i>Profile
                        </a>

                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">

                            <c:if test="${sessionScope.acc.isAdmin == 1}">                               
                                <li><a class="dropdown-item" href="managerAccount"><i class="bi bi-bag-check-fill"></i> Manager Account</a></li>
                                <li><a class="dropdown-item" href="managerCategory"><i class="bi bi-bag-check-fill"></i> Manager Category</a></li>
                            </c:if>
                            <c:if test="${sessionScope.acc.isSell == 1}">
                                <li><a class="dropdown-item" href="manager"><i class="bi bi-bag-check-fill"></i> Manager Product</a></li>                           
                            </c:if>
                            <li><a class="dropdown-item" href="#"><i class="bi bi-bell-fill"></i> Hello ${sessionScope.acc.user}</a></li>
                            <li><a class="dropdown-item" href="logout">Log out <i class="ms-5 bi bi-box-arrow-right"></i></a></li>
                        </ul>
                    </div> 
                </c:when>
                <c:otherwise>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-outline-dark me-2" data-bs-toggle="modal" data-bs-target="#modalLoginForm">
                        Log in
                    </button>
                    <button type="button" class="btn btn-dark me-lg-5" data-bs-toggle="modal" data-bs-target="#modalRegistetForm">
                        Sign up
                    </button>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
    <!-- Modal Login -->
    <div class="modal fade" id="modalLoginForm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h5 class="modal-title text-center" id="exampleModalLabel">Login</h5>
                </div>
                <div class="modal-body">
                    <form action="login" method="POST">
                        <div class="mb-3">
                            <label class="form-label">User Name</label>
                            <input type="text" class="form-control"  name="Username"  />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required/>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" />
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                            <a href="forgetPassword" class="float-end">Forgot password?</a>
                        </div>
                        </br>
                        <div class="d-block mx-4 mb-3 mb-lg-4 text-center">
                            <button type="submit" class="btn btn-warning">Login</button>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>

    <!--Model Register-->
    <div class="modal fade" id="modalRegistetForm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h5 class="modal-title text-center" id="exampleModalLabel">SignUp</h5>
                </div>

                <div class="modal-body">
                    <form action="signup" source="custom" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control" name="user" placeholder="Your Name" required/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" id="username" name="pass" placeholder="Password"  required/>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Repeat Password</label>
                            <input type="password" class="form-control" name="repass" placeholder="Repeat Password"  required/>
                        </div>

                        </br>
                        <div class="d-block mx-4 mb-3 mb-lg-4 text-center">
                            <button type="submit" class="btn btn-warning" >Sign Up</button>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>
</nav>
