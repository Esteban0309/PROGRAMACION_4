import api from "./api";
import { authStore } from "../store/auth";
import { Platform } from "react-native";

// API pública: https://reqres.in
const host = Platform.OS === "android" ? "10.0.2.2" : "localhost";
export const BASE = `http://${host}:8000/auth`;

export async function login(email: string, password: string) {
  const { data } = await api.post(`${BASE}/login`, { username: email, password });
  authStore.set({ token: data.token, email });
  return data;
}

export async function register(email: string, password: string) {
  try{
    const { data } = await api.post(`${BASE}/register`, { username:email, email, password });
    authStore.set({ token: data.token ?? null, email });
    return data;
  } catch (err:any){
    console.log('REGISTER ERROR=>', err.response?.status, err. response?.data||err.message);
    throw err  ;
  }
}

export function logout() {
  authStore.clear();
}