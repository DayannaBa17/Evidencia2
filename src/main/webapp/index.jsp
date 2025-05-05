<%-- 
    Document   : index
    Created on : 5/05/2025, 7:35:04 a. m.
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            max-width: 1000px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .header {
            background: var(--primary-gradient);
            color: white;
            padding: 20px 0;
            margin-bottom: 30px;
            text-align: center;
            border-radius: 0 0 10px 10px;
            box-shadow: var(--shadow);
        }

        .header h1 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .menu {
            display: flex;
            gap: 15px;
            margin: 25px 0;
            justify-content: center;
        }

        .menu a {
            padding: 12px 20px;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: var(--shadow);
        }

        .menu a:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(108, 92, 231, 0.3);
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

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-gray);
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 16px;
            transition: border 0.3s ease;
        }

        .form-control:focus {
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

        .footer-nav {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 40px;
            margin-bottom: 30px;
        }

        .nav-link {
            color: var(--primary-color);
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 6px;
            background-color: var(--light-bg);
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background-color: #e7e4ff;
        }

        hr {
            border: none;
            height: 1px;
            background-color: var(--border-color);
            margin: 30px 0;
        }

        @media (max-width: 768px) {
            .menu {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="container">
            <h1>Registro de Usuario</h1>
        </div>
    </div>

    <div class="container">
        <div class="card">
            <h2 class="card-title">Crear una nueva cuenta</h2>
            <form action="#" method="post">
                <div class="form-group">
                    <label class="form-label" for="nombre">Nombre completo:</label>
                    <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Ingrese su nombre completo" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="email">Correo electrónico:</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Ingrese su correo electrónico" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Ingrese su contraseña" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="confirmar">Confirmar contraseña:</label>
                    <input type="password" id="confirmar" name="confirmar" class="form-control" placeholder="Confirme su contraseña" required>
                </div>
                <button type="submit" class="btn">Registrar</button>
            </form>
        </div>

        <div class="footer-nav">
            <a href="#" class="nav-link">Volver a Inicio</a>
            <a href="#" class="nav-link">Consultar Usuarios</a>
        </div>
    </div>
</body>
</html>