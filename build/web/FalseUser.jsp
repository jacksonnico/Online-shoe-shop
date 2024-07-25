

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test = "${requestScope.mess != null }">
    <script>
        alert("${mess}");
    </script>
</c:if>
 
<c:if test = "${requestScope.match != null }">
    <script>
        alert("${match}");
    </script>
</c:if>
    
