import React from "react";
import { ActivityIndicator, FlatList, Pressable, Text, View } from "react-native";
import { useFetch } from "../hooks/useFetch";
import type { User } from "../types/api";
import colors from "../theme/colors";

export default function UsersListScreen({ navigation }: any) {
  const { data, loading, error, retry } = useFetch<User[]>(
    "https://jsonplaceholder.typicode.com/users"
  );

  if (loading) {
    return (
      <View style={{ flex: 1, alignItems: "center", justifyContent: "center", backgroundColor: "#0d1117" }}>
        <ActivityIndicator size="large" color={colors.primary} />
        <Text style={{ color: colors.text, marginTop: 10 }}>Cargando usuarios...</Text>
      </View>
    );
  }

  if (error || !data) {
    return (
      <View style={{ flex: 1, alignItems: "center", justifyContent: "center", padding: 16, backgroundColor: "#0d1117" }}>
        <Text style={{ color: colors.danger, marginBottom: 12 }}>Error: {error ?? "sin datos"}</Text>
        <Pressable onPress={retry} style={{ borderColor: colors.primary, borderWidth: 1, padding: 10, borderRadius: 8 }}>
          <Text style={{ color: colors.primary }}>Reintentar</Text>
        </Pressable>
      </View>
    );
  }

  return (
    <FlatList
      style={{ backgroundColor: "#0d1117" }}
      contentContainerStyle={{ padding: 16 }}
      data={data}
      keyExtractor={(item) => String(item.id)}
      renderItem={({ item }) => (
        <Pressable
          onPress={() => navigation.navigate("UserDetail", { id: item.id })}
          style={({ pressed }) => ({
            backgroundColor: pressed ? "#1f2937" : "#161b22",
            padding: 16,
            borderRadius: 12,
            borderWidth: 1,
            borderColor: "#30363d",
            marginBottom: 10,
          })}
        >
          <Text style={{ color: colors.primary, fontWeight: "bold" }}>{item.name}</Text>
          <Text style={{ color: colors.text }}>@{item.username}</Text>
          <Text style={{ color: colors.subtle }}>{item.email}</Text>
        </Pressable>
      )}
    />
  );
}