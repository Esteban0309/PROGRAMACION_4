import type { Category, Paginated, Product } from "./entities";

export type ListProductsParams = {
  page?: number;
  page_size?: number;
  search?: string;
  category?: number; // id de categoría
  is_active?: boolean;
  ordering?: string; // ej: "price" o "-created_at"
};

export interface CatalogRepository {
  listCategories(): Promise<Category[]>;
  listProducts(params?: ListProductsParams): Promise<Paginated<Product>>;
}
