import React, { createContext, useContext, useMemo } from "react";
import { useFetch } from "../hooks/useFetch";
import type { User } from "../types/api";

type UsersState = {
  users: User[] | null;
  loading: boolean;
  error: string | null;
  reload: () => void;
};

const UsersContext = createContext<UsersState | undefined>(undefined);

export function UsersProvider({ children }: { children: React.ReactNode }) {
  const { data, loading, error, retry } = useFetch<User[]>("https://jsonplaceholder.typicode.com/users");
  const value = useMemo(
    () => ({ users: data, loading, error, reload: retry }),
    [data, loading, error, retry]
  );

  return <UsersContext.Provider value={value}>{children}</UsersContext.Provider>;
}

export function useUsers() {
  const ctx = useContext(UsersContext);
  if (!ctx) throw new Error("useUsers debe usarse dentro de UsersProvider");
  return ctx;
}