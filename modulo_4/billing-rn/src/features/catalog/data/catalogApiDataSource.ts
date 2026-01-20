import { httpClient } from "../../../core/http/httpClient";
import type { Category, Paginated, Product } from "../domain/entities";
import type { ListProductsParams } from "../domain/repositories";

export type CategoryPayload = { name: string; slug?: string | null };

export type ProductPayload = {
  name: string;
  slug?: string | null;
  price: string; // mantener string
  stock: number;
  is_active: boolean;
  category?: number | null; // id categoría
  url_image?: string | null;
};

export const catalogApi = {
  // ===== LISTADOS =====
  async listCategories() {
    const res = await httpClient.get<any>("/categories/");
    return Array.isArray(res.data) ? (res.data as Category[]) : (res.data.results as Category[]);
  },

  async listProducts(params?: ListProductsParams) {
    const res = await httpClient.get<Paginated<Product>>("/products/", { params });
    return res.data;
  },

  // ===== CRUD CATEGORÍAS =====
  async createCategory(payload: CategoryPayload) {
    const res = await httpClient.post<Category>("/categories/", payload);
    return res.data;
  },

  async updateCategory(id: number, payload: CategoryPayload) {
    const res = await httpClient.put<Category>(`/categories/${id}/`, payload);
    return res.data;
  },

  async deleteCategory(id: number) {
    await httpClient.delete(`/categories/${id}/`);
  },

  // ===== CRUD PRODUCTOS =====
  async createProduct(payload: ProductPayload) {
    const res = await httpClient.post<Product>("/products/", payload);
    return res.data;
  },

  async updateProduct(id: number, payload: ProductPayload) {
    const res = await httpClient.put<Product>(`/products/${id}/`, payload);
    return res.data;
  },

  async deleteProduct(id: number) {
    await httpClient.delete(`/products/${id}/`);
  },
};
