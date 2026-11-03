// Importamos useState para controlar elementos interactivos de la página.
import { useState } from "react";

// Importamos los estilos específicos de la aplicación.
import "./index.css";

// Lista temporal de cafeterías.
// Posteriormente estos datos vendrán desde nuestra API REST.
const cafeterias = [
  {
    id: 1,
    nombre: "Cafetería CUT",
    descripcion: "Comida rápida y desayunos para estudiantes.",
    categoria: "Comida",
    rating: "4.8",
    tiempo: "10-15 min",
    icono: "☕",
  },

  {
    id: 2,
    nombre: "Snack Universitario",
    descripcion: "Snacks, bebidas y opciones rápidas.",
    categoria: "Snacks",
    rating: "4.7",
    tiempo: "5-10 min",
    icono: "🍔",
  },

  {
    id: 3,
    nombre: "Tacos Central",
    descripcion: "Tacos y comida mexicana dentro del campus.",
    categoria: "Mexicana",
    rating: "4.9",
    tiempo: "10-20 min",
    icono: "🌮",
  },

  {
    id: 4,
    nombre: "Pizza Express",
    descripcion: "Pizza individual y combos para estudiantes.",
    categoria: "Pizza",
    rating: "4.6",
    tiempo: "15-20 min",
    icono: "🍕",
  },
];

// Categorías que aparecerán en la sección de exploración.
const categorias = [
  {
    nombre: "Hamburguesas",
    icono: "🍔",
  },

  {
    nombre: "Tacos",
    icono: "🌮",
  },

  {
    nombre: "Café",
    icono: "☕",
  },

  {
    nombre: "Pizza",
    icono: "🍕",
  },

  {
    nombre: "Snacks",
    icono: "🍟",
  },

  {
    nombre: "Bebidas",
    icono: "🥤",
  },
];

