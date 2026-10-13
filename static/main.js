<<<<<<< HEAD
=======
// Menú desplegable "Módulos" (se carga en todas las páginas).
>>>>>>> 301fc290d96af19bcc36fa2a3dbf51cc15514e3e
document.addEventListener('DOMContentLoaded', () => {
    const dropdown = document.getElementById('dropdown');
    const btn = document.getElementById('dropdownBtn');
    if (!dropdown || !btn) return;

    const setOpen = (open) => {
        dropdown.classList.toggle('show', open);
        btn.setAttribute('aria-expanded', String(open));
    };

    btn.addEventListener('click', (e) => {
        e.stopPropagation();
        setOpen(!dropdown.classList.contains('show'));
    });

<<<<<<< HEAD
=======
    // Clic dentro del menú no lo cierra antes de navegar
>>>>>>> 301fc290d96af19bcc36fa2a3dbf51cc15514e3e
    const menu = document.getElementById('dropdownMenu');
    if (menu) menu.addEventListener('click', (e) => e.stopPropagation());

    document.addEventListener('click', () => setOpen(false));
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') { setOpen(false); btn.focus(); }
    });
});
