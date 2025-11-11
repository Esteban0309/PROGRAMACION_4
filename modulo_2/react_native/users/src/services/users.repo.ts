import api from "./api";
import type { User } from "../types/api";

const BASE = "/users";

export async function getUsers(): Promise<User[]> {
  const { data } = await api.get<User[]>(BASE);
  return data;
}

export async function getUser(id: number): Promise<User> {
  const { data } = await api.get<User>(`${BASE}/${id}`);
  return data;
}

export async function createUser(payload: User): Promise<User> {
  const { data } = await api.post<User>(BASE, payload);
  return data;
}

export async function updateUser(id: number, payload: User): Promise<User> {
  const { data } = await api.put<User>(`${BASE}/${id}`, payload);
  return data;
}

export async function deleteUser(id: number): Promise<void> {
  await api.delete(`${BASE}/${id}`);
}