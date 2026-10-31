# Plan Operativo — Rutina, Gates y Prioridades

> Documento de uso diario. El cronograma vive en [`../calendario.md`](../calendario.md); la estrategia completa en [`roadmap.md`](./roadmap.md).

---

## 1. Eje del plan

- **Núcleo:** backend en Go, PostgreSQL, Docker, Redis, observabilidad y diseño de sistemas.
- **Rama de datos:** puente hacia Data Engineering, no especialización. Entra como eventos desde `taskapi` + SQL analítico.
- **Startup:** el portfolio se construye con mentalidad de producto. Descubrimiento de idea en paralelo, sin bloquear el avance.
- **Inglés:** se practica escribiendo (ADR, README, bitácora), no con un curso aparte.

---

## 2. Rutina diaria

### Días de clase (2 h)

| Bloque | Tiempo | Contenido |
| :--- | :--- | :--- |
| 1 | 40 min | DSA en Go (1 problema nuevo + repaso) |
| 2 | 60 min | Proyecto o teoría de la fase |
| 3 | 20 min | Bitácora en inglés (2–3 líneas) + repaso espaciado |

### Vacaciones (4 h)

| Bloque | Tiempo | Contenido |
| :--- | :--- | :--- |
| 1 | 2 h | Proyecto (código) |
| 2 | 1 h | DSA en Go (2–3 problemas) |
| 3 | 1 h | Teoría, lectura o inglés escrito |

### Reglas

1. **Toda sesión de proyecto termina en commit** + dos líneas de nota. Eso alimenta los ADR y el README sin trabajo extra.
2. **DSA:** si en 30–45 min no sale, se lee el patrón, se cierra la solución y al día siguiente se reescribe desde cero.
3. **Bitácora:** qué construiste, qué se rompió y por qué. En inglés.
4. **Cada mes:** 20 min de revisión (horas reales, bloques vacíos, gates en riesgo).

---

## 3. Hitos

| Fecha | Hito | Evidencia |
| :--- | :--- | :--- |
| 21 nov 2026 | Fin de clases | `taskapi` iniciado + hábito de DSA en Go |
| 15 feb 2027 | **G1** | `taskapi` con Docker, tests y auth |
| 31 mar 2027 | `resilient-api` | `docker compose up` con métricas y CI |
| 30 abr 2027 | **G2** | Hexagonal + 2 ADR + 5 casos de diseño |
| 15 jun 2027 | Perfil listo | CV, LinkedIn y repos en inglés |
| 15 jun – 15 dic 2027 | Búsqueda + tesis | Postulaciones semanales |

---

## 4. Startup sin idea: protocolo de descubrimiento

**No bloquea el portfolio.** `taskapi` usa un dominio neutro (gestión de tareas para equipos pequeños) hasta que exista un nicho validado.

| Etapa | Cuándo | Acción |
| :--- | :--- | :--- |
| Recolectar | Dic 2026 | 30 fricciones observadas (vida diaria, entorno, comunidades). Una línea cada una, en inglés |
| Filtrar | Ene 2027 | Puntuar 1–5: frecuencia, dolor, quién pagaría, cercanía, encaje con backend |
| Validar | Feb 2027 | Elegir 3 y conversar con 2 personas de cada una. Preguntar por el problema, no por la solución |
| Decidir | **G1 (15 feb)** | El nicho entra en `taskapi` o se mantiene el dominio neutro |

**Regla:** no se construye un MVP de startup durante el horario universitario. Solo se valida y se documenta.

---

## 5. Búsqueda global (desde junio 2027)

- **Preparación:** CV y LinkedIn en inglés, 3 historias STAR con métricas reales, mocks semanales.
- **Dónde se gestiona:** tracker de ofertas, CV, LinkedIn y outreach en [`yordycg-portfolio`](https://github.com/yordycg/yordycg-portfolio). Aquí solo se registran los hitos que condicionan el estudio.
- **Canales:** job boards remotos, LinkedIn y referidos. Los referidos pesan más que las postulaciones frías.
- **Meta:** 10–15 postulaciones por semana + 3 conversaciones con ingenieros del sector.
- **Planes alternativos (no excluyentes):** freelance/contrato con startups de EE. UU. o Europa; trabajo en Chile como respaldo; producto propio si la validación es positiva.

---

## 6. Regla de métricas

Si un número no fue medido en un benchmark reproducible, no va al CV ni al README. Las cifras de ejemplo del roadmap son plantillas, no resultados.
