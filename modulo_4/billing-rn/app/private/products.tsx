import React, { useMemo, useState } from "react";
import {
  Alert,
  FlatList,
  Modal,
  Pressable,
  Switch,
  Text,
  TextInput,
  View,
  ActivityIndicator,
} from "react-native";
import { PrivateHeader } from "../../src/components/PrivateHeader";
import type { Category, Product } from "../../src/features/catalog/domain/entities";
import { useCatalogAdmin } from "../../src/features/catalog/presentation/useCatalogAdmin";

type FormState = {
  id: number | null;
  name: string;
  slug: string;
  price: string;
  stock: string;
  is_active: boolean;
  category: number | null;
  url_image: string;
};

export default function ProductsScreen() {
  const {
    loading,
    error,
    categories,
    products,
    reloadAll,
    createProduct,
    updateProduct,
    deleteProduct,
  } = useCatalogAdmin();

  const [open, setOpen] = useState<boolean>(false);
  const [saving, setSaving] = useState<boolean>(false);
  const [form, setForm] = useState<FormState>({
    id: null,
    name: "",
    slug: "",
    price: "0.00",
    stock: "0",
    is_active: true,
    category: null,
    url_image: "",
  });

  const title = useMemo(
    () => (form.id ? "Editar producto" : "Nuevo producto"),
    [form.id]
  );

  const openNew = () => {
    setForm({
      id: null,
      name: "",
      slug: "",
      price: "0.00",
      stock: "0",
      is_active: true,
      category: null,
      url_image: "",
    });
    setOpen(true);
  };

  const openEdit = (p: Product) => {
    setForm({
      id: p.id ?? null,
      name: p.name ?? "",
      slug: p.slug ?? "",
      price: String(p.price ?? "0.00"),
      stock: String(p.stock ?? 0),
      is_active: !!p.is_active,
      category: (p as any).category ?? null,
      url_image: p.url_image ?? "",
    });
    setOpen(true);
  };

  const categoryLabel = useMemo(() => {
    if (form.category === null) return "Sin categoría";
    return (
      categories.find((c) => c.id === form.category)?.name ?? "Sin categoría"
    );
  }, [categories, form.category]);

  const nextCategoryId = (current: number | null) => {
    if (categories.length === 0) return null;
    if (current === null) return categories[0].id;
    const idx = categories.findIndex((c) => c.id === current);
    const next =
      idx >= 0 ? categories[(idx + 1) % categories.length] : categories[0];
    return next.id;
  };

  const onSave = async () => {
    if (!form.name.trim()) {
      Alert.alert("Validación", "El nombre es obligatorio.");
      return;
    }

    const priceNum = Number(form.price);
    if (Number.isNaN(priceNum) || priceNum < 0) {
      Alert.alert("Validación", "Precio inválido.");
      return;
    }

    const stockNum = Number(form.stock);
    if (!Number.isInteger(stockNum) || stockNum < 0) {
      Alert.alert("Validación", "Stock inválido (entero).");
      return;
    }

    setSaving(true);
    try {
      const payload = {
        name: form.name.trim(),
        slug: form.slug.trim() || null,
        price: form.price,
        stock: stockNum,
        is_active: form.is_active,
        category: form.category,
        url_image: form.url_image.trim() || null,
      };

      if (form.id) await updateProduct(form.id, payload);
      else await createProduct(payload);

      setOpen(false);
      await reloadAll();
    } catch (e: any) {
      Alert.alert("Error", e?.message ?? "No se pudo guardar.");
    } finally {
      setSaving(false);
    }
  };

  const onDelete = (id: number) => {
    Alert.alert("Confirmar", "¿Eliminar este producto?", [
      { text: "Cancelar", style: "cancel" },
      {
        text: "Eliminar",
        style: "destructive",
        onPress: async () => {
          try {
            await deleteProduct(id);
            await reloadAll();
          } catch (e: any) {
            Alert.alert("Error", e?.message ?? "No se pudo eliminar.");
          }
        },
      },
    ]);
  };

  return (
    <View style={{ flex: 1, backgroundColor: "#0d1117" }}>
      <PrivateHeader title="Productos" />

      <View style={{ flex: 1, padding: 16 }}>
        <Pressable
          onPress={openNew}
          style={{
            padding: 12,
            borderRadius: 10,
            backgroundColor: "#1f6feb",
            marginBottom: 12,
          }}
        >
          <Text
            style={{
              color: "white",
              textAlign: "center",
              fontWeight: "900",
            }}
          >
            Nuevo producto
          </Text>
        </Pressable>

        {loading ? (
          <View
            style={{
              flex: 1,
              alignItems: "center",
              justifyContent: "center",
            }}
          >
            <ActivityIndicator />
            <Text style={{ color: "#8b949e", marginTop: 8 }}>
              Cargando...
            </Text>
          </View>
        ) : error ? (
          <Text style={{ color: "#f85149", fontWeight: "900" }}>
            {error}
          </Text>
        ) : (
          <FlatList
            data={products}
            keyExtractor={(x) => String(x.id)}
            ItemSeparatorComponent={() => <View style={{ height: 10 }} />}
            renderItem={({ item }) => (
              <View
                style={{
                  backgroundColor: "#161b22",
                  borderRadius: 14,
                  borderWidth: 1,
                  borderColor: "#30363d",
                  padding: 12,
                }}
              >
                <Text
                  style={{
                    color: "#c9d1d9",
                    fontWeight: "900",
                    fontSize: 15,
                  }}
                  numberOfLines={1}
                >
                  {item.name}
                </Text>

                <Text style={{ color: "#8b949e", marginTop: 4 }}>
                  Stock: {item.stock} • Activo: {item.is_active ? "Sí" : "No"}
                </Text>

                <Text
                  style={{
                    color: "#58a6ff",
                    marginTop: 4,
                    fontWeight: "900",
                  }}
                >
                  ${Number(item.price ?? 0).toFixed(2)}
                </Text>

                <View style={{ flexDirection: "row", gap: 10, marginTop: 10 }}>
                  <Pressable
                    onPress={() => openEdit(item)}
                    style={{
                      flex: 1,
                      padding: 10,
                      borderRadius: 10,
                      backgroundColor: "#0b1220",
                      borderWidth: 1,
                      borderColor: "#30363d",
                    }}
                  >
                    <Text
                      style={{
                        color: "#58a6ff",
                        textAlign: "center",
                        fontWeight: "900",
                      }}
                    >
                      Editar
                    </Text>
                  </Pressable>

                  <Pressable
                    onPress={() => onDelete(item.id)}
                    style={{
                      flex: 1,
                      padding: 10,
                      borderRadius: 10,
                      backgroundColor: "#0b1220",
                      borderWidth: 1,
                      borderColor: "#30363d",
                    }}
                  >
                    <Text
                      style={{
                        color: "#f85149",
                        textAlign: "center",
                        fontWeight: "900",
                      }}
                    >
                      Eliminar
                    </Text>
                  </Pressable>
                </View>
              </View>
            )}
          />
        )}
      </View>

      <Modal
        visible={open}
        transparent
        animationType="fade"
        onRequestClose={() => setOpen(false)}
      >
        <View
          style={{
            flex: 1,
            backgroundColor: "rgba(0,0,0,0.6)",
            padding: 16,
            justifyContent: "center",
          }}
        >
          <View
            style={{
              backgroundColor: "#161b22",
              borderRadius: 14,
              borderWidth: 1,
              borderColor: "#30363d",
              padding: 14,
            }}
          >
            <Text style={{ color: "#c9d1d9", fontWeight: "900", fontSize: 16 }}>
              {title}
            </Text>

            <Text style={{ color: "#8b949e", marginTop: 10 }}>Nombre</Text>
            <TextInput
              value={form.name}
              onChangeText={(t) => setForm((p) => ({ ...p, name: t }))}
              placeholder="Ej: Router WiFi 6"
              placeholderTextColor="#8b949e"
              style={{
                marginTop: 6,
                borderWidth: 1,
                borderColor: "#30363d",
                backgroundColor: "#0d1117",
                color: "#c9d1d9",
                padding: 12,
                borderRadius: 10,
              }}
            />

            <Text style={{ color: "#8b949e", marginTop: 10 }}>Slug (opcional)</Text>
            <TextInput
              value={form.slug}
              onChangeText={(t) => setForm((p) => ({ ...p, slug: t }))}
              placeholder="Ej: router-wifi-6"
              placeholderTextColor="#8b949e"
              autoCapitalize="none"
              style={{
                marginTop: 6,
                borderWidth: 1,
                borderColor: "#30363d",
                backgroundColor: "#0d1117",
                color: "#c9d1d9",
                padding: 12,
                borderRadius: 10,
              }}
            />

            <Text style={{ color: "#8b949e", marginTop: 10 }}>Precio</Text>
            <TextInput
              value={form.price}
              onChangeText={(t) => setForm((p) => ({ ...p, price: t }))}
              placeholder="0.00"
              placeholderTextColor="#8b949e"
              keyboardType="decimal-pad"
              style={{
                marginTop: 6,
                borderWidth: 1,
                borderColor: "#30363d",
                backgroundColor: "#0d1117",
                color: "#c9d1d9",
                padding: 12,
                borderRadius: 10,
              }}
            />

            <Text style={{ color: "#8b949e", marginTop: 10 }}>Stock</Text>
            <TextInput
              value={form.stock}
              onChangeText={(t) => setForm((p) => ({ ...p, stock: t }))}
              placeholder="0"
              placeholderTextColor="#8b949e"
              keyboardType="number-pad"
              style={{
                marginTop: 6,
                borderWidth: 1,
                borderColor: "#30363d",
                backgroundColor: "#0d1117",
                color: "#c9d1d9",
                padding: 12,
                borderRadius: 10,
              }}
            />

            <Text style={{ color: "#8b949e", marginTop: 10 }}>Categoría</Text>
            <Pressable
              onPress={() =>
                setForm((p) => ({ ...p, category: nextCategoryId(p.category) }))
              }
              style={{
                marginTop: 6,
                padding: 12,
                borderRadius: 10,
                backgroundColor: "#0d1117",
                borderWidth: 1,
                borderColor: "#30363d",
              }}
            >
              <Text style={{ color: "#c9d1d9", fontWeight: "900" }}>
                {categoryLabel} (tocar para cambiar)
              </Text>
            </Pressable>

            <Text style={{ color: "#8b949e", marginTop: 10 }}>URL de imagen (opcional)</Text>
            <TextInput
              value={form.url_image}
              onChangeText={(t) => setForm((p) => ({ ...p, url_image: t }))}
              placeholder="https://..."
              placeholderTextColor="#8b949e"
              autoCapitalize="none"
              style={{
                marginTop: 6,
                borderWidth: 1,
                borderColor: "#30363d",
                backgroundColor: "#0d1117",
                color: "#c9d1d9",
                padding: 12,
                borderRadius: 10,
              }}
            />

            <View style={{ flexDirection: "row", alignItems: "center", gap: 10, marginTop: 12 }}>
              <Text style={{ color: "#8b949e" }}>Activo</Text>
              <Switch
                value={form.is_active}
                onValueChange={(v) => setForm((p) => ({ ...p, is_active: v }))}
              />
            </View>

            <View style={{ flexDirection: "row", gap: 10, marginTop: 14 }}>
              <Pressable
                onPress={() => setOpen(false)}
                style={{
                  flex: 1,
                  padding: 12,
                  borderRadius: 10,
                  backgroundColor: "#0d1117",
                  borderWidth: 1,
                  borderColor: "#30363d",
                }}
              >
                <Text style={{ color: "#8b949e", textAlign: "center", fontWeight: "900" }}>
                  Cancelar
                </Text>
              </Pressable>

              <Pressable
                onPress={onSave}
                disabled={saving}
                style={{
                  flex: 1,
                  padding: 12,
                  borderRadius: 10,
                  backgroundColor: saving ? "#30363d" : "#1f6feb",
                }}
              >
                <Text style={{ color: "white", textAlign: "center", fontWeight: "900" }}>
                  {saving ? "Guardando..." : "Guardar"}
                </Text>
              </Pressable>
            </View>
          </View>
        </View>
      </Modal>
    </View>
  );
}
