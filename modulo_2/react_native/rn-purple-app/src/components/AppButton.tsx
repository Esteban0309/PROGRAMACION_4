import React from "react";
import { Pressable, Text } from "react-native";
import colors from "../theme/colors";

export default function AppButton({ label, onPress, outline = false }: { label: string; onPress: () => void; outline?: boolean; }) {
  return (
    <Pressable
      onPress={onPress}
      style={({ pressed }) => ({
        borderWidth: 1,
        borderColor: outline ? colors.primary : "transparent",
        backgroundColor: outline ? "transparent" : colors.primary,
        opacity: pressed ? 0.8 : 1,
        paddingVertical: 12, paddingHorizontal: 18, borderRadius: 12, alignItems: "center"
      })}
    >
      <Text style={{ color: outline ? colors.primary : "#fff", fontWeight: "600" }}>{label}</Text>
    </Pressable>
  );
}