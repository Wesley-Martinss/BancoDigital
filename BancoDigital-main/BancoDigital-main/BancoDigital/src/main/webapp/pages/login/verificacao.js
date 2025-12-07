// ===== FORM HANDLING =====
const verificationForm = document.querySelector('.verificacao-form');
const codigoInput = document.getElementById('codigo');

if (verificationForm) {
	verificationForm.addEventListener('submit', function(e) {
		const codigo = codigoInput.value.trim();
		
		if (!codigo) {
			e.preventDefault();
			return;
		}
		
		// Add loading state
		const submitBtn = this.querySelector('button[type="submit"]');
		submitBtn.disabled = true;
		submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Validando...';
	});
}

// ===== ANIMATE ELEMENTS ON LOAD =====
document.addEventListener('DOMContentLoaded', function() {
	// Animate container
	const container = document.querySelector('.verificacao-container');
	if (container) {
		container.style.opacity = '0';
		container.style.transform = 'translateY(30px)';
		
		setTimeout(() => {
			container.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
			container.style.opacity = '1';
			container.style.transform = 'translateY(0)';
		}, 100);
	}
	
	// Auto-dismiss alerts after 5 seconds
	const alerts = document.querySelectorAll('.alert');
	alerts.forEach(alert => {
		setTimeout(() => {
			const bsAlert = new bootstrap.Alert(alert);
			bsAlert.close();
		}, 5000);
	});
	
	// Focus input
	if (codigoInput) {
		setTimeout(() => {
			codigoInput.focus();
		}, 500);
	}
});