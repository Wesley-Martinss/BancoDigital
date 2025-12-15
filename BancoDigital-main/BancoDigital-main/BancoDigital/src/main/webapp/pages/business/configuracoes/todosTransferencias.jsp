<%@page import="edu.br.ifsp.bank.modelo.Transferencia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.br.ifsp.bank.modelo.TipoUsuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.br.ifsp.bank.modelo.Pessoa" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IFSP Bank - Todas Transferências</title>
<base href="<%=request.getContextPath()%>/">
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/iconsite.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/todostransferencias.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
	<%
	    Pessoa usuarioLogado = (Pessoa) session.getAttribute("usuarioLogado");
		TipoUsuario role = (TipoUsuario) session.getAttribute("role");
		ArrayList<Transferencia> lista = (ArrayList<Transferencia>) request.getAttribute("todosTransferencias");
		
		double totalTransferido = 0;
		if (lista != null && !lista.isEmpty()) {
			for (Transferencia t : lista) {
				totalTransferido += t.getValor();
			}
		}
	%>

	<% if (usuarioLogado != null || role == TipoUsuario.ADMIN) { %>
	<div class="transferencias-wrapper">
		<div class="transferencias-container">
			<!-- Header -->
			<div class="transferencias-header">
				<a href="<%=request.getContextPath()%>/home" class="back-link">
					<i class="bi bi-arrow-left"></i>
					Voltar
				</a>
				<div class="header-content">
					<div class="header-icon">
						<i class="bi bi-arrow-left-right"></i>
					</div>
					<div>
						<h1 class="transferencias-title">Lista de Transferências</h1>
						<p class="transferencias-subtitle">Visualize todas as transações do sistema</p>
					</div>
				</div>
			</div>

			<% if (lista != null && !lista.isEmpty()) { %>
			<!-- KPIs -->
			<div class="row g-3 mb-4">
				<div class="col-md-6">
					<div class="kpi-card kpi-primary">
						<div class="kpi-icon">
							<i class="bi bi-list-ul"></i>
						</div>
						<div class="kpi-content">
							<div class="kpi-label">Total de Transferências</div>
							<div class="kpi-value"><%=lista.size()%></div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="kpi-card kpi-success">
						<div class="kpi-icon">
							<i class="bi bi-cash-stack"></i>
						</div>
						<div class="kpi-content">
							<div class="kpi-label">Volume Total</div>
							<div class="kpi-value">R$ <%=String.format("%.2f", totalTransferido)%></div>
						</div>
					</div>
				</div>
			</div>

			<!-- Table Card -->
			<div class="card table-card">
				<div class="card-body">
					<h5 class="card-title mb-4">
						<i class="bi bi-table me-2"></i>
						Todas as Transferências
					</h5>
					<div class="table-responsive">
						<table class="table transferencias-table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Quem Transferiu</th>
									<th>Quem Recebeu</th>
									<th>Horário</th>
									<th>Valor</th>
								</tr>
							</thead>
							<tbody>
							<% for (Transferencia t : lista) { %>
								<tr>
									<td>
										<span class="badge bg-primary">#<%=t.getId()%></span>
									</td>
									<td>
										<span class="user-id">ID: <%=t.getId_usuarioQueTransferiu()%></span>
									</td>
									<td>
										<span class="user-id">ID: <%=t.getId_usuarioQueRecebeu()%></span>
									</td>
									<td>
										<small><%=t.getHorario().toString().replace("T", " ")%></small>
									</td>
									<td>
										<strong class="valor-transferencia">R$ <%=String.format("%.2f", t.getValor())%></strong>
									</td>
								</tr>
							<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<% } else { %>
			<!-- Empty State -->
			<div class="card empty-card">
				<div class="card-body">
					<div class="empty-state">
						<i class="bi bi-inbox"></i>
						<h4>Nenhuma transferência encontrada</h4>
						<p>Não há transferências registradas no sistema.</p>
					</div>
				</div>
			</div>
			<% } %>

			<!-- Back Link -->
			<div class="back-section">
				<a href="<%=request.getContextPath()%>/home" class="back-main-link">
					<i class="bi bi-house-door me-2"></i>
					Voltar para home
				</a>
			</div>
		</div>
	</div>
	<% } %>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/todostransferencias.js"></script>
</body>
</html>