import React, { createContext, useContext, useEffect, useMemo, useState } from "react";
import { authRepositoryImpl } from "../data/authRepositoryImpl";
import { makeAuthUseCases } from "../domain/usecases";
import { HttpError } from "../../../core/http/httpClient";

const useCases = makeAuthUseCases(authRepositoryImpl);

type AuthState = {
  isLoading: boolean;
  isAuthenticated: boolean;
  login(username: string, password: string): Promise<void>;
  register(username: string, email: string, password: string): Promise<void>;
  logout(): Promise<void>;
  getFriendlyError(e: unknown): string;
};

const AuthContext = createContext<AuthState | null>(null);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [isLoading, setIsLoading] = useState(true);
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  useEffect(() => {
    (async () => {
      const token = await useCases.getAccessToken();
      setIsAuthenticated(!!token);
      setIsLoading(false);
    })();
  }, []);

  const getFriendlyError = (e: unknown) => {
    if (e instanceof HttpError) {
      if (e.status === 401) return "Credenciales incorrectas.";
      if (e.status === 0) return "No hay conexión con el backend (URL o red).";
      return "Error del servidor.";
    }
    return "Ocurrió un error inesperado.";
  };

  const value = useMemo<AuthState>(() => ({
    isLoading,
    isAuthenticated,
    async login(username, password) {
      await useCases.login({ username, password });
      setIsAuthenticated(true);
    },
    async register(username, email, password) {
      await useCases.register({ username, email, password });
    },
    async logout() {
      await useCases.logout();
      setIsAuthenticated(false);
    },
    getFriendlyError,
  }), [isLoading, isAuthenticated]);

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error("useAuth debe usarse dentro de <AuthProvider />");
  return ctx;
}
