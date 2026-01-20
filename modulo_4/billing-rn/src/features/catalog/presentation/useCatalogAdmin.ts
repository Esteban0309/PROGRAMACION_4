import { useEffect, useMemo, useState } from "react";
import { catalogRepositoryImpl } from "../data/catalogRepositoryImpl";
import type { Category, Product } from "../domain/entities";

type CategoryForm = { id: number | null; name: string; slug: string };
type ProductForm = {
  id: number | null;
  name: string;
  slug: string;
  price: string;
  stock: string; // input text
  is_active: boolean;
  category: number | null;
  url_image: string;
};

export function useCatalogAdmin() {
  const [loading, setLoading] = useState(true);
  const [categories, setCategories] = useState<Category[]>([]);
  const [products, setProducts] = useState<Product[]>([]);
  const [error, setError] = useState("");

  const reloadAll = async () => {
    setLoading(true);
    setError("");
    try {
      const [cats, prods] = await Promise.all([
        catalogRepositoryImpl.listCategories(),
        catalogRepositoryImpl.listProducts({ page: 1, page_size: 50, ordering: "-created_at" }),
      ]);
      setCategories(cats);
      setProducts(prods.results);
    } catch (e) {
      setError("No se pudo cargar el panel privado. Revisa el token o el backend.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    reloadAll();
  }, []);

  return useMemo(
    () => ({
      loading,
      error,
      categories,
      products,
      reloadAll,

      // ====== Categorías ======
      createCategory: (payload: { name: string; slug?: string | null }) =>
        catalogRepositoryImpl.createCategory(payload),

      updateCategory: (id: number, payload: { name: string; slug?: string | null }) =>
        catalogRepositoryImpl.updateCategory(id, payload),

      deleteCategory: (id: number) => catalogRepositoryImpl.deleteCategory(id),

      // ====== Productos ======
      createProduct: (payload: any) => catalogRepositoryImpl.createProduct(payload),
      updateProduct: (id: number, payload: any) => catalogRepositoryImpl.updateProduct(id, payload),
      deleteProduct: (id: number) => catalogRepositoryImpl.deleteProduct(id),
    }),
    [loading, error, categories, products]
  );
}