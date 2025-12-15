<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Boolean podeIrSenhaNova = (Boolean) request.getAttribute("podeIrSenhaNova");
    if (podeIrSenhaNova == null) podeIrSenhaNova = false;
    String erro = (String) request.getAttribute("erro");
    String sucesso = (String) request.getAttribute("sucesso");
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IFSP Bank - Trocar Senha</title>
<base href="<%=request.getContextPath()%>/">
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/iconsite.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/trocarsenha.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
	<div class="trocarsenha-wrapper">
		<div class="trocarsenha-container">
			<!-- Header -->
			<div class="trocarsenha-header">
				<div class="security-icon">
					<i class="bi bi-shield-lock"></i>
				</div>
				<h1 class="trocarsenha-title">Banco Digital IFSP</h1>
				<h2 class="trocarsenha-subtitle">Trocar Senha</h2>
			</div>

			<!-- Messages -->
			<% if (erro != null) { %>
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<i class="bi bi-exclamation-triangle-fill me-2"></i>
				<strong>Erro!</strong> <%=erro%>
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
			<% } %>

			<% if (sucesso != null) { %>
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<i class="bi bi-check-circle-fill me-2"></i>
				<strong>Sucesso!</strong> <%=sucesso%>
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
			<% } %>

			<!-- Form Card -->
			<div class="card form-card">
				<div class="card-body">
					<% if (podeIrSenhaNova == true) { %>
					<!-- Nova Senha Form -->
					<form action="<%=request.getContextPath()%>/pessoa/trocarsenha" method="post" id="passwordForm">
						<input type="hidden" name="id" value="<%=request.getAttribute("id")%>">
						<input type="hidden" name="codigo" value="<%=request.getAttribute("codigo")%>">

						<div class="form-group mb-4">
							<label for="senhaNova" class="form-label">
								<i class="bi bi-lock-fill me-2"></i>Nova Senha
							</label>
							<div class="password-wrapper">
								<input 
									type="password" 
									class="form-control form-control-lg" 
									id="senhaNova" 
									name="senhaNova" 
									required 
									placeholder="Digite a nova senha"
									minlength="6">
								<button type="button" class="password-toggle" id="togglePassword">
									<i class="bi bi-eye-fill"></i>
								</button>
							</div>
							<div class="password-strength" id="passwordStrength">
								<div class="strength-bar">
									<div class="strength-progress"></div>
								</div>
								<small class="strength-text">Força da senha: <span>-</span></small>
							</div>
						</div>

						<button type="submit" class="btn btn-primary btn-lg w-100">
							<i class="bi bi-check-circle me-2"></i>Confirmar troca
						</button>
					</form>
					<% } else { %>
					<!-- Senha Antiga Form -->
					<form action="<%=request.getContextPath()%>/pessoa/trocarsenha" method="post" id="passwordForm">
						<input type="hidden" name="id" value="<%=request.getAttribute("id")%>">
						<input type="hidden" name="codigo" value="<%=request.getAttribute("codigo")%>">

						<div class="form-group mb-4">
							<label for="senhaAntiga" class="form-label">
								<i class="bi bi-lock-fill me-2"></i>Senha Antiga
							</label>
							<div class="password-wrapper">
								<input 
									type="password" 
									class="form-control form-control-lg" 
									id="senhaAntiga" 
									name="senhaAntiga" 
									required 
									placeholder="Digite a senha antiga">
								<button type="button" class="password-toggle" id="togglePassword">
									<i class="bi bi-eye-fill"></i>
								</button>
							</div>
						</div>

						<button type="submit" class="btn btn-primary btn-lg w-100">
							<i class="bi bi-check-circle me-2"></i>Confirmar troca
						</button>
					</form>
					<% } %>
				</div>
			</div>

			<!-- Security Info -->
			<div class="security-info">
				<i class="bi bi-info-circle me-2"></i>
				<small>Sua senha deve ter no mínimo 6 caracteres para maior segurança.</small>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/trocarsenha.js"></script>
</body>
</html>