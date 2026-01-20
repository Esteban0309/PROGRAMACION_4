import axios, { AxiosError, AxiosInstance } from "axios";
import { ENV } from "../config/env";
import { tokenStorage } from "../storage/tokenStorage";

export type ApiErrorBody = unknown;

export class HttpError extends Error {
  constructor(
    public status: number,
    public body: ApiErrorBody,
    public original?: unknown
  ) {
    super(`HTTP ${status}`);
  }
}

function createHttpClient(): AxiosInstance {
  const client = axios.create({
    baseURL: ENV.API_BASE_URL,
    timeout: 15000,
    headers: { "Content-Type": "application/json" },
  });

  client.interceptors.request.use(async (config) => {
    const access = await tokenStorage.getAccessToken();
    if (access) {
      config.headers = config.headers ?? {};
      config.headers.Authorization = `Bearer ${access}`;
    }
    return config;
  });

  client.interceptors.response.use(
    (response) => response,
    async (error: AxiosError) => {
      const status = error.response?.status ?? 0;
      const body = error.response?.data;
      throw new HttpError(status, body, error);
    }
  );

  return client;
}

export const httpClient = createHttpClient();
