import React from "react";
import { ActivityIndicator, Text, View } from "react-native";
import { useFetch } from "../hooks/useFetch";
import type { User } from "../types/api";
import colors from "../theme/colors";
import spacing from "../theme/spacing";

type Props = {
  route: { params: { id: number } };
};

export default function UserDetailScreen({ route }: Props) {
  const { id } = route.params;
  const { data, loading, error, retry } = useFetch<User>(
    `https://jsonplaceholder.typicode.com/users/${id}`,
    { deps: [id] }
  );

  if (loading) {
    return (
      <View style={{ flex: 1, alignItems: "center", justifyContent: "center", backgroundColor: "#0d1117" }}>
        <ActivityIndicator size="large" color={colors.primary} />
      </View>
    );
  }

  if (error || !data) {
    return (
      <View style={{ flex: 1, alignItems: "center", justifyContent: "center", padding: spacing.lg, backgroundColor: "#0d1117" }}>
        <Text style={{ color: colors.danger, marginBottom: spacing.md }}>Error: {error ?? "sin datos"}</Text>
        <Text onPress={retry} style={{ color: colors.primary, textDecorationLine: "underline" }}>Reintentar</Text>
      </View>
    );
  }

  return (
    <View style={{ flex: 1, padding: spacing.xl, backgroundColor: "#0d1117" }}>
      <Text style={{ color: colors.primary, fontSize: 22, marginBottom: spacing.md }}>{data.name}</Text>
      <Text style={{ color: colors.text }}>Usuario: @{data.username}</Text>
      <Text style={{ color: colors.text }}>Email: {data.email}</Text>
    </View>
  );
}