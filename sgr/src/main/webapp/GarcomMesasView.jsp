<!DOCTYPE html>
<%@page import="sgr.Mesas"%>
<%@page import="sgr.ExibirComanda"%>
<%@page import="sgr.InformacoesMesa"%>
<%@page import="sgr.GarcomMesasDao"%>
<%@page import="sgr.MesaAuxiliar"%>
<%@page import="sgr.PedidoAndamento"%>
<%@page import="sgr.Comanda"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Di-Gest�o - Mesas</title>

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

	<script src="js/sscript.js"></script>
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
                <a class="navbar-brand" href="garcom_mesas">Di-Gest�o - Gar�om</a>
            </div>
            <!-- /.navbar-header -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">

                        <li>
                            <a href="garcom_mesas"><i class="glyphicon glyphicon-cutlery"></i> Mesas</a>
                        </li>
                        <li>
                        	<a href="logout"><i class="fa fa-times-circle"></i> Sair</a>
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
										<div class="tab-pane fade <% if ( request.getAttribute("codigo_comanda") == null || Integer.parseInt(request.getAttribute("comanda_mesa").toString()) != m.getNum_mesa() ) out.write("in active"); %>" id="<%=m.getNum_mesa() %>">
											<div class="col-xs-3">
												<i class="glyphicon glyphicon-cutlery fa-3x"></i>
											</div>
											<div class="col-xs-6">
												<div><%=m.getStatus() %></div>
											</div>
											<div class="col-xs-3 text-right">
												Mesa<div class="huge"><%=m.getNum_mesa()%></div>
											</div>
										</div>
										<div class="tab-pane fade <% if ( request.getAttribute("codigo_comanda") != null && Integer.parseInt(request.getAttribute("comanda_mesa").toString()) == m.getNum_mesa() ) out.write("in active"); %>" id="-<%=m.getNum_mesa()%>">
											<div class="col-xs-12">
                                                ${codigo_comanda}<br> 
												<!-- Numero da Comanda -->
                                                ${nome_garcom}<br>
                                                <strong>Aguardando:</strong><br>
                                                <ul>
                                                  <%List<PedidoAndamento> listPedidosAndamento = (List<PedidoAndamento>) request.getAttribute("aguardando"); 
                                                	if(listPedidosAndamento != null && !listPedidosAndamento.isEmpty()) {
                                                		for (PedidoAndamento p : listPedidosAndamento) {
                                                	
                                                %>
                                                    <li><%=p.getNome_Prod() %></li>   
                                                <%}} %>                                                     
                                                </ul>
											</div>
										</div>
									</div>
                                </div>
                            </div>
                                <div class="panel-footer">
									<ul class="nav nav-pills" id="myTab">
                                        <%if(m.getStatus().equals("Livre")) {%>
                                        <!-- Nova Comanda -->
                                        <li>
                                        	<button onclick="modal_nova_comanda(<%=m.getNum_mesa() %>)">Nova_Comanda</button>
                                        </li>
                                        <%} else {%>
                                        <!-- Informa��es Gerais da Mesa -->
                                        <li>
                                            <button href="#<%=m.getNum_mesa() %>" data-toggle="tab" class="btn btn-primary"><i class="fa fa-home"></i></button>
                                        </li>
                                        <!-- Informa��es mais detalhadas -->
                                        <li>
                                            <button onclick="modal_informacoes_garcom(<%=m.getNum_mesa() %>)" data-toggle="tab" data-target="#-<%=m.getNum_mesa()%>" class="btn btn-primary"><i class="fa fa-info-circle"></i></button>
                                        </li>
                                        <!-- Comanda -->
                                        <%List<ExibirComanda> exibirComandaAbertas = (List<ExibirComanda>) request.getAttribute("exibirComanda");
                                        	if(exibirComandaAbertas != null && !exibirComandaAbertas.isEmpty()) {
                                        		for(ExibirComanda ec : exibirComandaAbertas) {
                                        			if(ec.getCodigo()==m.getNum_mesa()) {
                                        			%>
	                                        			<li>
	                                            			<button onclick="modal_comanda(<%=m.getNum_mesa() %>)"><i class="fa fa-list-alt"></i></button>
	                                        			</li>
                                        		<%}
                                        		}
                                        	}%>
                                        
                                        <%} %>
                                    </ul>
                                </div>
                               
                        </div>
                    </div>
                <%}} %>
          </div>

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
