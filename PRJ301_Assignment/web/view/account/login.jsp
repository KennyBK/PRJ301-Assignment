<%-- 
    Document   : login
    Created on : Jul 15, 2022, 12:22:44 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> 
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">
        <script>
            function logout() {
                window.location.href = 'logout';
            }
        </script>
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                text-rendering : optimizeLegibility;
                -webkit-font-smoothing : antialiased;
            }


            #login-bg.container-fluid {
                padding: 0;
                height: 100%;
                position: absolute;
            }

            /* Background image an color divs*/

            .bg-color {
                min-width: 50%;
                vertical-align: top;
                padding: 0;
                margin-left: 0;
                height: 100%;
                background-color: #ef7029;
                display: inline-block;
                overflow: hidden;
            }

            .bg-color {
                margin-left: -5px;
            }

            #login{
                padding-top: 10%;
                text-align: center;
                text-transform: uppercase;
            }


            .login {
                width: 100%;
                height: 500px;
                background-color: #f7f7f7 ;
                padding: 15px;
                padding-top: 30px;
            }

            .login h1 {
                margin-top: 30px;
                font-weight: bold;
                font-size: 60px;
                letter-spacing: 3px;
            }

            .login form {
                max-width: 420px;
                margin: 30px auto;
            }

            .login .btn {
                border-radius: 50px;
                text-transform: uppercase;
                font-weight: bold;
                letter-spacing: 2px;
                font-size: 20px;
                padding: 14px;
                background-color: #00B72E;
            }

            .form-group input {
                font-size: 20px;
                font-weight: lighter;
                border: none;
                background-color: #F0F0F0;
                color: #465347!important;
                padding: 26px 30px;
                border-radius: 50px;
                transition : 0.2s;
            }




            /* Form check styles*/

            .form-check {
                padding: 0;
                text-align: left;
            }

            .form-check label {
                vertical-align: top;
                padding-top: 5px;
                padding-left: 5px;
                font-size: 15px;
                color: #606060;
                font-size: 14px;
            }
            input:checked + .slider {
                background-color: #00B72E;
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #00B72E;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(30px);
                -ms-transform: translateX(30px);
                transform: translateX(30px);
            }



            /* Media queries */

            @media(max-width: 500px) {
                .bg-img , .bg-color {
                    min-width: 100%;
                    height: 50%;
                    margin: 0;
                }

                .forgot-password {
                    text-align: right;
                    float: left;
                    padding: 20px 0;
                }


                #login {
                    padding-top: 50px;
                }

            }
        </style>
    </head>
    <body>
        <div id="login-bg" class="container-fluid">

            <div class="bg-img"></div>
            <div class="bg-color"></div>
        </div>
        <div class="container" id="login">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="login">

                        <h1>Login</h1>

                        <!-- Loging form -->
                        <form action="login" method="POST">
                            <div class="form-group">
                                <input type="text" name="user" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div style="color: red">
                                ${requestScope.mess}
                            </div>
                            <br>
                            <button type="submit" class="btn btn-lg btn-block btn-success">Sign in</button>
                        </form>
                        <!-- End Loging form -->

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
