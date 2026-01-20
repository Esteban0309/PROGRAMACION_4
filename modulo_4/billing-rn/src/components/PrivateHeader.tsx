import { router, Link } from "expo-router";
import { View, Text, Pressable } from "react-native";
import { useAuth } from "../features/auth/presentation/authContext";

export function PrivateHeader({ title }: { title: string }) {
  const { logout } = useAuth();

  const onLogout = async () => {
    await logout();
    router.replace("/public/home");
  };

  return (
    <View
      style={{
        paddingHorizontal: 14,
        paddingVertical: 12,
        borderBottomWidth: 1,
        borderBottomColor: "#30363d",
        backgroundColor: "#161b22",
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-between",
        gap: 10,
      }}
    >
      <View style={{ flex: 1 }}>
        <Text style={{ color: "#c9d1d9", fontSize: 14, fontWeight: "900" }} numberOfLines={1}>
          {title}
        </Text>

        <View style={{ flexDirection: "row", gap: 10, marginTop: 4, flexWrap: "wrap" }}>
          <Link href="/private/home" style={{ color: "#58a6ff", fontWeight: "800" }}>Inicio</Link>
          <Link href="/private/categories" style={{ color: "#58a6ff", fontWeight: "800" }}>Categorías</Link>
          <Link href="/private/products" style={{ color: "#58a6ff", fontWeight: "800" }}>Productos</Link>
        </View>
      </View>

      <Pressable
        onPress={onLogout}
        style={{
          paddingVertical: 8,
          paddingHorizontal: 12,
          borderRadius: 10,
          borderWidth: 1,
          borderColor: "#30363d",
          backgroundColor: "#0d1117",
        }}
      >
        <Text style={{ color: "#f85149", fontWeight: "900" }}>Salir</Text>
      </Pressable>
    </View>
  );
}