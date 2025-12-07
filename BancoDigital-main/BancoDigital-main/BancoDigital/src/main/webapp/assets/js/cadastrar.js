// ===== PASSWORD TOGGLE =====
const togglePassword = document.getElementById('togglePassword');
const passwordInput = document.getElementById('senha');

if (togglePassword && passwordInput) {
	togglePassword.addEventListener('click', function() {
		const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
		passwordInput.setAttribute('type', type);
		
		const icon = this.querySelector('i');
		if (type === 'password') {
			icon.classList.remove('bi-eye-slash-fill');
			icon.classList.add('bi-eye-fill');
		} else {
			icon.classList.remove('bi-eye-fill');
			icon.classList.add('bi-eye-slash-fill');
		}
	});
}

// ===== PASSWORD STRENGTH =====
if (passwordInput) {
	const strengthBar = document.querySelector('.strength-progress');
	const strengthText = document.querySelector('.strength-text span');
	
	passwordInput.addEventListener('input', function() {
		const password = this.value;
		const strength = calculatePasswordStrength(password);
		
		// Remove todas as classes
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

// ===== INPUT MASKS =====
const cpfInput = document.getElementById('cpf');
const telefoneInput = document.getElementById('telefone');

if (cpfInput) {
	cpfInput.addEventListener('input', function(e) {
		let value = e.target.value.replace(/\D/g, '');
		
		if (value.length <= 11) {
			value = value.replace(/(\d{3})(\d)/, '$1.$2');
			value = value.replace(/(\d{3})(\d)/, '$1.$2');
			value = value.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
		}
		
		e.target.value = value;
	});
}

if (telefoneInput) {
	telefoneInput.addEventListener('input', function(e) {
		let value = e.target.value.replace(/\D/g, '');
		
		if (value.length <= 11) {
			if (value.length <= 10) {
				value = value.replace(/(\d{2})(\d)/, '($1) $2');
				value = value.replace(/(\d{4})(\d)/, '$1-$2');
			} else {
				value = value.replace(/(\d{2})(\d)/, '($1) $2');
				value = value.replace(/(\d{5})(\d)/, '$1-$2');
			}
		}
		
		e.target.value = value;
	});
}

// ===== FORM VALIDATION =====
const cadastroForm = document.getElementById('cadastroForm');

if (cadastroForm) {
	cadastroForm.addEventListener('submit', function(e) {
		if (!cadastroForm.checkValidity()) {
			e.preventDefault();
			e.stopPropagation();
		} else {
			// Add loading state
			const submitBtn = this.querySelector('button[type="submit"]');
			submitBtn.disabled = true;
			submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Criando conta...';
		}
		
		cadastroForm.classList.add('was-validated');
	});
	
	// Real-time validation
	const inputs = cadastroForm.querySelectorAll('input[required]');
	inputs.forEach(input => {
		input.addEventListener('blur', function() {
			if (this.checkValidity()) {
				this.classList.remove('is-invalid');
				this.classList.add('is-valid');
			} else {
				this.classList.remove('is-valid');
				this.classList.add('is-invalid');
			}
		});
		
		input.addEventListener('input', function() {
			if (this.classList.contains('is-invalid') || this.classList.contains('is-valid')) {
				if (this.checkValidity()) {
					this.classList.remove('is-invalid');
					this.classList.add('is-valid');
				} else {
					this.classList.remove('is-valid');
					this.classList.add('is-invalid');
				}
			}
		});
	});
}

// ===== ANIMATE ELEMENTS ON LOAD =====
document.addEventListener('DOMContentLoaded', function() {
	// Animate brand content
	const brandContent = document.querySelector('.brand-content');
	if (brandContent) {
		brandContent.style.opacity = '0';
		brandContent.style.transform = 'translateY(30px)';
		
		setTimeout(() => {
			brandContent.style.transition = 'all 0.8s cubic-bezier(0.4, 0, 0.2, 1)';
			brandContent.style.opacity = '1';
			brandContent.style.transform = 'translateY(0)';
		}, 200);
	}
	
	// Animate features
	const features = document.querySelectorAll('.feature-item');
	features.forEach((feature, index) => {
		feature.style.opacity = '0';
		feature.style.transform = 'translateX(-30px)';
		
		setTimeout(() => {
			feature.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
			feature.style.opacity = '1';
			feature.style.transform = 'translateX(0)';
		}, 400 + (index * 150));
	});
	
	// Auto-dismiss alerts after 5 seconds
	const alerts = document.querySelectorAll('.alert');
	alerts.forEach(alert => {
		setTimeout(() => {
			const bsAlert = new bootstrap.Alert(alert);
			bsAlert.close();
		}, 5000);
	});
	
	// Focus first input
	const firstInput = document.getElementById('nome');
	if (firstInput) {
		setTimeout(() => {
			firstInput.focus();
		}, 500);
	}
});

// ===== EMAIL VALIDATION =====
const emailInput = document.getElementById('email');
if (emailInput) {
	emailInput.addEventListener('blur', function() {
		const email = this.value;
		const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		
		if (email && !emailRegex.test(email)) {
			this.setCustomValidity('E-mail inválido');
			this.classList.add('is-invalid');
			this.classList.remove('is-valid');
		} else {
			this.setCustomValidity('');
		}
	});
}