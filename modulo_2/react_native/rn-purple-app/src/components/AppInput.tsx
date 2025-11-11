import React from "react";
import { TextInput, View, Text, TextInputProps } from "react-native";
import colors from "../theme/colors";

export default function AppInput({ label, error, ...props }: { label: string; error?: string } & TextInputProps) {
  return (
    <View style={{ marginBottom: 14 }}>
      <Text style={{ color: colors.subtle, marginBottom: 6 }}>{label}</Text>
      <TextInput
        placeholderTextColor="#b9a9e0"
        style={{
          backgroundColor: "rgba(255,255,255,0.06)",
          borderWidth: 1, borderColor: "rgba(255,255,255,0.15)",
          color: colors.text, borderRadius: 12, paddingHorizontal: 12, paddingVertical: 10
        }}
        {...props}
      />
      {!!error && <Text style={{ color: colors.danger, marginTop: 4 }}>{error}</Text>}
    </View>
  );
}