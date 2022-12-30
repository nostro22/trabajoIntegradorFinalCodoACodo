
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Market</title>
        <link rel="stylesheet" href="/centro/css/tags.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body class=" v-100">

        <header class="container-fluid m-0 p-0  ">
            <nav class=" p-0 hambuerguesaDrop navbar container-fluid   navbar-expand-lg bg-warning py-2 ">
                <div class="p-0 hambuerguesaDrop container align-items-center  justify-content-betwee">
                    <div class="container-fluid justify-content-center">
                        <a class="navbar-brand d-flex justify-content-center" href="/centro">
                            <img class="rounded  text-warning " style="height: 70px;" src="/centro/img/logoPets.png" alt="logo"/>
                            <h1 class="text-light fw-bold mt-3 ps-3 ">Huellita</h1>
                        </a>
                    </div>

                    <div  class="hambuerguesaDrop container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                            <div class="navbar-nav">        

                                <%
                                    boolean isLogin;
                                    if (session.isNew()) {
                                        session.setAttribute("isLogin", false);
                                    }
                                    isLogin = (boolean) session.getAttribute("isLogin");
                                %>

                                <ul class="burger_nav nav  align-items-center gap-3  p-4">
                                    <li class="nav-item mx-2  " style="display: <%= isLogin ? "none" : "initial"%>">
                                        <a class="nav-link btn btn-outline-secondary border  border-5 border-info border-opacity-75 text-light" href="/centro/views/login.jsp">Ingresar</a>
                                    </li>
                                    <li class="nav-item mx-2" style="display: <%= isLogin ? "none" : "initial"%>">
                                        <a class="nav-link btn btn-outline-secondary border  border-5 border-info  text-light border-opacity-75" href="/centro/views/registro.jsp">Registrarme</a>
                                    </li>
                                    <li class="nav-item mx-2" style="display: <%= !isLogin ? "none" : "initial"%>">
                                        <a class="nav-link btn btn-outline-secondary border  border-5 border-info  text-light border-opacity-75" href="/centro/usuario/viewUser">Mi cuenta</a>
                                    </li>
                                    <li class="nav-item mx-2" style="display: <%= !isLogin ? "none" : "initial"%>">
                                        <a class="nav-link btn btn-outline-secondary border  border-5 border-info  text-light border-opacity-75" href="/centro/views/MascotaPublicar.jsp">Dar en Adopcion</a>
                                    </li>
                                    <li class="nav-item mx-2" style="display: <%= !isLogin ? "none" : "initial"%>">
                                        <a class="nav-link btn btn-outline-secondary border  border-5 border-info  text-light border-opacity-75" href="/centro/mascotas/obtenerLista">Lista de mascotas</a>
                                    </li>
                                    <li class="nav-item mx-2" style="display: <%= !isLogin ? "none" : "initial"%>">
                                        <a class="nav-link btn btn-outline-secondary border  border-5 border-info  text-light border-opacity-75" href="/centro/usuario/logoutUser">Salir</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </nav>

        </header>

