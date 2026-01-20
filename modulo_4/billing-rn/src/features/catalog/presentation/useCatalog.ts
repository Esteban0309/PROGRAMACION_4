import { useEffect, useMemo, useState } from "react";
import { catalogRepositoryImpl } from "../data/catalogRepositoryImpl";
import { makeCatalogUseCases } from "../domain/usecases";
import type { Category, Product } from "../domain/entities";
import type { ListProductsParams } from "../domain/repositories";

const useCases = makeCatalogUseCases(catalogRepositoryImpl);

export function useCatalog() {
  const [loading, setLoading] = useState(true);
  const [categories, setCategories] = useState<Category[]>([]);
  const [products, setProducts] = useState<Product[]>([]);
  const [count, setCount] = useState(0);
  const [error, setError] = useState("");

  const [params, setParams] = useState<ListProductsParams>({
    page: 1,
    page_size: 10,
    is_active: true,
    ordering: "-created_at",
  });

  const selectedCategory = params.category ?? null;

  const refresh = async (next?: Partial<ListProductsParams>) => {
    setLoading(true);
    setError("");
    try {
      const p = { ...params, ...(next ?? {}) };
      setParams(p);

      const [cats, prods] = await Promise.all([
        useCases.listCategories(),
        useCases.listProducts(p),
      ]);

      setCategories(cats);
      setProducts(prods.results);
      setCount(prods.count);
    } catch (e) {
      setError("No se pudo cargar el catálogo. Revisa ENV.API_BASE_URL o el backend.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    refresh();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return useMemo(
    () => ({
      loading,
      error,
      categories,
      products,
      count,
      selectedCategory,
      refresh,
      setCategory: (categoryId: number | null) =>
        refresh({ category: categoryId ?? undefined, page: 1 }),
      nextPage: () => refresh({ page: (params.page ?? 1) + 1 }),
      prevPage: () => refresh({ page: Math.max(1, (params.page ?? 1) - 1) }),
      params,
    }),
    [loading, error, categories, products, count, selectedCategory, params]
  );
}
