// atualiza o ano automaticamente
document.getElementById('year').textContent = new Date().getFullYear();

// envia o formulário
const form = document.getElementById('contactForm');
if (form) {
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const data = new FormData(form);
    const nome = data.get('nome');
    alert(`Obrigado, ${nome || 'visitante'}! Sua mensagem foi enviada.`);
    form.reset();
  });
}
// animação simples de fade-in nos planos
const planCards = document.querySelectorAll('.plan-card');
const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.2 });

planCards.forEach(card => observer.observe(card));
