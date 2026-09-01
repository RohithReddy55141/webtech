/**
 * SIMATS Web Application Client Script
 * Implements Part 1: Vanilla JavaScript DOM manipulation for Student Card Preview
 */

document.addEventListener('DOMContentLoaded', () => {

  // ==========================================
  // Tab Navigation Handling
  // ==========================================
  const tabDomBtn = document.getElementById('tabDomBtn');
  const tabServletBtn = document.getElementById('tabServletBtn');
  const tabDom = document.getElementById('tabDom');
  const tabServlet = document.getElementById('tabServlet');

  if (tabDomBtn && tabServletBtn) {
    tabDomBtn.addEventListener('click', () => {
      tabDomBtn.classList.add('active');
      tabServletBtn.classList.remove('active');
      tabDom.classList.add('active');
      tabServlet.classList.remove('active');
    });

    tabServletBtn.addEventListener('click', () => {
      tabServletBtn.classList.add('active');
      tabDomBtn.classList.remove('active');
      tabServlet.classList.add('active');
      tabDom.classList.remove('active');
    });
  }

  // ==========================================
  // Part 1: DOM-Based Student Registration Preview
  // Using: getElementById, createElement, addEventListener
  // ==========================================
  const registrationForm = document.getElementById('registrationForm');
  const cardsContainer = document.getElementById('cardsContainer');
  const emptyState = document.getElementById('emptyState');
  const cardCountBadge = document.getElementById('cardCountBadge');

  let cardCounter = 0;

  function updateCardCounter() {
    const activeCards = cardsContainer.querySelectorAll('.student-id-card').length;
    cardCountBadge.textContent = `${activeCards} Card${activeCards === 1 ? '' : 's'}`;
    
    if (activeCards === 0) {
      if (emptyState) emptyState.style.display = 'block';
    } else {
      if (emptyState) emptyState.style.display = 'none';
    }
  }

  if (registrationForm) {
    // 1. addEventListener to form submit
    registrationForm.addEventListener('submit', (e) => {
      e.preventDefault(); // Prevent page reload

      // 2. getElementById to retrieve input values
      const nameInput = document.getElementById('regName');
      const regNoInput = document.getElementById('regNo');
      const deptInput = document.getElementById('regDept');
      const yearInput = document.getElementById('regYear');

      const name = nameInput.value.trim();
      const regNo = regNoInput.value.trim();
      const dept = deptInput.value;
      const year = yearInput.value;

      if (!name || !regNo || !dept || !year) {
        alert('Please fill out all fields before generating the student card.');
        return;
      }

      // 3. createElement to build card structure dynamically
      const card = document.createElement('div');
      card.className = 'student-id-card';

      // Avatar Initials
      const initials = name.split(' ').map(n => n[0]).join('').toUpperCase().slice(0, 2);

      card.innerHTML = `
        <div class="card-top-bar">
          <span class="card-institution">Saveetha Institute of Medical & Technical Sciences</span>
          <span class="badge-tag">STUDENT ID</span>
        </div>
        <div class="card-body">
          <div class="card-avatar">${initials}</div>
          <div class="card-details">
            <h3 class="card-name">${escapeHtml(name)}</h3>
            <span class="card-reg-no">REG: ${escapeHtml(regNo)}</span>
            <div class="card-meta-grid">
              <div class="card-meta-item">Dept: <span>${escapeHtml(dept)}</span></div>
              <div class="card-meta-item">Year: <span>${escapeHtml(year)}</span></div>
            </div>
          </div>
        </div>
        <div class="card-footer">
          <button class="btn-remove" title="Delete Card">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
            Remove Card
          </button>
        </div>
      `;

      // 4. Attach addEventListener to the 'Remove' button inside card
      const removeBtn = card.querySelector('.btn-remove');
      removeBtn.addEventListener('click', () => {
        card.style.animation = 'fadeOut 0.3s ease forwards';
        setTimeout(() => {
          card.remove(); // Removes element from DOM
          updateCardCounter();
        }, 250);
      });

      // Append card to container
      cardsContainer.prepend(card);
      cardCounter++;
      updateCardCounter();

      // Reset form inputs
      registrationForm.reset();
    });
  }

  // Utility helper function to escape HTML string
  function escapeHtml(str) {
    return str.replace(/&/g, "&amp;")
              .replace(/</g, "&lt;")
              .replace(/>/g, "&gt;")
              .replace(/"/g, "&quot;")
              .replace(/'/g, "&#039;");
  }

});
