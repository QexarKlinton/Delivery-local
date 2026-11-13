import React from "react";

// Importamos ReactDOM para poder colocar nuestra aplicación dentro del HTML.
import ReactDOM from "react-dom/client";

// Importamos el componente principal de nuestra aplicación.
import App from "./App";

// Importamos los estilos globales de CUTlaexpress.
import "./index.css";

// Buscamos el elemento HTML con el identificador "root".
const root = document.getElementById("root");

// Creamos la aplicación React y la mostramos dentro del elemento root.
ReactDOM.createRoot(root).render(

  // StrictMode ayuda a detectar posibles problemas durante el desarrollo.
  <React.StrictMode>

    {/* Renderizamos el componente principal de CUTlaexpress. */}
    <App />

  </React.StrictMode>
);