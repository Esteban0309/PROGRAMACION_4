import React, { useEffect, useState } from "react";
import { View, Text, FlatList, Pressable, ActivityIndicator, Alert } from "react-native";
import GradientBg from "../components/GradientBg";
import GlassCard from "../components/GlassCard";
import { listProducts, removeProduct } from "../services/products.service";
import colors from "../theme/colors";

export default function ProductsListScreen({ navigation }: any) {
  const [items, setItems] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  const load = async () => {
    setLoading(true);
    try {
      const data = await listProducts();
      setItems(data);
    } finally { setLoading(false); }
  };

  useEffect(() => { load(); }, []);

  if (loading) return (<GradientBg><View style={{ flex:1, alignItems:"center", justifyContent:"center" }}><ActivityIndicator color={colors.primary} size="large" /></View></GradientBg>);

  return (
    <GradientBg>
      <View style={{ flex:1, padding: 12 }}>
        <Pressable
          onPress={() => navigation.navigate("ProductForm")}
          style={{ alignSelf:"flex-end", borderColor: colors.primary, borderWidth: 1, paddingVertical: 8, paddingHorizontal: 12, borderRadius: 10, marginBottom: 8 }}
        >
          <Text style={{ color: colors.primary }}>+ Nuevo</Text>
        </Pressable>

        <FlatList
          data={items}
          keyExtractor={(it) => String(it.id)}
          ItemSeparatorComponent={() => <View style={{ height: 8 }} />}
          renderItem={({ item }) => (
            <GlassCard>
              <Text style={{ color: "#fff", fontWeight: "700" }}>{item.title}</Text>
              <Text style={{ color: colors.subtle }} numberOfLines={2}>{item.description}</Text>
              <View style={{ flexDirection:"row", gap:10, marginTop:10 }}>
                <Pressable
                  onPress={() => navigation.navigate("ProductForm", { id: item.id })}
                  style={{ borderColor: colors.primary, borderWidth: 1, paddingHorizontal: 10, paddingVertical: 6, borderRadius: 8 }}
                ><Text style={{ color: colors.primary }}>Editar</Text></Pressable>

                <Pressable
                  onPress={() => {
                    Alert.alert("Eliminar", "¿Seguro?", [
                      { text: "Cancelar", style: "cancel" },
                      { text: "Eliminar", style: "destructive", onPress: async () => { await removeProduct(item.id); load(); } }
                    ]);
                  }}
                  style={{ borderColor: colors.danger, borderWidth: 1, paddingHorizontal: 10, paddingVertical: 6, borderRadius: 8 }}
                ><Text style={{ color: colors.danger }}>Eliminar</Text></Pressable>
              </View>
            </GlassCard>
          )}
        />
      </View>
    </GradientBg>
  );
}