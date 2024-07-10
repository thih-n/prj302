
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch Store</title>
    </head>
    <body>
        <c:forEach items="${requestScope.listWallet}" var="w">
        <tr>
            <td class="text_page" style="font-weight: 500">${w.userName}</td>
            <td class="text_page" style="font-weight: 500">${w.balance}</td>
            <td class="text_page">
                <a data-toggle="modal" data-target="#modal_box" onclick="modalEditWallet('modal_box', `${w.userName}`)" href="#">
                    <button type="button" class="btn btn-warning"><i class="fa-solid fa-plus"></i></button>
                </a>
            </td>
        </tr>
    </c:forEach>
</body>
</html>
