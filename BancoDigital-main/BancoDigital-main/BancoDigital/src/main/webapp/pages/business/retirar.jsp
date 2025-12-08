<%@page import="edu.br.ifsp.bank.modelo.Pessoa"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IFSP Bank - Retirar</title>
<base href="<%=request.getContextPath()%>/">
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/iconsite.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/retirar.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>

<%
    Pessoa usuarioLogado = (Pessoa) session.getAttribute("usuarioLogado");
    String erro = (String) request.getAttribute("erro");
    String sucesso = (String) request.getAttribute("sucesso");
%>

<body>
	<div class="retirar-wrapper">
		<div class="retirar-container">
			<!-- Header -->
			<div class="retirar-header">
				<a href="<%=request.getContextPath()%>/home" class="back-link">
					<i class="bi bi-arrow-left"></i>
					Voltar
				</a>
				<div class="header-content">
					<div class="header-icon">
						<i class="bi bi-wallet2"></i>
					</div>
					<div>
						<h1 class="retirar-title">Retirada</h1>
						<p class="retirar-subtitle">Saque dinheiro da sua conta</p>
					</div>
				</div>
			</div>

			<!-- Messages -->
			<% if (erro != null) { %>
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<i class="bi bi-exclamation-triangle-fill me-2"></i>
				<strong>Erro!</strong> <%=erro%>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			<% } %>

			<% if (sucesso != null) { %>
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<i class="bi bi-check-circle-fill me-2"></i>
				<strong>Sucesso!</strong> <%=sucesso%>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			<% } %>

			<!-- Saldo Card -->
			<div class="card saldo-card">
				<div class="card-body">
					<div class="saldo-info">
						<div class="saldo-label">
							<i class="bi bi-wallet2 me-2"></i>
							Saldo disponível
						</div>
						<div class="saldo-value">
							R$ <%=String.format("%.2f", usuarioLogado.getSaldo())%>
						</div>
					</div>
				</div>
			</div>

			<!-- Withdraw Form -->
			<div class="card retirar-card">
				<div class="card-body">
					<form action="<%=request.getContextPath()%>/pessoa/retirar" method="post" id="withdrawForm">
						<div class="form-group mb-4">
							<label for="valor" class="form-label">
								<i class="bi bi-cash-stack me-2"></i>
								Digite o valor que deseja retirar
							</label>
							<div class="input-group input-group-lg">
								<span class="input-group-text">R$</span>
								<input 
									type="number" 
									class="form-control" 
									id="valor"
									name="valor" 
									step="0.01" 
									min="0.01"
									placeholder="0,00"
									required>
							</div>
							<div class="form-text">
								<i class="bi bi-info-circle me-1"></i>
								O valor será debitado instantaneamente da sua conta
							</div>
						</div>

						<input type="hidden" name="cpf" value="<%=usuarioLogado.getCpf()%>">

						<button type="submit" class="btn btn-primary btn-lg w-100">
							<i class="bi bi-check-circle me-2"></i>Confirmar
						</button>
					</form>
				</div>
			</div>

			<!-- Info Card -->
			<div class="card info-card">
				<div class="card-body">
					<div class="info-item">
						<i class="bi bi-lightning-charge-fill"></i>
						<div>
							<strong>Saque instantâneo</strong>
							<p>O valor é debitado imediatamente</p>
						</div>
					</div>
					<div class="info-item">
						<i class="bi bi-shield-check"></i>
						<div>
							<strong>100% seguro</strong>
							<p>Transação protegida e criptografada</p>
						</div>
					</div>
					<div class="info-item">
						<i class="bi bi-clock-history"></i>
						<div>
							<strong>Disponível 24/7</strong>
							<p>Faça saques a qualquer momento</p>
						</div>
					</div>
				</div>
			</div>

			<!-- Back Link -->
			<div class="back-section">
				<a href="<%=request.getContextPath()%>/home" class="back-main-link">
					<i class="bi bi-house-door me-2"></i>
					Voltar para a página principal
				</a>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/retirar.js"></script>
</body>
</html>