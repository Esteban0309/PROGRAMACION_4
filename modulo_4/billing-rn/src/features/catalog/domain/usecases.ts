import type { CatalogRepository } from "./repositories";

export const makeCatalogUseCases = (repo: CatalogRepository) => ({
  listCategories: () => repo.listCategories(),
  listProducts: (params?: Parameters<CatalogRepository["listProducts"]>[0]) =>
    repo.listProducts(params),
});
