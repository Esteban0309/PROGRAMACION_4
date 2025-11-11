import React from "react";
import { View, Text, StyleSheet } from "react-native";
import colors from "../../../theme/colors";
import spacing from "../../../theme/spacing";

type Props = {
  title: string;
  done?: boolean;
};

export default function TaskItem({ title, done = false }: Props) {
  return (
    <View style={[styles.card, done && styles.done]}>
      <Text style={styles.title}>{title}</Text>
      <Text style={styles.badge}>{done ? "Completada" : "Pendiente"}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: colors.surface,
    borderRadius: 12,
    padding: spacing.lg,
    marginBottom: spacing.md,
    borderWidth: 1,
    borderColor: "#30363d",
  },
  done: {
    borderColor: colors.success,
  },
  title: {
    color: colors.text,
    fontSize: 16,
    marginBottom: spacing.sm,
  },
  badge: {
    color: colors.subtle,
    fontSize: 12,
  },
});