<%-- 
    Document   : consulta
    Created on : 5/05/2025, 7:35:43 a. m.
    Author     : SENA
--%>

<%@page import="java.util.List"%>
<%@page import="com.miproyecto.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Usuarios</title>
    <style>
        /* Variables para una paleta de colores armoniosa */
        :root {
            --primary-color: #6a5acd;        /* Slateblue - Color principal */
            --primary-dark: #5549a7;         /* Versión oscura del color principal */
            --secondary-color: #9370db;      /* Mediumpurple - Color secundario */
            --accent-color: #ffa07a;         /* Lightsalmon - Color de acento */
            --accent-dark: #ff8c66;          /* Versión oscura del acento */
            --success-color: #66cdaa;        /* Mediumaquamarine - Color de éxito */
            --error-color: #ff6b6b;          /* Tono de rojo suave - Color de error */
            --background: #f9f7ff;           /* Fondo principal muy suave */
            --card-bg: #ffffff;              /* Fondo de tarjetas */
            --text-color: #4a4a4a;           /* Color de texto principal */
            --text-light: #777777;           /* Color de texto claro */
            --border-color: #e6e6fa;         /* Lavender - Color de bordes */
            --shadow-sm: 0 2px 10px rgba(106, 90, 205, 0.08);
            --shadow-md: 0 4px 20px rgba(106, 90, 205, 0.15);
            --transition: all 0.3s ease;
        }
        
        /* Estilos base */
        body {
            font-family: 'Nunito', 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--background);
            color: var(--text-color);
            line-height: 1.7;
            background-image: linear-gradient(135deg, #f5f7fa 0%, #f9f7ff 100%);
            min-height: 100vh;
        }
        
        /* Contenedor principal */
        .container {
            max-width: 950px;
            margin: 40px auto;
            padding: 35px;
            background-color: var(--card-bg);
            box-shadow: var(--shadow-md);
            border-radius: 16px;
            position: relative;
            overflow: hidden;
        }
        
        .container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color), var(--accent-color));
        }
        
        /* Tipografía */
        h1 {
            color: var(--primary-color);
            font-size: 32px;
            margin-bottom: 30px;
            font-weight: 700;
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 2px solid var(--border-color);
            position: relative;
        }
        
        h1::after {
            content: "";
            position: absolute;
            bottom: -2px;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 2px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        }
        
        h2 {
            color: var(--secondary-color);
            font-size: 24px;
            margin: 30px 0 20px;
            font-weight: 600;
            position: relative;
            padding-left: 18px;
        }
        
        h2::before {
            content: "";
            position: absolute;
            left: 0;
            top: 10%;
            height: 80%;
            width: 6px;
            background: linear-gradient(to bottom, var(--primary-color), var(--secondary-color));
            border-radius: 3px;
        }
        
        /* Formulario con colores atractivos */
        .form-group {
            margin-bottom: 28px;
            padding: 25px;
            background-color: #f0ebff;
            border-radius: 12px;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
        }
        
        .form-group label {
            display: block;
            margin-bottom: 12px;
            font-weight: 600;
            color: var(--primary-color);
            font-size: 18px;
        }
        
        .form-group input {
            width: 70%;
            padding: 14px 18px;
            box-sizing: border-box;
            border: 2px solid #e0d8ff;
            border-radius: 10px;
            font-size: 16px;
            transition: var(--transition);
            font-family: 'Nunito', sans-serif;
            color: var(--text-color);
        }
        
        .form-group input:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 4px rgba(106, 90, 205, 0.2);
        }
        
        .form-group input::placeholder {
            color: #b8b2d1;
        }
        
        .btn {
            padding: 14px 24px;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: var(--transition);
            margin-left: 10px;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 15px rgba(106, 90, 205, 0.3);
        }
        
        .btn:hover {
            background: linear-gradient(45deg, var(--primary-dark), var(--primary-color));
            transform: translateY(-3px);
            box-shadow: 0 6px 18px rgba(106, 90, 205, 0.4);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        /* Estilos para resultados */
        .results {
            margin: 30px 0;
            padding: 25px;
            border: 1px solid var(--border-color);
            border-radius: 12px;
            background-color: #f7f5ff;
            box-shadow: var(--shadow-sm);
        }
        
        .not-found {
            color: var(--error-color);
            background-color: rgba(255, 107, 107, 0.1);
            padding: 16px;
            border-radius: 8px;
            border-left: 5px solid var(--error-color);
            font-style: italic;
            font-weight: 500;
            box-shadow: 0 2px 8px rgba(255, 107, 107, 0.1);
        }
        
        /* Tabla con colores armoniosos */
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin: 25px 0;
            box-shadow: var(--shadow-sm);
            overflow: hidden;
            border-radius: 12px;
            background-color: var(--card-bg);
        }
        
        table, th, td {
            border: none;
        }
        
        th, td {
            padding: 16px 20px;
            text-align: left;
            vertical-align: middle;
        }
        
        th {
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 1px;
        }
        
        th:first-child {
            border-top-left-radius: 12px;
        }
        
        th:last-child {
            border-top-right-radius: 12px;
        }
        
        tr:last-child td:first-child {
            border-bottom-left-radius: 12px;
        }
        
        tr:last-child td:last-child {
            border-bottom-right-radius: 12px;
        }
        
        tr {
            transition: var(--transition);
        }
        
        tr:nth-child(even) {
            background-color: #f7f5ff;
        }
        
        tr:hover {
            background-color: #f0ebff;
        }
        
        td {
            border-bottom: 1px solid var(--border-color);
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        /* Menú de navegación atractivo */
        .menu {
            margin: 40px 0 15px;
            padding: 25px 0;
            border-top: 2px solid var(--border-color);
            text-align: center;
        }
        
        .menu a {
            color: var(--primary-color);
            text-decoration: none;
            margin: 0 15px;
            font-weight: 600;
            transition: var(--transition);
            padding: 10px 20px;
            border-radius: 25px;
            display: inline-block;
            background-color: #f7f5ff;
            box-shadow: var(--shadow-sm);
        }
        
        .menu a:hover {
            color: white;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            box-shadow: 0 4px 12px rgba(106, 90, 205, 0.3);
            transform: translateY(-2px);
        }
        
        /* Mensaje cuando no hay usuarios */
        p {
            color: var(--text-light);
            font-style: italic;
            text-align: center;
            padding: 20px;
            background-color: #f7f5ff;
            border-radius: 10px;
            border: 1px dashed var(--border-color);
        }
        
        /* Diseño responsive */
        @media (max-width: 768px) {
            .container {
                margin: 20px 10px;
                padding: 20px;
            }
            
            h1 {
                font-size: 28px;
            }
            
            .form-group {
                padding: 15px;
            }
            
            .form-group input {
                width: 100%;
                margin-bottom: 15px;
            }
            
            .btn {
                width: 100%;
                margin-left: 0;
            }
            
            table {
                display: block;
                overflow-x: auto;
            }
            
            th, td {
                padding: 12px 15px;
            }
            
            .menu a {
                display: block;
                margin: 10px 0;
            }
        }
        
        /* Animaciones sutiles */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .container {
            animation: fadeIn 0.6s ease-out;
        }
        
        /* Estilos adicionales para mejorar la experiencia visual */
        input:-webkit-autofill,
        input:-webkit-autofill:hover, 
        input:-webkit-autofill:focus {
            -webkit-box-shadow: 0 0 0px 1000px #f7f5ff inset;
            -webkit-text-fill-color: var(--text-color);
            transition: background-color 5000s ease-in-out 0s;
        }
        
        ::selection {
            background-color: rgba(106, 90, 205, 0.2);
            color: var(--primary-dark);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Consulta de Usuarios</h1>
        
        <%-- Formulario de búsqueda que usa método GET --%>
        <form action="consulta" method="GET">
            <div class="form-group">
                <label for="email">Buscar usuario por email:</label>
                <input type="email" id="email" name="email" required placeholder="Ingrese el correo electrónico del usuario">
                <button type="submit" class="btn">Buscar</button>
            </div>
        </form>
        
        <%-- Resultados de la búsqueda --%>
        <% if (request.getAttribute("busquedaRealizada") != null) { %>
            <div class="results">
                <h2>Resultado de la búsqueda</h2>
                
                <% if (request.getAttribute("usuarioBuscado") != null) { %>
                    <% Usuario usuario = (Usuario) request.getAttribute("usuarioBuscado"); %>
                    <table>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Email</th>
                        </tr>
                        <tr>
                            <td><%= usuario.getNombre() %></td>
                            <td><%= usuario.getApellido() %></td>
                            <td><%= usuario.getEmail() %></td>
                        </tr>
                    </table>
                <% } else { %>
                    <div class="not-found">
                        No se encontró ningún usuario con el email especificado.
                    </div>
                <% } %>
            </div>
        <% } %>
        
        <%-- Lista de todos los usuarios --%>
        <h2>Lista de Usuarios Registrados</h2>
        
        <% 
            List<Usuario> listaUsuarios = (List<Usuario>) session.getAttribute("listaUsuarios");
            if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                </tr>
                <% for (Usuario usuario : listaUsuarios) { %>
                    <tr>
                        <td><%= usuario.getNombre() %></td>
                        <td><%= usuario.getApellido() %></td>
                        <td><%= usuario.getEmail() %></td>
                    </tr>
                <% } %>
            </table>
        <% } else { %>
            <p>No hay usuarios registrados en el sistema.</p>
        <% } %>
        
        <div class="menu">
            <a href="index.jsp">Volver a Inicio</a> | 
            <a href="registro">Registrar Usuario</a>
        </div>
    </div>
</body>
</html>
