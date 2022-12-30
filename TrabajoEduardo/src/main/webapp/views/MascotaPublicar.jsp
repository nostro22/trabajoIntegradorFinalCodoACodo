

<%@include file="/views/partials/header.jsp" %>

<%
  
  if (!(boolean)session.getAttribute("isLogin")){
    response.sendRedirect("/centro");
  } 
%>

<main class="container d-flex justify-content-center align-items-center vh-100">

    
    <form method="POST" action="/centro/mascotas/publicar" class=" bg-warning bg-opacity-50 d-flex flex-column justify-content-center w-100 h-75 px-5 py-4 rounded" >
        <h2 class="mb-4 text-center">Donar Mascota</h2>
        <div class="row mb-3">
            <label for="vendedor" class="col-4 formlabel">Donante</label>
            <input type="text" id="vendedor" name="vendedor" class="col-8 formcontrol" value="<%= (String) session.getAttribute("actualUsername") %>" disabled>
        </div>

        <div class="row mb-3">
            <label for="nombre" class="col-4 formlabel">Nombre Mascota</label>
            <input type="text" id="nombre" name="nombre" class="col-8 formcontrol" required>
        </div>

        <div class="row mb-3">
            <label for="raza" class="col-4 formlabel">Raza</label>
            <input type="text" id="raza" name="raza" class="col-8 formcontrol" required>
        </div>

        <div class="row mb-3">
            <label for="edad" class="col-4 formlabel">Edad</label>
            <input type="number" id="edad" name="edad" class="col-8 formcontrol" required="">
        </div>

        <div class="row align-items-center justify-content-between">
            <div class="col-auto">
                <button class="btn btn-dark" type="submit">Publicar</button>
            </div>
            <div class="col-auto">
                <a href="/centro" class="link-primary">Inicio</a>
            </div>
        </div>
    </form>
</main>

<%@include file="/views/partials/footer.jsp" %>
