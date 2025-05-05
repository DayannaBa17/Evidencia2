<%-- 
    Document   : registro
    Created on : 5/05/2025, 7:36:14 a. m.
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
    <style>
        :root {
            --primary-color: #6c5ce7;
            --primary-gradient: linear-gradient(to right, #6c5ce7, #fd79a8);
            --accent-color: #fd79a8;
            --light-bg: #f8f7ff;
            --border-color: #e1e1e8;
            --text-dark: #333;
            --text-gray: #666;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text-dark);
            background-color: #f9f9f9;
            padding: 0;
            margin: 0;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .header {
            background: var(--primary-gradient);
            color: white;
            padding: 20px 0;
            margin-bottom: 30px;
            text-align: center;
            border-radius: 10px;
            box-shadow: var(--shadow);
        }

        .header h1 {
            font-weight: 600;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: var(--shadow);
            border: 1px solid var(--border-color);
        }

        .card-title {
            font-size: 1.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--border-color);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-gray);
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 16px;
            transition: border 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(108, 92, 231, 0.2);
        }

        .btn {
            padding: 12px 24px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #5d4fd1;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(108, 92, 231, 0.3);
        }

        .message {
            padding: 12px 20px;
            margin: 20px 0;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 6px;
            color: #155724;
            font-size: 15px;
        }

        .menu {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .menu a {
            color: var(--primary-color);
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 6px;
            background-color: var(--light-bg);
            transition: all 0.3s ease;
        }

        .menu a:hover {
            background-color: #e7e4ff;
        }

        @media (max-width: 768px) {
            .menu {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Registro de Usuario</h1>
        </div>

        <div class="card">
            <%-- Mostrar mensaje de éxito si existe --%>
            <% if (request.getAttribute("mensaje") != null) { %>
                <div class="message">
                    <%= request.getAttribute("mensaje") %>
                </div>
            <% } %>

            <%-- Formulario de registro que envía datos al servlet mediante POST --%>
            <form action="registro" method="POST">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required>
                </div>

                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" id="apellido" name="apellido" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn">Registrar</button>
                </div>
            </form>
        </div>

        <div class="menu">
            <a href="index.jsp">Volver a Inicio</a>
            <a href="consulta">Consultar Usuarios</a>
        </div>
    </div>
</body>
</html>
