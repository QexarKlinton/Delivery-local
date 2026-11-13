USE delivery_local_nueva;

INSERT INTO puntos_entrega (
    nombre,
    tipo,
    edificio,
    orden
) VALUES
('Aula 1', 'Aula', 'CUTlaquepaque', 1),
('Aula 2', 'Aula', 'CUTlaquepaque', 2),
('Aula 3', 'Aula', 'CUTlaquepaque', 3),
('Aula 4', 'Aula', 'CUTlaquepaque', 4),
('Aula 5', 'Aula', 'CUTlaquepaque', 5),
('Aula 6', 'Aula', 'CUTlaquepaque', 6),
('Aula 7', 'Aula', 'CUTlaquepaque', 7),
('Aula 8', 'Aula', 'CUTlaquepaque', 8),
('Aula 9', 'Aula', 'CUTlaquepaque', 9),
('Aula 10', 'Aula', 'CUTlaquepaque', 10),
('Aula 11', 'Aula', 'CUTlaquepaque', 11),
('Aula 12', 'Aula', 'CUTlaquepaque', 12),
('Aula 13', 'Aula', 'CUTlaquepaque', 13),
('Aula 14', 'Aula', 'CUTlaquepaque', 14),
('Aula 15', 'Aula', 'CUTlaquepaque', 15),
('Aula 16', 'Aula', 'CUTlaquepaque', 16),
('Aula 17', 'Aula', 'CUTlaquepaque', 17),
('Aula 18', 'Aula', 'CUTlaquepaque', 18),
('Aula 19', 'Aula', 'CUTlaquepaque', 19),
('Aula 20', 'Aula', 'CUTlaquepaque', 20),
('Edificio Administración (CEMSAC)', 'Edificio', 'CUTlaquepaque', 21);

SELECT * FROM puntos_entrega ORDER BY orden;