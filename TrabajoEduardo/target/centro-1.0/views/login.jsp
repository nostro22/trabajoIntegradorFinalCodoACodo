<%@include file="/views/partials/header.jsp" %>

<%
  if ((boolean)session.getAttribute("isLogin")){
    response.sendRedirect("/");
  }  
%>

<main class="container d-flex justify-content-center align-items-center vh-100">

    <form method="POST" action="/centro/usuario/loginUser" class=" bg-warning bg-opacity-50 d-flex flex-column justify-content-center w-75 h-50 px-5 py-4 rounded" >
        <h2 class="mb-4 text-center">Login</h2>
        <div class="row mb-3">
            <label for="username" class="col-4 formlabel">Usuario:</label>
            <input type="text" id="username" name="username" class="col-8 formcontrol">
        </div>

        <div class="row mb-3">
            <label for="password" class="col-4 formlabel">Clave:</label>
            <input type="password" id="password" name="password" class="col-8 formcontrol">
        </div>

        <div class="mb-3 form-check">
            <input type="checkbox" id="exampleCheck1" class="form-check-input">
            <label for="exampleCheck1" class="form-check-label">Recordarme</label>
        </div>

        <div class="row align-items-center justify-content-between">
            <div class="col-auto">
                <button class="btn btn-dark" type="submit">Ingresar</button>
            </div>
            <div class="col-auto">
                <a href="/centro/views/registro.jsp" class="link-primary">Registrarme</a>
            </div>
        </div>
    </form>
</main>

<%@include file="/views/partials/footer.jsp" %>

