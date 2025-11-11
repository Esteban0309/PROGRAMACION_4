import api from "./api";
// FakeStore docs: https://fakestoreapi.com/docs
const BASE = "https://fakestoreapi.com";

export type Product = { id?: number; title: string; price: number; description: string; image?: string; category?: string; };

export async function listProducts(): Promise<Product[]> {
  const { data } = await api.get(`${BASE}/products`);
  return data;
}
export async function getProduct(id: number): Promise<Product> {
  const { data } = await api.get(`${BASE}/products/${id}`);
  return data;
}
export async function createProduct(p: Product): Promise<Product> {
  const { data } = await api.post(`${BASE}/products`, p);
  return data;
}
export async function updateProduct(id: number, p: Product): Promise<Product> {
  const { data } = await api.put(`${BASE}/products/${id}`, p);
  return data;
}
export async function removeProduct(id: number): Promise<void> {
  await api.delete(`${BASE}/products/${id}`);
}