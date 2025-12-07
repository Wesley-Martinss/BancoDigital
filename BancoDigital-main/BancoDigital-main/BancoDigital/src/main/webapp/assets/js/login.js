// ===== PASSWORD TOGGLE =====
const togglePassword = document.getElementById('togglePassword');
const passwordInput = document.getElementById('password');

if (togglePassword && passwordInput) {
	togglePassword.addEventListener('click', function() {
		// Toggle password visibility
		const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
		passwordInput.setAttribute('type', type);
		
		// Toggle icon
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

// ===== FORM VALIDATION & ANIMATION =====
const loginForm = document.querySelector('.login-form');
const formInputs = document.querySelectorAll('.form-control');

if (loginForm) {
	// Add floating label effect
	formInputs.forEach(input => {
		// Check on load if input has value
		if (input.value) {
			input.classList.add('has-value');
		}
		
		// Add event listeners
		input.addEventListener('focus', function() {
			this.parentElement.classList.add('focused');
		});
		
		input.addEventListener('blur', function() {
			this.parentElement.classList.remove('focused');
			if (this.value) {
				this.classList.add('has-value');
			} else {
				this.classList.remove('has-value');
			}
		});
		
		// Real-time validation
		input.addEventListener('input', function() {
			if (this.value) {
				this.classList.add('has-value');
			} else {
				this.classList.remove('has-value');
			}
		});
	});
	
	// Form submit animation
	loginForm.addEventListener('submit', function(e) {
		const submitBtn = this.querySelector('button[type="submit"]');
		
		// Add loading state
		submitBtn.disabled = true;
		submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Entrando...';
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
	const firstInput = document.getElementById('user');
	if (firstInput) {
		setTimeout(() => {
			firstInput.focus();
		}, 500);
	}
});

// ===== KEYBOARD SHORTCUTS =====
document.addEventListener('keydown', function(e) {
	// Press Enter to submit form when focused on any input
	if (e.key === 'Enter' && document.activeElement.tagName === 'INPUT') {
		const form = document.querySelector('.login-form');
		if (form) {
			form.requestSubmit();
		}
	}
});