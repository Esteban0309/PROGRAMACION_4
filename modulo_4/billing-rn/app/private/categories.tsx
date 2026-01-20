import React, { useMemo, useState } from "react";
import {
  Alert,
  FlatList,
  Modal,
  Pressable,
  Text,
  TextInput,
  View,
  ActivityIndicator,
} from "react-native";
import { PrivateHeader } from "../../src/components/PrivateHeader";
import type { Category } from "../../src/features/catalog/domain/entities";
import { useCatalogAdmin } from "../../src/features/catalog/presentation/useCatalogAdmin";

type FormState = {
  id: number | null;
  name: string;
  slug: string;
};

export default function CategoriesScreen() {
  const {
    loading,
    error,
    categories,
    reloadAll,
    createCategory,
    updateCategory,
    deleteCategory,
  } = useCatalogAdmin();

  const [open, setOpen] = useState<boolean>(false);
  const [saving, setSaving] = useState<boolean>(false);
  const [form, setForm] = useState<FormState>({
    id: null,
    name: "",
    slug: "",
  });

  const title = useMemo(
    () => (form.id ? "Editar categoría" : "Nueva categoría"),
    [form.id]
  );

  const openNew = () => {
    setForm({ id: null, name: "", slug: "" });
    setOpen(true);
  };

  const openEdit = (c: Category) => {
    setForm({
      id: c.id ?? null,
      name: c.name ?? "",
      slug: c.slug ?? "",
    });
    setOpen(true);
  };

  const onSave = async () => {
    if (!form.name.trim()) {
      Alert.alert("Validación", "El nombre es obligatorio.");
      return;
    }

    setSaving(true);
    try {
      const payload = {
        name: form.name.trim(),
        slug: form.slug.trim() || null,
      };

      if (form.id) {
        await updateCategory(form.id, payload);
      } else {
        await createCategory(payload);
      }

      setOpen(false);
      await reloadAll();
    } catch (e: any) {
      Alert.alert("Error", e?.message ?? "No se pudo guardar.");
    } finally {
      setSaving(false);
    }
  };

  const onDelete = (id: number) => {
    Alert.alert("Confirmar", "¿Eliminar esta categoría?", [
      { text: "Cancelar", style: "cancel" },
      {
        text: "Eliminar",
        style: "destructive",
        onPress: async () => {
          try {
            await deleteCategory(id);
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
      <PrivateHeader title="Categorías" />

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
            Nueva categoría
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
            data={categories}
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
                >
                  {item.name}
                </Text>

                <Text style={{ color: "#8b949e", marginTop: 4 }}>
                  slug: {item.slug ?? "—"}
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
              placeholder="Ej: Electrónica"
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
              placeholder="Ej: electronica"
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

