import { httpClient } from "../../../core/http/httpClient";
import { LoginInput, RegisterInput, Tokens } from "../domain/entities";

export const authApi = {
  async register(input: RegisterInput) {
    const res = await httpClient.post<{ username: string; email: string }>("/auth/register", input);
    return res.data;
  },

  async login(input: LoginInput) {
    const res = await httpClient.post<Tokens>("/auth/login", input);
    return res.data;
  },

  async refresh(refresh: string) {
    const res = await httpClient.post<{ access: string }>("/auth/refresh", { refresh });
    return res.data;
  },
};
