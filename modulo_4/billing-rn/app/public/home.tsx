import { router } from "expo-router";
import {
  View,
  Text,
  Pressable,
  StyleSheet,
  FlatList,
  ActivityIndicator,
  ScrollView,
  Image,
} from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { useMemo, useState } from "react";
import { useCatalog } from "../../src/features/catalog/presentation/useCatalogAdmin";

const FALLBACK_IMG = "https://via.placeholder.com/800x450.png?text=No+Image";

export default function PublicHomeScreen() {
  const {
    loading,
    error,
    categories,
    products,
    count,
    selectedCategory,
    setCategory,
    nextPage,
    prevPage,
    params,
    refresh,
  } = useCatalog();

  // Guardamos cuáles imágenes fallaron para no repetir errores
  const [broken, setBroken] = useState<Record<number, boolean>>({});

  const getImageUri = (id: number, url: string | null) => {
    if (!url) return FALLBACK_IMG;
    if (broken[id]) return FALLBACK_IMG;
    return url;
  };

  const onImgError = (id: number) => {
    setBroken((prev) => ({ ...prev, [id]: true }));
  };

  const pageSize = params.page_size ?? 10;
  const page = params.page ?? 1;

  const totalPages = useMemo(() => {
    return Math.max(1, Math.ceil((count || 0) / pageSize));
  }, [count, pageSize]);

  const canPrev = page > 1;
  const canNext = page < totalPages;

  return (
    <SafeAreaView style={styles.safe} edges={["top"]}>
      <View style={styles.container}>
        <Text style={styles.title}>Catálogo</Text>
        <Text style={styles.subtitle}>Categorías y productos (público)</Text>

        <View style={styles.authRow}>
          <Pressable style={styles.btnPrimary} onPress={() => router.push("/public/login")}>
            <Text style={styles.btnText}>Login</Text>
          </Pressable>

          <Pressable style={styles.btnOutline} onPress={() => router.push("/public/register")}>
            <Text style={styles.btnOutlineText}>Register</Text>
          </Pressable>

          <Pressable style={styles.btnGhost} onPress={() => refresh()}>
            <Text style={styles.btnGhostText}>Recargar</Text>
          </Pressable>
        </View>

        <Text style={styles.section}>Categorías</Text>

        <View style={styles.categoriesWrap}>
          <ScrollView
            horizontal
            showsHorizontalScrollIndicator={false}
            contentContainerStyle={styles.catRow}
          >
            <Pressable
              style={[styles.chip, selectedCategory === null && styles.chipActive]}
              onPress={() => setCategory(null)}
            >
              <Text style={[styles.chipText, selectedCategory === null && styles.chipTextActive]}>
                Todas
              </Text>
            </Pressable>

            {categories.map((c) => (
              <Pressable
                key={c.id}
                style={[styles.chip, selectedCategory === c.id && styles.chipActive]}
                onPress={() => setCategory(c.id)}
              >
                <Text style={[styles.chipText, selectedCategory === c.id && styles.chipTextActive]}>
                  {c.name}
                </Text>
              </Pressable>
            ))}
          </ScrollView>
        </View>

        <View style={styles.productsHeader}>
          <Text style={styles.section}>Productos</Text>
          <Text style={styles.meta}>
            {count} total • pág {page} / {totalPages}
          </Text>
        </View>

        <View style={styles.listWrap}>
          <FlatList
            data={products}
            keyExtractor={(item) => String(item.id)}
            contentContainerStyle={styles.listContent}
            renderItem={({ item }) => (
              <View style={styles.card}>
                <Image
                  source={{ uri: getImageUri(item.id, item.url_image) }}
                  style={styles.cardImage}
                  resizeMode="cover"
                  onError={() => onImgError(item.id)}
                />

                <View style={styles.cardBody}>
                  <View style={styles.cardTopRow}>
                    <Text style={styles.cardTitle}>{item.name}</Text>

                    <View style={styles.badge}>
                      <Text style={styles.badgeText}>{item.category_name}</Text>
                    </View>
                  </View>

                  <Text style={styles.cardSub}>
                    Stock: {item.stock} • Activo: {item.is_active ? "Sí" : "No"}
                  </Text>

                  <View style={styles.priceRow}>
                    <Text style={styles.priceLabel}>Precio</Text>
                    <Text style={styles.price}>${item.price}</Text>
                  </View>
                </View>
              </View>
            )}
            ListEmptyComponent={
              loading ? (
                <View style={styles.center}>
                  <ActivityIndicator />
                  <Text style={styles.muted}>Cargando...</Text>
                </View>
              ) : error ? (
                <View style={styles.center}>
                  <Text style={styles.error}>{error}</Text>
                </View>
              ) : (
                <View style={styles.center}>
                  <Text style={styles.muted}>No hay productos para mostrar.</Text>
                </View>
              )
            }
          />
        </View>

        <View style={styles.pager}>
          <Pressable
            style={[styles.btnOutlineSmall, !canPrev && styles.btnDisabled]}
            disabled={!canPrev}
            onPress={prevPage}
          >
            <Text style={[styles.btnOutlineText, !canPrev && styles.textDisabled]}>
              Anterior
            </Text>
          </Pressable>

          <Pressable
            style={[styles.btnPrimarySmall, !canNext && styles.btnDisabled]}
            disabled={!canNext}
            onPress={nextPage}
          >
            <Text style={[styles.btnText, !canNext && styles.textDisabledWhite]}>
              Siguiente
            </Text>
          </Pressable>
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, backgroundColor: "#ffffff" },

  container: { flex: 1, padding: 16, gap: 10 },

  title: { fontSize: 24, fontWeight: "900" },
  subtitle: { opacity: 0.8 },

  authRow: { flexDirection: "row", gap: 10, alignItems: "center", flexWrap: "wrap" },

  btnPrimary: {
    backgroundColor: "#2563eb",
    paddingVertical: 10,
    paddingHorizontal: 14,
    borderRadius: 10,
  },
  btnPrimarySmall: {
    backgroundColor: "#2563eb",
    paddingVertical: 10,
    paddingHorizontal: 14,
    borderRadius: 10,
  },
  btnText: { color: "white", fontWeight: "800" },

  btnOutline: {
    borderWidth: 1,
    borderColor: "#30363d",
    paddingVertical: 10,
    paddingHorizontal: 14,
    borderRadius: 10,
  },
  btnOutlineSmall: {
    borderWidth: 1,
    borderColor: "#30363d",
    paddingVertical: 10,
    paddingHorizontal: 14,
    borderRadius: 10,
  },
  btnOutlineText: { color: "#111827", fontWeight: "800" },

  btnGhost: { paddingVertical: 10, paddingHorizontal: 10, borderRadius: 10 },
  btnGhostText: { color: "#6b7280", fontWeight: "700" },

  section: { marginTop: 6, fontWeight: "900", fontSize: 14 },
  meta: { opacity: 0.7, fontSize: 12 },

  categoriesWrap: { height: 56, justifyContent: "center" },
  catRow: { gap: 10, paddingVertical: 6, paddingRight: 6 },

  chip: {
    height: 44,
    minWidth: 92,
    paddingHorizontal: 14,
    borderWidth: 1,
    borderColor: "#30363d",
    borderRadius: 999,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  chipActive: {
    backgroundColor: "rgba(37,99,235,0.12)",
    borderColor: "rgba(37,99,235,0.55)",
  },
  chipText: { fontWeight: "800", color: "#111827" },
  chipTextActive: { color: "#0b3aa8" },

  productsHeader: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },

  listWrap: { flex: 1 },
  listContent: { paddingBottom: 84 },

  card: {
    borderWidth: 1,
    borderColor: "#30363d",
    borderRadius: 12,
    overflow: "hidden",
    marginBottom: 12,
    backgroundColor: "#0b1220",
  },
  cardImage: { width: "100%", height: 175, backgroundColor: "#0b1220" },

  cardBody: { padding: 12, gap: 8 },
  cardTopRow: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    gap: 10,
  },
  cardTitle: { fontWeight: "900", fontSize: 16, flex: 1, color: "white" },
  cardSub: { opacity: 0.85, color: "rgba(255,255,255,0.85)" },

  badge: {
    borderWidth: 1,
    borderColor: "rgba(88,166,255,0.45)",
    backgroundColor: "rgba(88,166,255,0.16)",
    paddingVertical: 6,
    paddingHorizontal: 10,
    borderRadius: 999,
  },
  badgeText: { fontWeight: "800", fontSize: 12, opacity: 0.95, color: "white" },

  priceRow: {
    marginTop: 2,
    paddingTop: 10,
    borderTopWidth: 1,
    borderTopColor: "rgba(255,255,255,0.08)",
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  priceLabel: { opacity: 0.7, fontWeight: "700", color: "rgba(255,255,255,0.85)" },
  price: { fontWeight: "900", fontSize: 18, color: "white" },

  pager: {
    position: "absolute",
    left: 16,
    right: 16,
    bottom: 12,
    flexDirection: "row",
    justifyContent: "space-between",
    gap: 10,
  },

  btnDisabled: { opacity: 0.35 },
  textDisabled: { color: "#9ca3af" },
  textDisabledWhite: { color: "rgba(255,255,255,0.75)" },

  center: { alignItems: "center", marginTop: 18, gap: 8 },
  muted: { opacity: 0.7, color: "#111827" },
  error: { color: "#ef4444", fontWeight: "700", textAlign: "center" },
});
