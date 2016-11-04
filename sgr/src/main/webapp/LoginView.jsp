<!DOCTYPE html>
<html lang="pt-BR">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>DI Gest�o</title>

  <!-- Bootstrap Core CSS -->
  <link href="Login/css/bootstrap.min.css" rel="stylesheet">

  <!--Botões do Facebook e Twitter-->
  <link href="Login/css/estiloIndex.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="Login/css/grayscale.css" rel="stylesheet">

  <!-- Fontes Customizadas -->
  <link href="Login/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

  <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
    <!-- Menu -->
        <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
          <div class="container">
            <div class="navbar-header">

              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                <i class="fa fa-bars"></i>
              </button>

              <a class="navbar-brand page-scroll" href="#page-top">
                <i class="glyphicon glyphicon-cutlery"></i> <span class="light">Di -</span> Gestão
              </a>

            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
              <ul class="nav navbar-nav">
                <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                <li class="hidden">
                  <a href="#page-top"></a>
                </li>

                <li>
                  <a class="page-scroll" href="#about">Sobre</a>
                </li>

                <li>
                  <a class="page-scroll" href="#contact">Contato</a>
                </li>

                <!--Criar conta-->
                
                <!--Login conta-->
                <li class="dropdown">
                  <!--Bot�o de Login-->
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-log-in"></span>
                    <b>Login</b>
                  </a>
                  <!--Lista para Baixo-->
                  <ul id="login-dp" class="dropdown-menu">
                    <li>
                      <div class="row">
                        <div class="col-md-12">
						<form>
                            <!--Login-->
                            <div class="form-group">
                              <label class="sr-only" for="Rodrigo">Login</label>
                              <input type="text" class="form-control" name="usuario" id="Login" placeholder="Login" required>
                            </div>

                            <!--Password-->
                            <div class="form-group">
                              <label class="sr-only" for="exampleInputPassword2">Password</label>
                              <input type="password" class="form-control" name="senha" id="exampleInputPassword2" placeholder="Password" required>
                              <!--Recuperar Senha-->
                              <div class="help-block text-right">
                                <a id="ou" href="#">Esqueceu sua senha?</a>
                              </div>
                              <div class="help-block text-right">
                              	<b>${msg}</b>
                              </div>
                            </div>

                            <!--BotÃ£o Login-->
                            <div class="form-group">
                              <button type="submit" class="btn btn-primary btn-block" name="operacao" value="entrar">Entrar</button>
                            </div>
                            <!--Checkbox Continuar Logado-->
                            <div class="checkbox">
                              <label id="ou"><input  type="checkbox"> Continuar logado</label>
                            </div>
                          </form>
                        </div>
                      </div>
                    </li>
                  </ul>
                </li>

              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container -->
        </nav>

        <!-- Intro Header -->
        <header class="intro">
          <div class="intro-body">
            <div class="container">
              <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <h1 class="brand-heading">Di - Gest�o</h1>
                  <p class="intro-text">Torne seu restaurante mais eficiente e produtivo de qualquer lugar do mundo.</p>
                  <a href="#about" class="btn btn-circle page-scroll">
                    <i class="fa fa-angle-double-down animated"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </header>

        <!-- Sobre -->
        <section id="about" class="container content-section text-center">
          <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
              <h2>Sobre o Di - Gest�o</h2>
              <p>Com a agilidade que os recursos <strong>Di - Gest�o</strong> oferecem, voc� e os membros de sua equipe podem se dedicar integralmente � satisfa��o do cliente, proporcionando uma experi�ncia ainda mais rica desde a entrada no restaurante at� o fechamento da conta. Conhe�a os benef�cios do nosso sistema de restaurante.</p>
              <p>Com o software para gest�o de restaurante <strong>Di - Gest�o</strong> voc� ter� informa��es e poder� utilizar os dados para faturar mais com os neg�cios e economizar com as despesas extras. Ao estudar os n�meros de seu restaurante, voc� tem uma boa perspectiva do seu volume de vendas e pode identificar as tend�ncias de seus pedidos!.</p>
            </div>
          </div>
        </section>

        <!-- Marcketing -->
        <section id="download" class="content-section text-center">
          <div class="download-section">
            <div class="container">
              <div class="col-lg-8 col-lg-offset-2">
                <div class="alert alert-warning" role="alert">
                  <h2>Um sistema 100 % web que proporciona beneficios �nicos</h2>
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- Contato -->
        <section id="contact" class="container content-section text-center">
          <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
              <h2>Contate-nos pelas Redes Sociais</h2>
              <p>No caso de alguma d�vida, entre em contato conosco pelo e-mail ou em alguma de nossas redes sociais</p>
              <p><a href="mailto:contato@digestao.com">contato@digestao.com</a>
              </p>
              <ul class="list-inline banner-social-buttons">
                <li>
                  <a href="#" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                </li>
                <li>
                  <a href="#" class="btn btn-default btn-lg"><i class="fa fa-facebook fa-fw"></i> <span class="network-name">Facebook</span></a>
                </li>
                <li>
                  <a href="#" class="btn btn-default btn-lg"><i class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
                </li>
              </ul>
              <br><br><br><br><br><br><br>
            </div>
          </div>
        </section>

        <!-- RodapÃ© -->
        <footer>
          <div class="container">
            <address>
            <strong>DIGESTÃO </strong><br>
                Rua imagin�ria, 701-704<br>
                74593-595<br>
                Goi�nia - Brasil<br>
                <abbr>P:</abbr> +55 062 3546-5411
           </address>
          </div>
        </footer>
  

        <!-- jQuery -->

        <script src="Login/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="Login/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="Login/js/jquery.easing.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="Login/js/grayscale.js"></script>
  </body>

</html>