
<%@include file="/views/partials/header.jsp" %>

<%
  if ((boolean)session.getAttribute("isLogin")){
    response.sendRedirect("/");
  }  
%>

<main class="container d-flex justify-content-center align-items-center vh-100">

    <form method="POST" action="/centro/usuario/createUser" class=" bg-warning bg-opacity-50 d-flex flex-column justify-content-center w-75 h-75 px-5 py-4 rounded" >
        <h2 class="mb-4 text-center">Registro</h2>
        <div class="row mb-3">
            <label for="username" class="col-4 formlabel">Usuario:</label>
            <input type="text" id="username" name="username" class="col-8 formcontrol">
        </div>

        <div class="row mb-3">
            <label for="password" class="col-4 formlabel">Clave:</label>
            <input type="password" id="password" name="password" class="col-8 formcontrol">
        </div>

        <div class="row mb-3">
            <label for="name" class="col-4 formlabel">Nombre:</label>
            <input type="text" id="name" name="name" class="col-8 formcontrol">
        </div>

        <div class="row mb-3">
            <label for="last_name" class="col-4 formlabel">Apellido:</label>
            <input type="text" id="last_name" name="last_name" class="col-8 formcontrol">
        </div>

        <div class="row mb-3">
            <label for="email" class="col-4 formlabel">Email:</label>
            <input type="email" id="email" name="email" class="col-8 formcontrol">
        </div>

        <div class="row align-items-center justify-content-between">
            <div class="col-auto">
                <button class="btn btn-dark" type="submit">Registrar</button>
            </div>
            <div class="col-auto">
                <a href="/centro" class="link-primary">Inicio</a>
            </div>
        </div>
    </form>
</main>

<%@include file="/views/partials/footer.jsp" %>
