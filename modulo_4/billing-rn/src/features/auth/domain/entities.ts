export type Tokens = { access: string; refresh: string };

export type RegisterInput = {
  username: string;
  email: string;
  password: string;
};

export type LoginInput = {
  username: string;
  password: string;
};
