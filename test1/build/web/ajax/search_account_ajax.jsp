

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Store</title>
    </head>
    <body>
    <c:forEach items="${requestScope.listUser}" var="u">
        <tr>
            <td class="text_page" style="font-weight: 500">${u.fullName}</td>
            <td class="text_page"  style="font-weight: 500">
                <img style="width: 70px; height: auto" src="${u.image}">
            </td>
            <td class="text_page"  style="font-weight: 500">${u.userName}</td>
            <td class="text_page"  style="font-weight: 500">${u.roleID==1?"Admin":"Customer"}</td>
            <td class="text_page"  style="font-weight: 500">${u.phone}</td>
            <td class="text_page"  style="padding: 0 12px 16px">
                <a href="deleteaccount?username=${u.userName}">
                    <button type="button" class="btn btn-danger">
                        <i class="fa-solid fa-trash" data-toggle="tooltip" title="Delete"></i>
                    </button>
                </a>
            </td>
        </tr>
    </c:forEach>
</body>
</html>
