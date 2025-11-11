import React from "react";
import { View, Text, StyleSheet } from "react-native";
import MainLayout from "../../../layouts/MainLayout";
import colors from "../../../theme/colors";
import spacing from "../../../theme/spacing";

type Props = {
  route: { params: { id: string } };
};

export default function TaskDetailScreen({ route }: Props) {
  const { id } = route.params;

  // Aquí podrías buscar datos reales por id (API/Context)
  return (
    <MainLayout>
      <View style={styles.card}>
        <Text style={styles.title}>Detalle de Tarea</Text>
        <Text style={styles.text}>ID: {id}</Text>
        <Text style={styles.text}>Título: Crear ejemplo de navegación</Text>
        <Text style={styles.text}>Estado: Pendiente</Text>
      </View>
    </MainLayout>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: colors.surface,
    padding: spacing.xl,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: "#30363d",
  },
  title: {
    color: colors.primary,
    fontSize: 20,
    marginBottom: spacing.md,
  },
  text: {
    color: colors.text,
    marginBottom: spacing.sm,
  },
});