
<%@page import="model.Mascota"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.LinkedList" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Collections" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/views/partials/header.jsp" %>

<%    List<Mascota> listaMascotas = (List<Mascota>) session.getAttribute("listaMascotas");
    String clase;
%>


<main class="d-flex  bg-secondary justify-content-center align-items-center  " >
    <div class="container vh-100 vw-100 py-5">

        <table class="table table-dark  w-100 ">
            <thead>
            <th scope="col">Donante</th>
            <th scope="col">Nombre Mascota</th>
            <th scope="col">Raza</th>
            <th scope="col">Edad</th>
            <th scope="col">Adoptado Por</th>
            <th scope="col">Acciones </th>
            </thead>
            <tbody>
                <%
                    for (int idx = 0; idx < listaMascotas.size(); idx++) {
                        Mascota elem = listaMascotas.get(idx);
                        clase = " col-md-4 col-sm-12";

                %>
                <% if (!elem.getCliente().equals("")) {
                        clase = " bg-success text-light justify-content-between col-md-3 col-sm-12";
                    }%>
                <tr  class="<%= clase%>">
                    <td class="card-title"> <%= elem.getNombre()%> </h5>
                    <td class="card-text"><%= elem.getRaza()%></p>
                    <td class="card-text text-info"><%= elem.getDonante()%></p>
                    <td class="card-text text-warning"><%= elem.getEdad()%></p>
                    <td class="card-text text-warning"><%= elem.getCliente()%></p>



                    <td class="card-footer h-20">
                        <%
                            if (elem.getCliente().equals("") && !elem.getDonante().equals((String) session.getAttribute("actualUsername"))) {
                        %>
                        <a href="/centro/mascotas/adoptar?id=<%= elem.getId()%>"  class="btn btn-primary">Adoptar</a>
                        <%
                            }
                            if (elem.getDonante().equals((String) session.getAttribute("actualUsername"))) {
                                if (elem.getCliente().equals("")) {
                        %>
                        <a href="/centro/mascotas/editar?id=<%= elem.getId()%>"  class="btn btn-warning">Editar</a>
                        <%
                            }
                        %>
                        <a href="/centro/mascotas/borrar?id=<%= elem.getId()%>"  class="btn btn-danger">Borrar</a>
                        <%

                            }%>
                    </td>

                </tr>


                <%

                    }

                %>
            </tbody>
        </table>
    </div>
</main>




<%@include file="/views/partials/footer.jsp" %>
