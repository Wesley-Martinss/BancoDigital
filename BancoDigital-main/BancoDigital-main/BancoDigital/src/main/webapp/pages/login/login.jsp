<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IFSP Bank - Login</title>
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/iconsite.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/login.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
	<div class="login-wrapper">
		<!-- Left Side - Image/Branding -->
		<div class="login-left">
			<div class="brand-content">
				<div class="brand-icon">
					<i class="bi bi-bank2"></i>
				</div>
				<h1 class="brand-title">IFSP Bank</h1>
				<p class="brand-subtitle">Seu banco digital completo</p>
				<div class="features">
					<div class="feature-item">
						<i class="bi bi-shield-check"></i>
						<span>Segurança de ponta</span>
					</div>
					<div class="feature-item">
						<i class="bi bi-clock"></i>
						<span>Disponível 24/7</span>
					</div>
					<div class="feature-item">
						<i class="bi bi-graph-up-arrow"></i>
						<span>Investimentos inteligentes</span>
					</div>
				</div>
			</div>
		</div>

		<!-- Right Side - Login Form -->
		<div class="login-right">
			<div class="login-container">
				<div class="login-header">
					<h2 class="login-title">Bem-vindo de volta</h2>
					<p class="login-subtitle">Entre com suas credenciais para acessar sua conta</p>
				</div>

				<%
				if (request.getAttribute("error") != null) {
				%>
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					<i class="bi bi-exclamation-triangle-fill me-2"></i>
					<strong>Erro!</strong> Nome de usuário e senha inválidos.
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				<%
				}
				%>

				<form action="<%=request.getContextPath()%>/login" method="post" class="login-form">
					<div class="form-group mb-4">
						<label for="user" class="form-label">
							<i class="bi bi-person-fill me-2"></i>Usuário
						</label>
						<input 
							type="text" 
							class="form-control form-control-lg" 
							id="user" 
							name="user" 
							required
							placeholder="Digite seu usuário"
							autocomplete="username">
					</div>

					<div class="form-group mb-4">
						<label for="password" class="form-label">
							<i class="bi bi-lock-fill me-2"></i>Senha
						</label>
						<div class="password-wrapper">
							<input 
								type="password" 
								class="form-control form-control-lg" 
								id="password" 
								name="password" 
								required
								placeholder="Digite sua senha"
								autocomplete="current-password">
							<button type="button" class="password-toggle" id="togglePassword">
								<i class="bi bi-eye-fill"></i>
							</button>
						</div>
					</div>

					<%
					if (request.getParameter("next") != null) {
					%>
					<input type="hidden" name="next" value="<%=request.getParameter("next")%>">
					<%
					}
					%>

					<button type="submit" class="btn btn-primary btn-lg w-100 mb-4">
						<i class="bi bi-box-arrow-in-right me-2"></i>Entrar
					</button>

					<div class="divider">
						<span>ou</span>
					</div>

					<div class="signup-link">
						<p>Não tem uma conta? 
							<a href="<%=request.getContextPath()%>/pessoa/cadastrar" class="link-primary">
								Crie uma conta
								<i class="bi bi-arrow-right ms-1"></i>
							</a>
						</p>
					</div>
				</form>
			</div>

			<footer class="login-footer">
				<p>&copy; 2024 IFSP Bank. Todos os direitos reservados.</p>
			</footer>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/login.js"></script>
</body>
</html>