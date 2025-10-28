import { useCallback, useEffect, useRef, useState } from "react";

type Options = {
  immediate?: boolean;         // Ejecutar en el primer render
  deps?: any[];                // Dependencias para relanzar
  requestInit?: RequestInit;   // Config adicional para fetch
};

export function useFetch<T = unknown>(url: string, { immediate = true, deps = [], requestInit }: Options = {}) {
  const [data, setData] = useState<T | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const abortRef = useRef<AbortController | null>(null);

  const run = useCallback(async () => {
    setLoading(true);
    setError(null);
    abortRef.current?.abort();
    const controller = new AbortController();
    abortRef.current = controller;

    try {
      const res = await fetch(url, { signal: controller.signal, ...requestInit });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const json = (await res.json()) as T;
      setData(json);
    } catch (err: any) {
      if (err.name !== "AbortError") setError(err.message ?? "Error desconocido");
    } finally {
      setLoading(false);
    }
  }, [url, requestInit]);

  useEffect(() => {
    if (immediate) run();
    return () => abortRef.current?.abort();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [run, ...deps]);

  const retry = useCallback(() => run(), [run]);

  return { data, loading, error, retry };
}