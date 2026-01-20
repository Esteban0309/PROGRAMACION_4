import { View, Text } from "react-native";
import { Link } from "expo-router";
import { PrivateHeader } from "../../src/components/PrivateHeader";

export default function PrivateHome() {
  return (
    <View style={{ flex: 1, backgroundColor: "#0d1117" }}>
      <PrivateHeader title="Panel privado" />

      <View style={{ flex: 1, padding: 16, justifyContent: "center", gap: 12 }}>
        <Text style={{ color: "#c9d1d9", fontSize: 20, fontWeight: "900" }}>Panel privado</Text>
        <Text style={{ color: "#8b949e" }}>Administra categorías y productos desde aquí.</Text>

        <Link href="/private/categories" style={{ color: "#58a6ff", fontWeight: "900" }}>Ir a Categorías →</Link>
        <Link href="/private/products" style={{ color: "#58a6ff", fontWeight: "900" }}>Ir a Productos →</Link>
      </View>
    </View>
  );
}