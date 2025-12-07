<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IFSP Bank - Verificação</title>
<base href="<%=request.getContextPath()%>/">
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/iconsite.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/verificacao.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
	<div class="verificacao-wrapper">
		<div class="verificacao-container">
			<!-- Header -->
			<div class="verificacao-header">
				<div class="verification-icon">
					<i class="bi bi-shield-check"></i>
				</div>
				<h1 class="verificacao-title">Banco Digital IFSP</h1>
				<h2 class="verificacao-subtitle">Digite o código do Email</h2>
			</div>

			<!-- Error Message -->
			<%
			if (request.getAttribute("error") != null) {
			%>
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<i class="bi bi-exclamation-triangle-fill me-2"></i>
				<strong>Código errado</strong>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			<%
			}
			%>

			<!-- Verification Form -->
			<form action="<%=request.getContextPath()%>/verificacaoCodigo" method="post" class="verificacao-form">
				<div class="form-group">
					<label for="codigo" class="form-label">
						<i class="bi bi-key-fill me-2"></i>Código:
					</label>
					<input 
						type="text" 
						class="form-control form-control-lg" 
						id="codigo" 
						name="codigo" 
						required
						placeholder="Digite o código">
				</div>

				<%
				if (request.getParameter("next") != null) {
				%>
				<input type="hidden" name="next" value="<%=request.getParameter("next")%>">
				<%
				}
				%>

				<button type="submit" class="btn btn-primary btn-lg w-100">
					<i class="bi bi-check-circle me-2"></i>Validar
				</button>
			</form>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/verificacao.js"></script>
</body>
</html>