import axios from "axios";

const api = axios.create({
  baseURL: "https://jsonplaceholder.typicode.com",
  timeout: 10000,
});

// Interceptor de request (cabeceras, auth, etc.)
api.interceptors.request.use((config) => {
  // Ejemplo: agregar token si lo hubiera
  // const token = "TU_TOKEN";
  // if (token) config.headers.Authorization = `Bearer ${token}`;
  return config;
});

// Interceptor de errores para respuestas
api.interceptors.response.use(
  (res) => res,
  (error) => {
    const status = error?.response?.status;
    const message = error?.response?.data?.message || error.message || "Error de red";
    return Promise.reject({ status, message });
  }
);

export default api;