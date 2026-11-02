# Calendario Maestro — Régimen de 2 h/día, Gates y Búsqueda Global

> **Fuente única** del ritmo y cronograma de estudio. Define los regímenes de dedicación según el período lectivo, las vacaciones y la estrategia en Dos Etapas.
>
> **Regla base:** el plan se diseña para 2 h/día. Más horas son opcionales; menos horas activan el modo de supervivencia (sección 6).

---

## 1. Regímenes de Horas y Dedicación

| Período | Rango de Fechas | Esquema | Total Semanal |
| :--- | :--- | :--- | :--- |
| **Clases** | Hasta 21 nov 2026 (y semestres 2027) | Sáb–Dom–Lun: 2 h/día · Mar–Vie: 15 min opcionales | **6 h / semana** |
| **Evaluaciones** | 22 – 30 nov 2026 | 20 min/día de repaso de DSA | **~2 h / semana** |
| **Vacaciones** | Dic 2026 – Feb 2027 | Lun–Sáb: 4 h/día · Domingo libre | **~24 h / semana** |
| **Semestre 2027** | Mar – Nov 2027 | Sáb–Dom–Lun: 2 h/día | **6–10 h / semana** |
| **Con trabajo de medio tiempo** | Cualquiera | 30 min/día, 4 días/semana | **~2–5 h / semana** |

- **Semana de baja intensidad (vacaciones):** cada 6 semanas se baja a 2 h/día para consolidar y evitar burnout.
- **Regla del 80%:** planifica como máximo el 80% de tu capacidad. El 20% restante es para exámenes, imprevistos, salud y vida.
- **Regla de proporción:** al menos la mitad de las horas deben ser código, no videos ni lectura.
- **Domingo:** libre. Solo se usa para la revisión semanal de 20 min.

---

## 2. Horario Semanal por Régimen

### Clases (6 h/semana)

| Día | Bloque |
| :--- | :--- |
| **Sábado** | 40 min DSA en Go (desde el 16 nov; antes, ese bloque es Go) + 80 min Go o teoría de la fase |
| **Domingo** | 2 h de proyecto (código) + 20 min revisión semanal |
| **Lunes** | 1 h teoría/Postgres + 20 min bitácora en inglés + 15 min repaso espaciado |
| **Mar–Vie** | Opcional: 15 min de Anki o una lectura corta en inglés |

### Vacaciones (24 h/semana)

| Día | Bloques |
| :--- | :--- |
| **Lun–Sáb** | 2 h proyecto + 1 h DSA + 1 h teoría/lectura |
| **Domingo** | Libre (o 1 h de repaso si se acumuló atraso) |

---

## 3. Cronograma Nov 2026 – Dic 2027

| Periodo | Régimen | Foco Técnico | Entregable / Hito |
| :--- | :--- | :--- | :--- |
| **2 – 15 nov 2026** | Clases (6 h/sem) | Go básico (capítulos `01`–`04` y `07-maps` de *Learn Go with Tests*), primeros tests de `taskapi` | Repo `taskapi` iniciado |
| **16 – 21 nov 2026** | Clases (6 h/sem) | Capítulos 05–06 + 2 endpoints; arranca DSA en Go | Repo `taskapi` iniciado + 3 problemas DSA |
| **22 – 30 nov 2026** | Evaluaciones (20 min/día) | Repaso de DSA | Racha mantenida |
| **Dic 2026** | Vacaciones | Go a fondo (goroutines, channels, `context`), Postgres (schema, índices, transacciones), CRUD de `taskapi` | `taskapi` con CRUD sobre Postgres + tests |
| **Ene 2027** | Vacaciones | `taskapi` MVP: JWT, bcrypt, validación, Docker, README en inglés | `taskapi` terminado |
| **1 – 15 feb 2027** | Vacaciones | **Gate G1** + Redis (cache-aside) + métricas Prometheus | G1 aprobado, `resilient-api` iniciado |
| **15 feb – 31 mar 2027** | Semestre | `resilient-api`: rate limiting, OTel, GitHub Actions, IA aplicada | `resilient-api` en `docker compose up` con CI |
| **1 – 30 abr 2027** | Semestre | Arquitectura hexagonal, 2 ADR, Gossip Glomers 1–3, 5 casos de system design | **Gate G2** + `architecture-docs` |
| **1 may – 15 jun 2027** | Semestre | Portfolio, CV/LinkedIn en inglés, mocks, entrevistas de validación | Perfil listo para aplicar |
| **15 jun – 15 dic 2027** | Búsqueda + tesis | Postulaciones globales, tesis, exámenes finales | 🎓 Graduación con oferta o pipeline activo |

---

## 4. Gates de Decisión

| Gate | Fecha | Criterio | Si no se cumple |
| :--- | :--- | :--- | :--- |
| **G1** | 15 feb 2027 | `taskapi` corre con Docker, tiene tests y auth; puedes explicar cada decisión | Se recorta `resilient-api` a cache + métricas |
| **G1 — datos** | 15 feb 2027 | La rama de datos te interesó durante F2 | Se pospone a post-graduación |
| **G2** | 30 abr 2027 | `resilient-api` con CI y métricas; 2 ADR en inglés; 5 casos de diseño | Se prioriza búsqueda sobre pulido |
| **G2 — especialidad** | 30 abr 2027 | Decides: backend-plataforma o datos, según qué te motivó en F3–F4 | Se decide en mayo con la información disponible |

**Ritual mensual (20 min, primer domingo del mes):** revisar horas reales, qué bloque quedó vacío y qué gate está en riesgo. Reasignar; no culparse.

---

## 5. Prioridades (qué se recorta primero)

- **P0 (no negociable):** `taskapi` MVP, DSA constante, inglés escrito, bitácora.
- **P1:** `resilient-api` (cache, rate limit, métricas, CI), 2 ADR, búsqueda activa.
- **P2:** Gossip Glomers 1–3, rama de datos, casos de diseño adicionales, Kubernetes básico.
- **P3 (fuera del plan 2027):** mobile KMP, catálogo GoF completo, *Kubernetes the Hard Way*, certificaciones AWS, `mysh` más allá de v2.0.

---

## 6. Modo de Supervivencia

Cuando el trabajo o los exámenes aprietan, no se para: se reduce a **4 sesiones de 30 min por semana** (1 DSA, 1 proyecto, 1 inglés, 1 repaso).

Se recorta en este orden: P3 → P2 → P1. Nunca P0.

---

## 7. Estado Operativo y Enlaces

- **Plan operativo y rutina diaria:** [`docs/plan-operativo.md`](docs/plan-operativo.md)
- **Seguimiento diario de DSA:** [`learning-dsa/README.md`](learning-dsa/README.md)
- **Hoja de ruta estratégica completa:** [`docs/roadmap.md`](docs/roadmap.md)
- **Fuentes técnicas verificadas:** [`docs/SOURCES.md`](docs/SOURCES.md)
