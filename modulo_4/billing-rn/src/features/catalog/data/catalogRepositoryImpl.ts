import type { CatalogRepository, ListProductsParams } from "../domain/repositories";
import type { Paginated, Product, Category } from "../domain/entities";
import { catalogApi, CategoryPayload, ProductPayload } from "./catalogApiDataSource";

export const catalogRepositoryImpl: CatalogRepository & {
  createCategory: (payload: CategoryPayload) => Promise<Category>;
  updateCategory: (id: number, payload: CategoryPayload) => Promise<Category>;
  deleteCategory: (id: number) => Promise<void>;

  createProduct: (payload: ProductPayload) => Promise<Product>;
  updateProduct: (id: number, payload: ProductPayload) => Promise<Product>;
  deleteProduct: (id: number) => Promise<void>;
} = {
  listCategories: () => catalogApi.listCategories(),
  listProducts: (params?: ListProductsParams): Promise<Paginated<Product>> =>
    catalogApi.listProducts(params),

  createCategory: (payload) => catalogApi.createCategory(payload),
  updateCategory: (id, payload) => catalogApi.updateCategory(id, payload),
  deleteCategory: (id) => catalogApi.deleteCategory(id),

  createProduct: (payload) => catalogApi.createProduct(payload),
  updateProduct: (id, payload) => catalogApi.updateProduct(id, payload),
  deleteProduct: (id) => catalogApi.deleteProduct(id),
};