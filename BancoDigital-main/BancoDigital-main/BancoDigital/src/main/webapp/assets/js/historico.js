// ===== SEARCH FILTER =====
const searchInput = document.getElementById('searchInput');
const filterType = document.getElementById('filterType');
const filterPeriod = document.getElementById('filterPeriod');
const clearFiltersBtn = document.getElementById('clearFilters');
const transactionRows = document.querySelectorAll('.transaction-row');

function applyFilters() {
	const searchTerm = searchInput ? searchInput.value.toLowerCase() : '';
	const typeFilter = filterType ? filterType.value : '';
	const periodFilter = filterPeriod ? filterPeriod.value : '';
	
	let visibleCount = 0;
	
	transactionRows.forEach(row => {
		const text = row.textContent.toLowerCase();
		const tipo = row.getAttribute('data-tipo');
		
		// Search filter
		const matchesSearch = text.includes(searchTerm);
		
		// Type filter
		const matchesType = !typeFilter || tipo === typeFilter;
		
		// Period filter (simplified - you can enhance this)
		const matchesPeriod = true; // Implement date filtering if needed
		
		if (matchesSearch && matchesType && matchesPeriod) {
			row.style.display = '';
			visibleCount++;
		} else {
			row.style.display = 'none';
		}
	});
	
	// Update total transactions count
	const totalElement = document.getElementById('totalTransactions');
	if (totalElement) {
		totalElement.textContent = visibleCount;
	}
}

if (searchInput) {
	searchInput.addEventListener('input', applyFilters);
}

if (filterType) {
	filterType.addEventListener('change', applyFilters);
}

if (filterPeriod) {
	filterPeriod.addEventListener('change', applyFilters);
}

if (clearFiltersBtn) {
	clearFiltersBtn.addEventListener('click', () => {
		if (searchInput) searchInput.value = '';
		if (filterType) filterType.value = '';
		if (filterPeriod) filterPeriod.value = '';
		applyFilters();
	});
}

// ===== SHOW DETAILS MODAL =====
function showDetails(data, tipo, valor, remetente, destinatario) {
	const modalBody = document.getElementById('modalBody');
	
	if (modalBody) {
		modalBody.innerHTML = `
			<div class="row g-3">
				<div class="col-12">
					<div class="detail-item">
						<div class="detail-label">
							<i class="bi bi-calendar3 me-2"></i>Data / Hora
						</div>
						<div class="detail-value">${data}</div>
					</div>
				</div>
				<div class="col-12">
					<div class="detail-item">
						<div class="detail-label">
							<i class="bi bi-tag me-2"></i>Tipo de Transação
						</div>
						<div class="detail-value">${tipo}</div>
					</div>
				</div>
				<div class="col-12">
					<div class="detail-item">
						<div class="detail-label">
							<i class="bi bi-cash me-2"></i>Valor
						</div>
						<div class="detail-value" style="font-size: 24px; font-weight: 700; color: var(--primary);">
							R$ ${valor}
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="detail-item">
						<div class="detail-label">
							<i class="bi bi-person me-2"></i>Remetente
						</div>
						<div class="detail-value">${remetente}</div>
					</div>
				</div>
				<div class="col-12">
					<div class="detail-item">
						<div class="detail-label">
							<i class="bi bi-person-check me-2"></i>Destinatário
						</div>
						<div class="detail-value">${destinatario}</div>
					</div>
				</div>
			</div>
		`;
		
		// Add styles to modal body
		const style = document.createElement('style');
		style.textContent = `
			.detail-item {
				background: var(--bg);
				padding: 16px;
				border-radius: 12px;
			}
			.detail-label {
				font-size: 12px;
				color: var(--text-light);
				font-weight: 600;
				text-transform: uppercase;
				letter-spacing: 0.5px;
				margin-bottom: 8px;
				display: flex;
				align-items: center;
			}
			.detail-value {
				font-size: 16px;
				color: var(--text);
				font-weight: 500;
			}
		`;
		
		if (!document.getElementById('modal-styles')) {
			style.id = 'modal-styles';
			document.head.appendChild(style);
		}
		
		const modal = new bootstrap.Modal(document.getElementById('detailsModal'));
		modal.show();
	}
}

// ===== ANIMATE ON LOAD =====
document.addEventListener('DOMContentLoaded', function() {
	// Animate header
	const header = document.querySelector('.historico-header');
	if (header) {
		header.style.opacity = '0';
		header.style.transform = 'translateY(20px)';
		
		setTimeout(() => {
			header.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
			header.style.opacity = '1';
			header.style.transform = 'translateY(0)';
		}, 100);
	}
	
	// Animate filters
	const filters = document.querySelector('.filters-section');
	if (filters) {
		filters.style.opacity = '0';
		filters.style.transform = 'translateY(20px)';
		
		setTimeout(() => {
			filters.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
			filters.style.opacity = '1';
			filters.style.transform = 'translateY(0)';
		}, 200);
	}
	
	// Animate table
	const tableSection = document.querySelector('.table-section');
	if (tableSection) {
		tableSection.style.opacity = '0';
		tableSection.style.transform = 'translateY(20px)';
		
		setTimeout(() => {
			tableSection.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
			tableSection.style.opacity = '1';
			tableSection.style.transform = 'translateY(0)';
		}, 300);
	}
	
	// Animate rows
	transactionRows.forEach((row, index) => {
		row.style.opacity = '0';
		row.style.transform = 'translateX(-20px)';
		
		setTimeout(() => {
			row.style.transition = 'all 0.5s cubic-bezier(0.4, 0, 0.2, 1)';
			row.style.opacity = '1';
			row.style.transform = 'translateX(0)';
		}, 400 + (index * 50));
	});
	
	// Animate summary cards
	const summaryCards = document.querySelectorAll('.summary-card');
	summaryCards.forEach((card, index) => {
		card.style.opacity = '0';
		card.style.transform = 'scale(0.9)';
		
		setTimeout(() => {
			card.style.transition = 'all 0.5s cubic-bezier(0.4, 0, 0.2, 1)';
			card.style.opacity = '1';
			card.style.transform = 'scale(1)';
		}, 600 + (index * 100));
	});
});

// ===== EXPORT TO CSV (BONUS) =====
function exportToCSV() {
	const rows = document.querySelectorAll('.transaction-row:not([style*="display: none"])');
	let csv = 'Data/Hora,Tipo,Valor,Remetente,Destinatário\n';
	
	rows.forEach(row => {
		const cells = row.querySelectorAll('td');
		const rowData = [];
		
		cells.forEach((cell, index) => {
			if (index < 5) { // Skip last column (actions)
				rowData.push('"' + cell.textContent.trim().replace(/"/g, '""') + '"');
			}
		});
		
		csv += rowData.join(',') + '\n';
	});
	
	// Download CSV
	const blob = new Blob([csv], { type: 'text/csv' });
	const url = window.URL.createObjectURL(blob);
	const a = document.createElement('a');
	a.href = url;
	a.download = 'historico_transacoes.csv';
	a.click();
	window.URL.revokeObjectURL(url);
}

// Add export button if needed
const addExportButton = () => {
	const filtersSection = document.querySelector('.filters-section .row');
	if (filtersSection && !document.getElementById('exportBtn')) {
		const exportCol = document.createElement('div');
		exportCol.className = 'col-md-2';
		exportCol.innerHTML = `
			<button class="btn btn-success w-100" id="exportBtn" onclick="exportToCSV()">
				<i class="bi bi-download me-2"></i>Exportar
			</button>
		`;
		filtersSection.appendChild(exportCol);
	}
};