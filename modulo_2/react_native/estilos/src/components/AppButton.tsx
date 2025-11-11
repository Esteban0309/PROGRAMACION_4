import React from "react";
import { Pressable, Text, StyleSheet, ViewStyle } from "react-native";
import colors from "../theme/colors";
import spacing from "../theme/spacing";

type Props = {
  label: string;
  onPress: () => void;
  style?: ViewStyle;
  variant?: "primary" | "outline";
};

export default function AppButton({ label, onPress, style, variant = "primary" }: Props) {
  return (
    <Pressable
      onPress={onPress}
      style={({ pressed }) => [
        styles.base,
        variant === "outline" ? styles.outline : styles.primary,
        pressed && { opacity: 0.85 },
        style,
      ]}
      android_ripple={{ color: "#2f81f7" }}
    >
      <Text style={variant === "outline" ? styles.textOutline : styles.text}>{label}</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  base: {
    borderRadius: 10,
    paddingVertical: spacing.md,
    paddingHorizontal: spacing.xl,
    alignItems: "center",
    justifyContent: "center",
    marginVertical: spacing.sm,
  },
  primary: {
    backgroundColor: colors.primary,
  },
  outline: {
    borderWidth: 1,
    borderColor: colors.primary,
    backgroundColor: "transparent",
  },
  text: {
    color: "#0d1117",
    fontWeight: "bold",
  },
  textOutline: {
    color: colors.primary,
    fontWeight: "bold",
  },
});