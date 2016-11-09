<!DOCTYPE html>
<%@page import="sgr.Mesas"%>
<%@page import="sgr.InformacoesMesa"%>
<%@page import="sgr.GarcomMesasDao"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Di-Gestão - Mesas</title>

    <!-- Bootstrap Core CSS -->
    <link href="Garcom-Mesas/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="Garcom-Mesas/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="Garcom-Mesas/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="Garcom-Mesas/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="garcom_mesas">Di-Gestão - Garçom</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> Matheus  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Perfil</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Configurações</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Sair</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">

                        <li>
                            <a href="garcom_mesas"><i class="glyphicon glyphicon-cutlery"></i> Mesas</a>
                        </li>
                        <li>
                            <!-- Button trigger modal -->
                            <a href="#" data-toggle="modal" data-target="#gerente"><i class="fa fa-times-circle"></i> Chamar Gerente</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Mesas</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                
                <!-- /.row -->
                <div class="row">
					<%List<Mesas> mesas = (List<Mesas>) request.getAttribute("mesas"); 
						if(mesas != null && !mesas.isEmpty()) {
							for (Mesas m : mesas) {
					%>
					<div class="col-lg-3 col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
									<div class="tab-content">
										<div class="tab-pane fade in active" id="<%=m.getNum_mesa() %>">
											<div class="col-xs-3">
												<i class="glyphicon glyphicon-cutlery fa-3x"></i>
											</div>
											<div class="col-xs-6">
												<div><%=m.getStatus() %></div>
											</div>
											<div class="col-xs-3 text-right">
												Mesa<div class="huge"><%=m.getNum_mesa() %></div>
											</div>
										</div>
										<div class="tab-pane fade" id="-<%=m.getNum_mesa()%>">
											<div class="col-xs-12">
                                                ${codigo_comanda}<br> 
												<!-- Numero da Comanda -->
                                                ${nome_garcom}<br>
                                                <strong>Aguardando:</strong><br>
                                                <ul>
                                                    <li>Lasanha</li>
                                                    <li>Porção de Batatas</li>
                                                    <li>Porção de Costela</li>
                                                </ul>
											</div>
										</div>
									</div>
                                </div>
                            </div>
                                <div class="panel-footer">
									<ul class="nav nav-pills">
                                        <!-- Informações Gerais da Mesa -->
                                        <li>
                                            <button href="#<%=m.getNum_mesa() %>" data-toggle="tab" class="btn btn-primary"><i class="fa fa-home"></i></button>
                                        </li>
                                        <!-- Informações mais detalhadas -->
                                        <li>
                                            <button href="#-<%=m.getNum_mesa() %>" data-toggle="tab" class="btn btn-primary"><i class="fa fa-info-circle"></i></button>
                                        </li>
                                        <!-- Comanda -->
                                        <li>
                                            <button href="#" data-toggle="modal" data-target="#comanda<%=m.getNum_mesa() %>" class="btn btn-primary"><i class="fa fa-list-alt"></i></button>
                                        </li>
                                        <!-- Novo Pedido -->
                                        <!--<li>
                                            <button href="#" data-toggle="tab" class="btn btn-info" ><i class="fa fa-plus-circle"></i></button>
                                        </li>
                                        <!-- Encerrar Comanda/Pagamento -->
                                        <!--<li>
                                            <button href="#" data-toggle="tab" class="btn btn-success" ><i class="fa fa-money"></i></button>
                                        </li>-->
                                    </ul>
                                </div>
                        </div>
                    </div>
                    <%}} %>
                </div>
                <!-- /.row -->

              <!-- Modal (Chamar Gerente) -->
                <div class="modal fade" id="gerente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel">Chamar Gerente</h4>
                            </div>
                            <form>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-xs-8">

                                            <div class="form-group">
                                                <label>Selecione o Gerente:</label>
                                                <select class="form-control">
                                                    <option>Gabriella</option>
                                                    <option>Rodrigo</option>
                                                    <option>Pedro</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group">
                                                <label>Numero da Mesa</label>
                                                <input type="number" min="1" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                                    <button type="submit" class="btn btn-primary" data-dismiss="modal">Chamar Gerente</button>
                                </div>
                            </form>    
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->  
                

                <!-- Modal (Visualizar Comanda) -->
                <div class="modal fade" id="comanda" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel">Visualizar Comanda Nº: X Mesa Nº: Y</h4>
                            </div>
                            <form>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Nome</th>
                                                            <th>Preço</th>
                                                            <th>Quantidade</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>22</td>
                                                            <td>Coca 2L</td>
                                                            <td>6,00</td>
                                                            <td>03</td>
                                                            <td>Entregue</td>
                                                        </tr>
                                                        <tr>
                                                            <td>12</td>
                                                            <td>Lasanha</td>
                                                            <td>14,20</td>
                                                            <td>01</td>
                                                            <td>Aguardando</td>
                                                        </tr>
                                                        <tr>
                                                            <td>06</td>
                                                            <td>Porção de Batatas</td>
                                                            <td>19,90</td>
                                                            <td>01</td>
                                                            <td>Aguardando</td>
                                                        </tr>
                                                        <tr>
                                                            <td>07</td>
                                                            <td>Porção de Costela</td>
                                                            <td>21,90</td>
                                                            <td>02</td>
                                                            <td>Aguardando</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <table class="table table-hover">
                                                    <tr>
                                                        <th>TOTAL</th>
                                                        <td>256,14</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <ul class="nav nav-pills">
                                        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times-circle"></i>  Fechar</button>
                                        <button type="button" class="btn btn-info" data-dismiss="modal"><i class="fa fa-plus-circle"></i>  Novo Pedido</button>
                                        <button type="button" class="btn btn-success " data-dismiss="modal"><i class="fa fa-money"></i>  Fechar Comanda</button>
                                    </ul>
                                </div>
                            </form>    
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal --> 




        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="Garcom-Mesas/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Garcom-Mesas/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="Garcom-Mesas/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="Garcom-Mesas/dist/js/sb-admin-2.js"></script>

</body>

</html>
