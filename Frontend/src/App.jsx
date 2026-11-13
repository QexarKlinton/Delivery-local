
import { useEffect, useMemo, useState } from "react";
import "./index.css";

const API_URL = "http://localhost:4000/api";

const obtenerLista = (respuesta) => {
  if (Array.isArray(respuesta)) return respuesta;
  if (Array.isArray(respuesta?.data)) return respuesta.data;
  return [];
};

const obtenerIcono = (categoria) => {
  const texto = String(categoria ?? "").toLowerCase();

  if (texto.includes("taco") || texto.includes("mex")) return "🌮";
  if (texto.includes("pizza")) return "🍕";
  if (texto.includes("bebida") || texto.includes("agua")) return "🥤";
  if (texto.includes("snack") || texto.includes("postre")) return "🍟";
  if (texto.includes("café") || texto.includes("cafe")) return "☕";
  if (texto.includes("hamburgues")) return "🍔";

  return "🍽️";
};

function App() {
  const [busqueda, setBusqueda] = useState("");
  const [categoriaSeleccionada, setCategoriaSeleccionada] = useState("Todas");

  const [negocios, setNegocios] = useState([]);
  const [productos, setProductos] = useState([]);

  const [cargando, setCargando] = useState(true);
  const [error, setError] = useState("");

  const [negocioSeleccionado, setNegocioSeleccionado] = useState(null);
  const [variantes, setVariantes] = useState({});
  const [cargandoVariantes, setCargandoVariantes] = useState({});

  useEffect(() => {
    const cargarDatos = async () => {
      try {
        setCargando(true);
        setError("");

        const [respuestaNegocios, respuestaProductos] = await Promise.all([
          fetch(`${API_URL}/negocios`),
          fetch(`${API_URL}/productos`),
        ]);

        if (!respuestaNegocios.ok || !respuestaProductos.ok) {
          throw new Error("No fue posible obtener los datos del servidor.");
        }

        const datosNegocios = await respuestaNegocios.json();
        const datosProductos = await respuestaProductos.json();

        setNegocios(obtenerLista(datosNegocios));
        setProductos(obtenerLista(datosProductos));
      } catch (err) {
        console.error("Error al cargar los datos:", err);
        setError(
          "No pudimos conectar con el servidor. Verifica que el backend esté ejecutándose."
        );
      } finally {
        setCargando(false);
      }
    };

    cargarDatos();
  }, []);

  const categorias = useMemo(() => {
    const nombres = [
      ...new Set(
        negocios
          .map((negocio) => negocio.categoria)
          .filter(Boolean)
      ),
    ];

    return nombres.map((nombre) => ({
      nombre,
      icono: obtenerIcono(nombre),
    }));
  }, [negocios]);

  const negociosFiltrados = useMemo(() => {
    const texto = busqueda.trim().toLowerCase();

    return negocios.filter((negocio) => {
      const nombre = (negocio.nombre || "").toLowerCase();
      const descripcion = (negocio.descripcion || "").toLowerCase();
      const categoria = (negocio.categoria || "").toLowerCase();

      const coincideBusqueda =
        nombre.includes(texto) ||
        descripcion.includes(texto) ||
        categoria.includes(texto);

      const coincideCategoria =
        categoriaSeleccionada === "Todas" ||
        negocio.categoria === categoriaSeleccionada;

      return coincideBusqueda && coincideCategoria;
    });
  }, [negocios, busqueda, categoriaSeleccionada]);

  const irInicio = () => {
    document.getElementById("inicio")?.scrollIntoView({
      behavior: "smooth",
    });
  };

  const verNegocios = () => {
    document.getElementById("cafeterias")?.scrollIntoView({
      behavior: "smooth",
    });
  };

  const abrirMenu = (negocio) => {
    setNegocioSeleccionado(negocio);
    setVariantes({});
  };

  const cerrarMenu = () => {
    setNegocioSeleccionado(null);
  };

  const cargarVariantes = async (idProducto) => {
    if (variantes[idProducto]) return;

    try {
      setCargandoVariantes((actuales) => ({
        ...actuales,
        [idProducto]: true,
      }));

      const respuesta = await fetch(
        `${API_URL}/productos/${idProducto}/variantes`
      );

      if (!respuesta.ok) {
        throw new Error("No se pudieron consultar las variantes.");
      }

      const datos = await respuesta.json();

      setVariantes((actuales) => ({
        ...actuales,
        [idProducto]: obtenerLista(datos),
      }));
    } catch (err) {
      console.error("Error al cargar variantes:", err);

      setVariantes((actuales) => ({
        ...actuales,
        [idProducto]: [],
      }));
    } finally {
      setCargandoVariantes((actuales) => ({
        ...actuales,
        [idProducto]: false,
      }));
    }
  };

  const productosDelNegocio = negocioSeleccionado
    ? productos.filter(
        (producto) =>
          Number(producto.id_negocio) ===
          Number(negocioSeleccionado.id_negocio)
      )
    : [];

  return (
    <div className="app">
      <header className="navbar">
        <button className="logo" onClick={irInicio}>
          <span className="logo-icon">⚡</span>
          <span>
            <span>Delivery Local</span>
          </span>
        </button>

        <nav className="nav-links">
          <button onClick={irInicio}>Inicio</button>
          <button onClick={verNegocios}>Negocios</button>
          <button
            onClick={() =>
              document.getElementById("beneficios")?.scrollIntoView({
                behavior: "smooth",
              })
            }
          >
            ¿Cómo funciona?
          </button>
        </nav>

        <div className="nav-actions">
          <button className="icon-button" aria-label="Carrito">
            🛒
          </button>
          <button className="user-button">
            👤 <span>Ingresar</span>
          </button>
        </div>
      </header>

      <main>
        <section id="inicio" className="hero">
          <div className="hero-content">
            <div className="hero-badge">
              ⚡ Delivery dentro de CUTlaquepaque
            </div>

            <h1>
              Tu comida.
              <br />
              <span>Más cerca.</span>
            </h1>

            <p>
              Pide comida desde tu celular o computadora y recibe tu pedido
              dentro de CUTlaquepaque sin hacer filas ni perder tiempo.
            </p>

            <div className="search-box">
              <span className="search-icon">🔎</span>
              <input
                type="text"
                placeholder="¿Qué quieres comer o dónde quieres pedir?"
                value={busqueda}
                onChange={(event) => setBusqueda(event.target.value)}
              />
              <button onClick={verNegocios}>Buscar</button>
            </div>

            <button className="primary-button" onClick={verNegocios}>
              Ver negocios <span>→</span>
            </button>
          </div>

          <div className="hero-visual">
            <div className="food-card">
              <div className="food-card-icon">🍱</div>
              <div>
                <strong>Tu pedido está cerca</strong>
                <p>Entrega dentro del campus</p>
              </div>
              <div className="status-dot">✓</div>
            </div>

            <div className="hero-food">🌮</div>

            <div className="floating-card rating-card">
              <span>⭐</span>
              <div>
                <strong>Comida local</strong>
                <small>Encuentra tus opciones</small>
              </div>
            </div>

            <div className="floating-card time-card">
              <span>🕐</span>
              <div>
                <strong>Fácil y rápido</strong>
                <small>Desde tu campus</small>
              </div>
            </div>
          </div>
        </section>

        <section className="categories section">
          <div className="section-heading">
            <div>
              <span className="eyebrow">EXPLORA</span>
              <h2>¿Qué se te antoja?</h2>
            </div>

            <button
              className="text-button"
              onClick={() => {
                setCategoriaSeleccionada("Todas");
                verNegocios();
              }}
            >
              Ver todo →
            </button>
          </div>

          <div className="category-grid">
            {categorias.map((categoria) => (
              <button
                key={categoria.nombre}
                className={`category-card ${
                  categoriaSeleccionada === categoria.nombre
                    ? "category-selected"
                    : ""
                }`}
                onClick={() => {
                  setCategoriaSeleccionada(categoria.nombre);
                  verNegocios();
                }}
              >
                <span className="category-icon">{categoria.icono}</span>
                <span>{categoria.nombre}</span>
              </button>
            ))}
          </div>
        </section>

        <section id="cafeterias" className="cafeterias section">
          <div className="section-heading">
            <div>
              <span className="eyebrow">CERCA DE TI</span>
              <h2>Negocios disponibles</h2>
            </div>

            <span className="availability">
              ● Información de la base de datos
            </span>
          </div>

          {cargando ? (
            <div className="empty-state">
              <span>⏳</span>
              <h3>Cargando negocios...</h3>
              <p>Estamos consultando la información del servidor.</p>
            </div>
          ) : error ? (
            <div className="empty-state">
              <span>⚠️</span>
              <h3>No se pudo conectar</h3>
              <p>{error}</p>
              <button
                className="restaurant-button"
                onClick={() => window.location.reload()}
              >
                Intentar nuevamente
              </button>
            </div>
          ) : negociosFiltrados.length === 0 ? (
            <div className="empty-state">
              <span>🔎</span>
              <h3>No encontramos resultados</h3>
              <p>Intenta buscar otro negocio o seleccionar otra categoría.</p>
              <button
                className="restaurant-button"
                onClick={() => {
                  setBusqueda("");
                  setCategoriaSeleccionada("Todas");
                }}
              >
                Mostrar todos
              </button>
            </div>
          ) : (
            <div className="restaurant-grid">
              {negociosFiltrados.map((negocio) => (
                <article
                  className="restaurant-card"
                  key={negocio.id_negocio}
                >
                  <div className="restaurant-image">
                    {negocio.logo_url ? (
                      <img
                        src={negocio.logo_url}
                        alt={negocio.nombre}
                        className="business-logo"
                      />
                    ) : (
                      <span>{obtenerIcono(negocio.categoria)}</span>
                    )}

                    <div className="open-badge">
                      {negocio.activo === 0 ? "Inactivo" : "Disponible"}
                    </div>
                  </div>

                  <div className="restaurant-content">
                    <div className="restaurant-title">
                      <h3>{negocio.nombre}</h3>
                      <span>🍽️</span>
                    </div>

                    <p>
                      {negocio.descripcion ||
                        "Conoce los productos de este negocio."}
                    </p>

                    <div className="restaurant-meta">
                      <span>
                        🏷️ {negocio.categoria || "Sin categoría"}
                      </span>
                      {negocio.direccion && (
                        <span>📍 {negocio.direccion}</span>
                      )}
                      {negocio.horario_atencion && (
                        <span>🕐 {negocio.horario_atencion}</span>
                      )}
                    </div>

                    <button
                      className="restaurant-button"
                      onClick={() => abrirMenu(negocio)}
                    >
                      Ver menú <span>→</span>
                    </button>
                  </div>
                </article>
              ))}
            </div>
          )}
        </section>

        <section id="beneficios" className="benefits section">
          <div className="benefits-content">
            <span className="eyebrow">DELIVERY LOCAL</span>
            <h2>
              Come bien.
              <br />
              Aprovecha tu tiempo.
            </h2>
            <p>
              Diseñamos CUTlaexpress para que pedir comida dentro de la
              universidad sea rápido, sencillo y cómodo.
            </p>
          </div>

          <div className="benefits-grid">
            <div className="benefit">
              <span>⚡</span>
              <h3>Rápido</h3>
              <p>Realiza tu pedido sin filas.</p>
            </div>

            <div className="benefit">
              <span>📍</span>
              <h3>Dentro del campus</h3>
              <p>Pensado para CUTlaquepaque.</p>
            </div>

            <div className="benefit">
              <span>🔒</span>
              <h3>Seguro</h3>
              <p>Tus pedidos estarán protegidos.</p>
            </div>
          </div>
        </section>
      </main>

      <footer className="footer">
        <div>
          <div className="logo footer-logo">
            <span className="logo-icon">⚡</span>
            <span>
             <span>Delivery Local</span>
            </span>
          </div>
          <p>Tu comida. Más cerca.</p>
        </div>

        <div className="footer-links">
          <a href="#inicio">Inicio</a>
          <a href="#cafeterias">Negocios</a>
          <a href="#beneficios">Ayuda</a>
        </div>

       <div className="footer-copy">© 2026 Delivery Local</div>
      </footer>

      {negocioSeleccionado && (
        <div className="menu-overlay" onClick={cerrarMenu}>
          <section
            className="menu-modal"
            onClick={(event) => event.stopPropagation()}
          >
            <div className="menu-header">
              <div>
                <span className="eyebrow">MENÚ DEL NEGOCIO</span>
                <h2>{negocioSeleccionado.nombre}</h2>
                <p>
                  {negocioSeleccionado.descripcion ||
                    "Productos disponibles"}
                </p>
              </div>

              <button
                className="menu-close"
                onClick={cerrarMenu}
                aria-label="Cerrar menú"
              >
                ✕
              </button>
            </div>

            {productosDelNegocio.length === 0 ? (
              <div className="empty-state">
                <span>🍽️</span>
                <h3>No hay productos registrados</h3>
                <p>Este negocio todavía no tiene productos disponibles.</p>
              </div>
            ) : (
              <div className="menu-products">
                {productosDelNegocio.map((producto) => (
                  <article className="menu-product" key={producto.id_producto}>
                    <div>
                      <h3>{producto.nombre}</h3>
                      {producto.descripcion && <p>{producto.descripcion}</p>}
                      <strong>
                        ${Number(producto.precio || 0).toFixed(2)}
                      </strong>
                    </div>

                    <button
                      className="variant-button"
                      onClick={() => cargarVariantes(producto.id_producto)}
                    >
                      {cargandoVariantes[producto.id_producto]
                        ? "Cargando..."
                        : "Ver variantes"}
                    </button>

                    {variantes[producto.id_producto] && (
                      <div className="variant-list">
                        {variantes[producto.id_producto].length === 0 ? (
                          <span>Este producto no tiene variantes registradas.</span>
                        ) : (
                          variantes[producto.id_producto].map((variante) => (
                            <div
                              className="variant-item"
                              key={variante.id_variante}
                            >
                              <span>{variante.nombre}</span>
                              <strong>
                                ${Number(variante.precio).toFixed(2)}
                              </strong>
                            </div>
                          ))
                        )}
                      </div>
                    )}
                  </article>
                ))}
              </div>
            )}
          </section>
        </div>
      )}
    </div>
  );
}

export default App;
