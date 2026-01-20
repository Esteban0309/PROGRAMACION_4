import { AuthRepository } from "./repositories";
import { LoginInput, RegisterInput } from "./entities";

export const makeAuthUseCases = (repo: AuthRepository) => ({
  login: (input: LoginInput) => repo.login(input),
  register: (input: RegisterInput) => repo.register(input),
  logout: () => repo.logout(),
  getAccessToken: () => repo.getAccessToken(),
});
