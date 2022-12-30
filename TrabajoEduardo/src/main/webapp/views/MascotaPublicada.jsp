
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="/views/partials/header.jsp" %>

        <main class="d-flex flex-column justify-content-center align-items-center">
            <h2 class="mb-3">Informacion de operacion de Mascotas</h2>
            
            <%
            int aCreado = (int) session.getAttribute("aCreado");
            switch (aCreado) {
                case 1:
                    %>
                    <h3 class="text-success">¡Mascota publicado con exito!</h3>
                    <% session.setAttribute("aCreado",null); %>
                    <%
                    break;
                default:
                    %>
                    <h3 class="text-danger">¡Publicar anuncio fallo error!</h3>
                    <%
                    break;
            }
            %>
            
            <a href="/centro/" class="mt-3">Volver al INICIO</a>
            
        </main>


<%@include file="/views/partials/footer.jsp" %>