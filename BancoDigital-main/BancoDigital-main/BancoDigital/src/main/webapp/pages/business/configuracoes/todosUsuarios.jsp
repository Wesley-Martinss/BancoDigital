<%@page import="java.util.ArrayList"%>
<%@page import="edu.br.ifsp.bank.modelo.TipoUsuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.br.ifsp.bank.modelo.Pessoa" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IFSP Bank - Todos Usuários</title>
<base href="<%=request.getContextPath()%>/">
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/iconsite.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/todosusuarios.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
	<%
	    Pessoa usuarioLogado = (Pessoa) session.getAttribute("usuarioLogado");
		TipoUsuario role = (TipoUsuario) session.getAttribute("role");
		ArrayList<Pessoa> lista = (ArrayList<Pessoa>) request.getAttribute("todosUsuarios");
		
		double saldoTotal = 0;
		int usuariosAtivos = 0;
		
		if (lista != null && !lista.isEmpty()) {
			usuariosAtivos = lista.size(); // Ajuste: Considera todos da lista como ativos
			for (Pessoa p : lista) {
				saldoTotal += p.getSaldo();
				// Removido o if (p.isHabilitado()) pois o método não existe
			}
		}
	%>

	<% if (usuarioLogado != null || role == TipoUsuario.ADMIN) { %>
	<div class="usuarios-wrapper">
		<div class="usuarios-container">
			<div class="usuarios-header">
				<a href="<%=request.getContextPath()%>/home" class="back-link">
					<i class="bi bi-arrow-left"></i>
					Voltar
				</a>
				<div class="header-content">
					<div class="header-icon">
						<i class="bi bi-people"></i>
					</div>
					<div>
						<h1 class="usuarios-title">Lista de Usuários</h1>
						<p class="usuarios-subtitle">Visualize todos os usuários do sistema</p>
					</div>
				</div>
			</div>

			<% if (lista != null && !lista.isEmpty()) { %>
			<div class="row g-3 mb-4">
				<div class="col-md-4">
					<div class="kpi-card kpi-primary">
						<div class="kpi-icon">
							<i class="bi bi-people-fill"></i>
						</div>
						<div class="kpi-content">
							<div class="kpi-label">Total de Usuários</div>
							<div class="kpi-value"><%=lista.size()%></div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="kpi-card kpi-success">
						<div class="kpi-icon">
							<i class="bi bi-check-circle-fill"></i>
						</div>
						<div class="kpi-content">
							<div class="kpi-label">Usuários Listados</div>
							<div class="kpi-value"><%=usuariosAtivos%></div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="kpi-card kpi-info">
						<div class="kpi-icon">
							<i class="bi bi-cash-stack"></i>
						</div>
						<div class="kpi-content">
							<div class="kpi-label">Saldo Total</div>
							<div class="kpi-value">R$ <%=String.format("%.2f", saldoTotal)%></div>
						</div>
					</div>
				</div>
			</div>

			<div class="card table-card">
				<div class="card-body">
					<h5 class="card-title mb-4">
						<i class="bi bi-table me-2"></i>
						Todos os Usuários
					</h5>
					<div class="table-responsive">
						<table class="table usuarios-table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Nome</th>
									<th>CPF</th>
									<th>Email</th>
									<th>Saldo</th>
									<th>Role</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
							<% for (Pessoa p : lista) { %>
								<tr>
									<td>
										<span class="badge bg-primary">#<%=p.getId()%></span>
									</td>
									<td>
										<div class="user-info">
											<div class="user-avatar">
												<%=p.getNome().substring(0, 1).toUpperCase()%>
											</div>
											<span><%=p.getNome()%></span>
										</div>
									</td>
									<td><strong><%=p.getCpf()%></strong></td>
									<td><%=p.getEmail()%></td>
									<td><strong class="saldo-value">R$ <%=String.format("%.2f", p.getSaldo())%></strong></td>
									<td>
										<span class="badge role-badge role-<%=p.getRole().name().toLowerCase()%>">
											<%=p.getRole().name()%>
										</span>
									</td>
									<td>
										<span class="badge bg-success">
											<i class="bi bi-check-circle me-1"></i>Ativo
										</span>
									</td>
								</tr>
							<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<% } else { %>
			<div class="card empty-card">
				<div class="card-body">
					<div class="empty-state">
						<i class="bi bi-inbox"></i>
						<h4>Nenhum usuário encontrado</h4>
						<p>Não há usuários registrados no sistema.</p>
					</div>
				</div>
			</div>
			<% } %>

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
	<script src="<%=request.getContextPath()%>/assets/js/todosusuarios.js"></script>
</body>
</html>