// Componente principal de CUTlaexpress.
function App() {

  // Estado utilizado para controlar el texto de búsqueda.
  const [busqueda, setBusqueda] = useState("");

  // Estado utilizado para controlar la categoría seleccionada.
  const [categoriaSeleccionada, setCategoriaSeleccionada] = useState("Todas");

  // Filtramos las cafeterías dependiendo de la búsqueda.
  const cafeteriasFiltradas = cafeterias.filter((cafeteria) => {

    // Convertimos la búsqueda a minúsculas para facilitar la comparación.
    const textoBusqueda = busqueda.toLowerCase();

    // Comprobamos si el nombre o descripción coinciden.
    const coincideBusqueda =
      cafeteria.nombre.toLowerCase().includes(textoBusqueda) ||
      cafeteria.descripcion.toLowerCase().includes(textoBusqueda);

    // Si no existe una categoría seleccionada, mostramos todas.
    const coincideCategoria =
      categoriaSeleccionada === "Todas" ||
      cafeteria.categoria === categoriaSeleccionada;

    // La cafetería debe cumplir ambas condiciones.
    return coincideBusqueda && coincideCategoria;
  });

  // Función para regresar al inicio de la página.
  const irInicio = () => {

    // Buscamos la sección principal.
    const inicio = document.getElementById("inicio");

    // Movemos suavemente la pantalla hacia ella.
    inicio?.scrollIntoView({
      behavior: "smooth",
    });
  };

  // Función para mostrar la sección de cafeterías.
  const verCafeterias = () => {

    // Buscamos la sección de cafeterías.
    const seccion = document.getElementById("cafeterias");

    // Hacemos scroll hasta la sección.
    seccion?.scrollIntoView({
      behavior: "smooth",
    });
  };

  // Renderizamos toda la interfaz.
  return (
    <div className="app">

      {/* ========================= */}
      {/* ENCABEZADO                 */}
      {/* ========================= */}

      <header className="navbar">

        {/* Logotipo de CUTlaexpress. */}
        <button
          className="logo"
          onClick={irInicio}
        >
          <span className="logo-icon">
            ⚡
          </span>

          <span>
            CUTla<span>express</span>
          </span>
        </button>

        {/* Menú principal. */}
        <nav className="nav-links">

          <button onClick={irInicio}>
            Inicio
          </button>

          <button onClick={verCafeterias}>
            Cafeterías
          </button>

          <button>
            ¿Cómo funciona?
          </button>

        </nav>

        {/* Acciones del usuario. */}
        <div className="nav-actions">

          {/* Botón del carrito. */}
          <button
            className="icon-button"
            aria-label="Carrito"
          >
            🛒
          </button>

          {/* Botón de usuario. */}
          <button
            className="user-button"
          >
            👤
            <span>Ingresar</span>
          </button>

        </div>

      </header>


      {/* ========================= */}
      {/* HERO                       */}
      {/* ========================= */}

      <main>

        <section
          id="inicio"
          className="hero"
        >

          {/* Contenido principal del hero. */}
          <div className="hero-content">

            {/* Etiqueta superior. */}
            <div className="hero-badge">
              ⚡ Delivery dentro de CUTlaquepaque
            </div>

            {/* Título principal. */}
            <h1>
              Tu comida.
              <br />

              <span>
                Más cerca.
              </span>
            </h1>

            {/* Descripción principal. */}
            <p>
              Pide comida desde tu celular o computadora
              y recibe tu pedido dentro de CUTlaquepaque
              sin hacer filas ni perder tiempo.
            </p>

            {/* Barra de búsqueda. */}
            <div className="search-box">

              {/* Icono de búsqueda. */}
              <span className="search-icon">
                🔎
              </span>

              {/* Campo de búsqueda. */}
              <input
                type="text"
                placeholder="¿Qué quieres comer?"
                value={busqueda}
                onChange={(event) =>
                  setBusqueda(event.target.value)
                }
              />

              {/* Botón para buscar. */}
              <button
                onClick={verCafeterias}
              >
                Buscar
              </button>

            </div>

            {/* Botón principal. */}
            <button
              className="primary-button"
              onClick={verCafeterias}
            >
              Ver cafeterías
              <span>→</span>
            </button>

          </div>


          {/* Elemento visual del hero. */}
          <div className="hero-visual">

            <div className="food-card">

              <div className="food-card-icon">
                🍱
              </div>

              <div>
                <strong>
                  Tu pedido está cerca
                </strong>

                <p>
                  Entrega dentro del campus
                </p>
              </div>

              <div className="status-dot">
                ✓
              </div>

            </div>

            <div className="hero-food">
              🌮
            </div>

            <div className="floating-card rating-card">

              <span>
                ⭐
              </span>

              <div>
                <strong>
                  4.9
                </strong>

                <small>
                  Excelente servicio
                </small>
              </div>

            </div>

            <div className="floating-card time-card">

              <span>
                🕐
              </span>

              <div>
                <strong>
                  10-15 min
                </strong>

                <small>
                  Tiempo estimado
                </small>
              </div>

            </div>

          </div>

        </section>


        {/* ========================= */}
        {/* CATEGORÍAS                 */}
        {/* ========================= */}

        <section className="categories section">

          <div className="section-heading">

            <div>
              <span className="eyebrow">
                EXPLORA
              </span>

              <h2>
                ¿Qué se te antoja?
              </h2>
            </div>

            <button
              className="text-button"
              onClick={() => {
                setCategoriaSeleccionada("Todas");
                verCafeterias();
              }}
            >
              Ver todo →
            </button>

          </div>

          <div className="category-grid">

            {categorias.map((categoria) => (

              <button
                key={categoria.nombre}
                className="category-card"
                onClick={() => {
                  setCategoriaSeleccionada(categoria.nombre);
                  verCafeterias();
                }}
              >

                <span className="category-icon">
                  {categoria.icono}
                </span>

                <span>
                  {categoria.nombre}
                </span>

              </button>

            ))}

          </div>

        </section>


        {/* ========================= */}
        {/* CAFETERÍAS                 */}
        {/* ========================= */}

        <section
          id="cafeterias"
          className="cafeterias section"
        >

          <div className="section-heading">

            <div>

              <span className="eyebrow">
                CERCA DE TI
              </span>

              <h2>
                Cafeterías disponibles
              </h2>

            </div>

            <span className="availability">
              ● Abiertas ahora
            </span>

          </div>


          {/* Si no hay resultados mostramos un mensaje. */}
          {cafeteriasFiltradas.length === 0 ? (

            <div className="empty-state">

              <span>
                🔎
              </span>

              <h3>
                No encontramos resultados
              </h3>

              <p>
                Intenta buscar otra cafetería o comida.
              </p>

            </div>

          ) : (

            <div className="restaurant-grid">

              {cafeteriasFiltradas.map((cafeteria) => (

                <article
                  className="restaurant-card"
                  key={cafeteria.id}
                >

                  {/* Imagen temporal de la cafetería. */}
                  <div className="restaurant-image">

                    <span>
                      {cafeteria.icono}
                    </span>

                    <div className="open-badge">
                      Abierto
                    </div>

                  </div>

                  {/* Información de la cafetería. */}
                  <div className="restaurant-content">

                    <div className="restaurant-title">

                      <h3>
                        {cafeteria.nombre}
                      </h3>

                      <span>
                        ⭐ {cafeteria.rating}
                      </span>

                    </div>

                    <p>
                      {cafeteria.descripcion}
                    </p>

                    <div className="restaurant-meta">

                      <span>
                        🕐 {cafeteria.tiempo}
                      </span>

                      <span>
                        📍 CUTlaquepaque
                      </span>

                    </div>

                    <button
                      className="restaurant-button"
                    >
                      Ver menú
                      <span>→</span>
                    </button>

                  </div>

                </article>

              ))}

            </div>

          )}

        </section>


        {/* ========================= */}
        {/* PROPUESTA DE VALOR         */}
        {/* ========================= */}

        <section className="benefits section">

          <div className="benefits-content">

            <span className="eyebrow">
              CUTLAEXPRESS
            </span>

            <h2>
              Come bien.
              <br />
              Aprovecha tu tiempo.
            </h2>

            <p>
              Diseñamos CUTlaexpress para que pedir
              comida dentro de la universidad sea
              rápido, sencillo y cómodo.
            </p>

          </div>


          <div className="benefits-grid">

            <div className="benefit">

              <span>
                ⚡
              </span>

              <h3>
                Rápido
              </h3>

              <p>
                Realiza tu pedido sin filas.
              </p>

            </div>


            <div className="benefit">

              <span>
                📍
              </span>

              <h3>
                Dentro del campus
              </h3>

              <p>
                Pensado para CUTlaquepaque.
              </p>

            </div>


            <div className="benefit">

              <span>
                🔒
              </span>

              <h3>
                Seguro
              </h3>

              <p>
                Tus pedidos estarán protegidos.
              </p>

            </div>

          </div>

        </section>

      </main>


      {/* ========================= */}
      {/* FOOTER                     */}
      {/* ========================= */}

      <footer className="footer">

        <div>

          <div className="logo footer-logo">

            <span className="logo-icon">
              ⚡
            </span>

            <span>
              CUTla<span>express</span>
            </span>

          </div>

          <p>
            Tu comida. Más cerca.
          </p>

        </div>


        <div className="footer-links">

          <a href="#inicio">
            Inicio
          </a>

          <a href="#cafeterias">
            Cafeterías
          </a>

          <a href="#inicio">
            Ayuda
          </a>

        </div>


        <div className="footer-copy">

          © 2026 CUTlaexpress

        </div>

      </footer>

    </div>
  );
}

// Exportamos el componente para utilizarlo desde main.jsx.
export default App;