import { LoginInput, RegisterInput, Tokens } from "./entities";

export interface AuthRepository {
  login(input: LoginInput): Promise<Tokens>;
  register(input: RegisterInput): Promise<void>;
  logout(): Promise<void>;
  getAccessToken(): Promise<string | null>;
}
