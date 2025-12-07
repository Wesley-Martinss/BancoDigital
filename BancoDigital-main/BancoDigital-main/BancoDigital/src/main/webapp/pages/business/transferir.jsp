<%@page import="java.util.List"%>
<%@page import="edu.br.ifsp.bank.modelo.Pessoa"%>

<%
    Pessoa usuarioLogado = (Pessoa) session.getAttribute("usuarioLogado");
    List<Pessoa> resultados = (List<Pessoa>) request.getAttribute("resultados");
    Pessoa destino = (Pessoa) request.getAttribute("destino");

    String erro = (String) request.getAttribute("erro");
    String sucesso = (String) request.getAttribute("sucesso");
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IFSP Bank - Transferir</title>
<base href="<%=request.getContextPath()%>/">
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/iconsite.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/transferir.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>
	<div class="transferir-wrapper">
		<div class="transferir-container">
			<!-- Header -->
			<div class="transferir-header">
				<a href="<%=request.getContextPath()%>/home" class="back-link">
					<i class="bi bi-arrow-left"></i>
					Voltar
				</a>
				<div class="header-content">
					<div class="header-icon">
						<i class="bi bi-arrow-left-right"></i>
					</div>
					<div>
						<h1 class="transferir-title">Transferência</h1>
						<p class="transferir-subtitle">Envie dinheiro de forma rápida e segura</p>
					</div>
				</div>
			</div>

			<!-- Messages -->
			<% if (erro != null) { %>
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<i class="bi bi-exclamation-triangle-fill me-2"></i>
				<strong>Erro!</strong> <%= erro %>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			<% } %>

			<% if (sucesso != null) { %>
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<i class="bi bi-check-circle-fill me-2"></i>
				<strong>Sucesso!</strong> <%= sucesso %>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			<% } %>

			<!-- Search Form -->
			<% if (destino == null) { %>
			<div class="card search-card">
				<div class="card-body">
					<form action="<%=request.getContextPath()%>/pessoa/transferir" method="post">
						<div class="form-group mb-4">
							<label for="texto" class="form-label">
								<i class="bi bi-search me-2"></i>Pesquisar conta destino
							</label>
							<input 
								type="text" 
								class="form-control form-control-lg" 
								id="texto" 
								name="texto" 
								placeholder="Digite nome ou CPF" 
								required>
							<div class="form-text">
								<i class="bi bi-info-circle me-1"></i>
								Digite o nome ou CPF da pessoa que deseja transferir
							</div>
						</div>

						<button type="submit" class="btn btn-primary btn-lg w-100" onclick="return validadorBusca()">
							<i class="bi bi-search me-2"></i>Buscar
						</button>
					</form>
				</div>
			</div>
			<% } %>

			<!-- Destination Info & Transfer Form -->
			<% if (destino != null) { %>
			<div class="card destino-card mb-4">
				<div class="card-body">
					<div class="destino-header">
						<div class="destino-avatar">
							<%=destino.getNome().substring(0, 1).toUpperCase()%>
						</div>
						<div class="destino-info">
							<h3 class="destino-name"><%=destino.getNome()%></h3>
							<p class="destino-cpf">CPF: <%=destino.getCpf()%></p>
						</div>
					</div>
					<div class="saldo-info">
						<i class="bi bi-wallet2 me-2"></i>
						<span>Seu saldo atual: </span>
						<strong class="saldo-value">R$ <%=String.format("%.2f", usuarioLogado.getSaldo())%></strong>
					</div>
				</div>
			</div>

			<div class="card transfer-card">
				<div class="card-body">
					<form action="<%=request.getContextPath()%>/pessoa/transferir" method="post">
						<div class="form-group mb-4">
							<label for="valor" class="form-label">
								<i class="bi bi-cash-coin me-2"></i>Valor da transferência
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
								<i class="bi bi-shield-check me-1"></i>
								Transferência processada de forma segura e instantânea
							</div>
						</div>

						<input type="hidden" name="destinoCpf" value="<%=destino.getCpf()%>">

						<button type="submit" class="btn btn-primary btn-lg w-100">
							<i class="bi bi-send-fill me-2"></i>Continuar
						</button>
					</form>
				</div>
			</div>
			<% } %>

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
	<script src="<%=request.getContextPath()%>/assets/js/transferir.js"></script>
</body>
</html>