import { tokenStorage } from "../../../core/storage/tokenStorage";
import { AuthRepository } from "../domain/repositories";
import { LoginInput, RegisterInput, Tokens } from "../domain/entities";
import { authApi } from "./authApiDataSource";

export const authRepositoryImpl: AuthRepository = {
  async login(input: LoginInput): Promise<Tokens> {
    const tokens = await authApi.login(input);
    await tokenStorage.setTokens(tokens.access, tokens.refresh);
    return tokens;
  },

  async register(input: RegisterInput): Promise<void> {
    await authApi.register(input);
  },

  async logout(): Promise<void> {
    await tokenStorage.clear();
  },

  async getAccessToken() {
    return tokenStorage.getAccessToken();
  },
};
