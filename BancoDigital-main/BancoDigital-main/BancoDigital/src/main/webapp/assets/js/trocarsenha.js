// JavaScript compartilhado para trocarsenha.js, todostransferencias.js, todosusuarios.js

// ===== PASSWORD TOGGLE (trocarsenha.js) =====
const togglePassword = document.getElementById('togglePassword');
const passwordInputs = document.querySelectorAll('input[type="password"]');

if (togglePassword && passwordInputs.length > 0) {
	togglePassword.addEventListener('click', function() {
		passwordInputs.forEach(input => {
			const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
			input.setAttribute('type', type);
		});
		
		const icon = this.querySelector('i');
		if (icon.classList.contains('bi-eye-fill')) {
			icon.classList.remove('bi-eye-fill');
			icon.classList.add('bi-eye-slash-fill');
		} else {
			icon.classList.remove('bi-eye-slash-fill');
			icon.classList.add('bi-eye-fill');
		}
	});
}

// ===== PASSWORD STRENGTH (trocarsenha.js) =====
const senhaNova = document.getElementById('senhaNova');
if (senhaNova) {
	const strengthBar = document.querySelector('.strength-progress');
	const strengthText = document.querySelector('.strength-text span');
	
	senhaNova.addEventListener('input', function() {
		const password = this.value;
		const strength = calculatePasswordStrength(password);
		
		strengthBar.classList.remove('weak', 'medium', 'strong');
		strengthText.classList.remove('weak', 'medium', 'strong');
		
		if (password.length === 0) {
			strengthText.textContent = '-';
			strengthBar.style.width = '0';
		} else if (strength < 40) {
			strengthBar.classList.add('weak');
			strengthText.classList.add('weak');
			strengthText.textContent = 'Fraca';
		} else if (strength < 70) {
			strengthBar.classList.add('medium');
			strengthText.classList.add('medium');
			strengthText.textContent = 'Média';
		} else {
			strengthBar.classList.add('strong');
			strengthText.classList.add('strong');
			strengthText.textContent = 'Forte';
		}
	});
}

function calculatePasswordStrength(password) {
	let strength = 0;
	if (password.length >= 6) strength += 20;
	if (password.length >= 8) strength += 20;
	if (password.length >= 12) strength += 10;
	if (/[a-z]/.test(password)) strength += 15;
	if (/[A-Z]/.test(password)) strength += 15;
	if (/[0-9]/.test(password)) strength += 10;
	if (/[^a-zA-Z0-9]/.test(password)) strength += 10;
	return strength;
}

// ===== FORM SUBMIT WITH LOADING =====
const forms = document.querySelectorAll('form');
forms.forEach(form => {
	form.addEventListener('submit', function(e) {
		const submitBtn = this.querySelector('button[type="submit"]');
		if (submitBtn) {
			submitBtn.disabled = true;
			submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Processando...';
		}
	});
});

// ===== ANIMATE ON LOAD =====
document.addEventListener('DOMContentLoaded', function() {
	// Animate header
	const header = document.querySelector('.trocarsenha-header, .transferencias-header, .usuarios-header, .desabilitar-header');
	if (header) {
		header.style.opacity = '0';
		header.style.transform = 'translateY(20px)';
		setTimeout(() => {
			header.style.transition = 'all 0.6s ease';
			header.style.opacity = '1';
			header.style.transform = 'translateY(0)';
		}, 100);
	}
	
	// Animate KPIs
	const kpis = document.querySelectorAll('.kpi-card');
	kpis.forEach((kpi, index) => {
		kpi.style.opacity = '0';
		kpi.style.transform = 'scale(0.9)';
		setTimeout(() => {
			kpi.style.transition = 'all 0.5s ease';
			kpi.style.opacity = '1';
			kpi.style.transform = 'scale(1)';
		}, 200 + (index * 100));
	});
	
	// Animate cards
	const cards = document.querySelectorAll('.card, .form-card');
	cards.forEach((card, index) => {
		card.style.opacity = '0';
		card.style.transform = 'translateY(20px)';
		setTimeout(() => {
			card.style.transition = 'all 0.6s ease';
			card.style.opacity = '1';
			card.style.transform = 'translateY(0)';
		}, 300 + (index * 100));
	});
	
	// Animate table rows
	const tableRows = document.querySelectorAll('table tbody tr');
	tableRows.forEach((row, index) => {
		row.style.opacity = '0';
		row.style.transform = 'translateX(-20px)';
		setTimeout(() => {
			row.style.transition = 'all 0.4s ease';
			row.style.opacity = '1';
			row.style.transform = 'translateX(0)';
		}, 400 + (index * 30));
	});
	
	// Auto-dismiss alerts
	const alerts = document.querySelectorAll('.alert');
	alerts.forEach(alert => {
		setTimeout(() => {
			const bsAlert = new bootstrap.Alert(alert);
			bsAlert.close();
		}, 5000);
	});
});