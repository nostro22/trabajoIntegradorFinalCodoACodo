

<%@page import="model.Mascota"%>
<%@include file="/views/partials/header.jsp" %>

<%
  
  if (!(boolean)session.getAttribute("isLogin")){
    response.sendRedirect("/centro");
  } 
    Mascota actualMascota = (Mascota) session.getAttribute("aCreado");

%>

<main class="container d-flex justify-content-center align-items-center vh-100">

    
    <form method="POST" action="/centro/mascotas/actualizar" class=" bg-warning bg-opacity-50 d-flex flex-column justify-content-center w-75 h-75 px-5 py-4 rounded" >
        <h2 class="mb-4 text-center">Publicar Mascota</h2>
        <input type="text" id="id" name="id" class="col-8 formcontrol" value="<%= actualMascota.getId() %>" hidden="true">
        <div class="row mb-3">
            <label for="donador" class="col-4 formlabel">Donador</label>
            <input type="text" id="donador" name="donador" class="col-8 formcontrol" value="<%= (String) session.getAttribute("actualUsername") %>" disabled>
        </div>

        <div class="row mb-3">
            <label for="nombre" class="col-4 formlabel">Titulo</label>
            <input type="text" id="nombre" name="nombre" class="col-8 formcontrol" required value="<%= actualMascota.getNombre()%>">
        </div>

        <div class="row mb-3">
            <label for="raza" class="col-4 formlabel">raza</label>
            <input type="text" id="raza" name="raza" class="col-8 formcontrol" required value="<%= actualMascota.getRaza()%>">
        </div>

        <div class="row mb-3">
            <label for="edad" class="col-4 formlabel">edad</label>
            <input type="number" id="edad" name="edad" class="col-8 formcontrol" required="" value="<%= actualMascota.getEdad()%>">
        </div>

        <div class="row align-items-center justify-content-between">
            <div class="col-auto">
                <button class="btn btn-dark" type="submit">Editar</button>
            </div>
            <div class="col-auto">
                <a href="/centro" class="link-primary">Inicio</a>
            </div>
        </div>
    </form>
</main>

<%@include file="/views/partials/footer.jsp" %>
