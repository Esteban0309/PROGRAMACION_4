export type Category = {
  id: number;
  name: string;
  slug: string;
  created_at: string;
  updated_at: string;
};

export type Product = {
  id: number;
  name: string;
  slug: string;
  price: string; // DRF Decimal -> string
  stock: number;
  is_active: boolean;
  url_image: string | null; // ✅ viene en tu API
  category_name: string;
  created_at: string;
  updated_at: string;
};

export type Paginated<T> = {
  count: number;
  next: string | null;
  previous: string | null;
  results: T[];
};
