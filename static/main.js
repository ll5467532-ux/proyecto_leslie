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

    const menu = document.getElementById('dropdownMenu');
    if (menu) menu.addEventListener('click', (e) => e.stopPropagation());

    document.addEventListener('click', () => setOpen(false));
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') { setOpen(false); btn.focus(); }
    });
});
