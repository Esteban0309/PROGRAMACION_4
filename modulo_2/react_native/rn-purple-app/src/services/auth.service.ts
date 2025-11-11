import api from "./api";
import { authStore } from "../store/auth";

// API pública: https://reqres.in
const BASE = "https://reqres.in/api";

export async function login(email: string, password: string) {
  const { data } = await api.post(`${BASE}/login`, { email, password });
  authStore.set({ token: data.token, email });
  return data;
}

export async function register(email: string, password: string) {
  const { data } = await api.post(`${BASE}/register`, { email, password });
  // Opcional: guardar token si devuelve
  authStore.set({ token: data.token ?? null, email });
  return data;
}

export function logout() {
  authStore.clear();
}