<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IFSP Bank - Cadastro</title>
<base href="<%=request.getContextPath()%>/">
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/iconsite.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/cadastrar.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
	<div class="cadastro-wrapper">
		<!-- Left Side - Image/Branding -->
		<div class="cadastro-left">
			<div class="brand-content">
				<div class="brand-icon">
					<i class="bi bi-bank2"></i>
				</div>
				<h1 class="brand-title">IFSP Bank</h1>
				<p class="brand-subtitle">Abra sua conta digital em minutos</p>
				<div class="features">
					<div class="feature-item">
						<i class="bi bi-check-circle-fill"></i>
						<span>Conta 100% gratuita</span>
					</div>
					<div class="feature-item">
						<i class="bi bi-check-circle-fill"></i>
						<span>Sem tarifas mensais</span>
					</div>
					<div class="feature-item">
						<i class="bi bi-check-circle-fill"></i>
						<span>Cartão de crédito grátis</span>
					</div>
					<div class="feature-item">
						<i class="bi bi-check-circle-fill"></i>
						<span>Aprovação instantânea</span>
					</div>
				</div>
			</div>
		</div>

		<!-- Right Side - Signup Form -->
		<div class="cadastro-right">
			<div class="cadastro-container">
				<div class="cadastro-header">
					<a href="pages/login/login.jsp" class="back-link">
						<i class="bi bi-arrow-left"></i>
						Voltar para login
					</a>
					<h2 class="cadastro-title">Crie sua conta</h2>
					<p class="cadastro-subtitle">Preencha seus dados para começar</p>
				</div>

				<%
				if (request.getAttribute("error") != null) {
				%>
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					<i class="bi bi-exclamation-triangle-fill me-2"></i>
					<strong>Erro!</strong> <%=request.getAttribute("error")%>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				<%
				}
				%>

				<%
				if (request.getAttribute("success") != null) {
				%>
				<div class="alert alert-success alert-dismissible fade show" role="alert">
					<i class="bi bi-check-circle-fill me-2"></i>
					<strong>Sucesso!</strong> <%=request.getAttribute("success")%>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				<%
				}
				%>

				<form action="pessoa/cadastrar" method="post" class="cadastro-form" id="cadastroForm">
					<div class="row g-4">
						<!-- Nome Completo -->
						<div class="col-12">
							<div class="form-group">
								<label for="nome" class="form-label">
									<i class="bi bi-person-fill me-2"></i>Nome Completo
								</label>
								<input 
									type="text" 
									class="form-control form-control-lg" 
									id="nome" 
									name="nome" 
									required
									placeholder="Digite seu nome completo">
								<div class="invalid-feedback">
									Por favor, insira seu nome completo.
								</div>
							</div>
						</div>

						<!-- CPF -->
						<div class="col-md-6">
							<div class="form-group">
								<label for="cpf" class="form-label">
									<i class="bi bi-card-text me-2"></i>CPF
								</label>
								<input 
									type="text" 
									class="form-control form-control-lg" 
									id="cpf" 
									name="cpf" 
									required
									placeholder="000.000.000-00"
									maxlength="14">
								<div class="invalid-feedback">
									Por favor, insira um CPF válido.
								</div>
							</div>
						</div>

						<!-- Telefone -->
						<div class="col-md-6">
							<div class="form-group">
								<label for="telefone" class="form-label">
									<i class="bi bi-telephone-fill me-2"></i>Telefone
								</label>
								<input 
									type="tel" 
									class="form-control form-control-lg" 
									id="telefone" 
									name="telefone" 
									required
									placeholder="(00) 00000-0000"
									maxlength="15">
								<div class="invalid-feedback">
									Por favor, insira um telefone válido.
								</div>
							</div>
						</div>

						<!-- Email -->
						<div class="col-12">
							<div class="form-group">
								<label for="email" class="form-label">
									<i class="bi bi-envelope-fill me-2"></i>E-mail
								</label>
								<input 
									type="email" 
									class="form-control form-control-lg" 
									id="email" 
									name="email" 
									required
									placeholder="seu@email.com">
								<div class="invalid-feedback">
									Por favor, insira um e-mail válido.
								</div>
							</div>
						</div>

						<!-- Endereço -->
						<div class="col-12">
							<div class="form-group">
								<label for="endereco" class="form-label">
									<i class="bi bi-geo-alt-fill me-2"></i>Endereço
								</label>
								<input 
									type="text" 
									class="form-control form-control-lg" 
									id="endereco" 
									name="endereco" 
									required
									placeholder="Digite seu endereço completo">
								<div class="invalid-feedback">
									Por favor, insira seu endereço.
								</div>
							</div>
						</div>

						<!-- Senha -->
						<div class="col-12">
							<div class="form-group">
								<label for="senha" class="form-label">
									<i class="bi bi-lock-fill me-2"></i>Senha
								</label>
								<div class="password-wrapper">
									<input 
										type="password" 
										class="form-control form-control-lg" 
										id="senha" 
										name="senha" 
										required
										placeholder="Digite sua senha">
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
								<div class="invalid-feedback">
									Por favor, insira uma senha.
								</div>
							</div>
						</div>

						<!-- Termos -->
						<div class="col-12">
							<div class="form-check">
								<input 
									class="form-check-input" 
									type="checkbox" 
									id="termos">
								<label class="form-check-label" for="termos">
									Li e aceito os <a href="#" class="link-primary">termos de uso</a> e a 
									<a href="#" class="link-primary">política de privacidade</a>
								</label>
							</div>
						</div>

						<!-- Submit Button -->
						<div class="col-12">
							<button type="submit" class="btn btn-primary btn-lg w-100">
								<i class="bi bi-check-circle me-2"></i>Criar minha conta
							</button>
						</div>

						<!-- Login Link -->
						<div class="col-12">
							<div class="login-link">
								<p>Já tem uma conta? 
									<a href="pages/login/login.jsp" class="link-primary">
										Faça login
										<i class="bi bi-arrow-right ms-1"></i>
									</a>
								</p>
							</div>
						</div>
					</div>
				</form>
			</div>

			<footer class="cadastro-footer">
				<p>&copy; 2024 IFSP Bank. Todos os direitos reservados.</p>
			</footer>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/cadastrar.js"></script>
</body>
</html>