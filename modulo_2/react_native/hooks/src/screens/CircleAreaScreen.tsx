import React, { useMemo, useState } from "react";
import { View, Text, TextInput } from "react-native";
import colors from "../theme/colors";

function n(s: string): number | null {
  if (!s.trim()) return null;
  const v = Number(s.replace(",", "."));
  return Number.isFinite(v) ? v : null;
}

export default function CircleAreaScreen() {
  const [radius, setRadius] = useState("");

  const area = useMemo(() => {
    const r = n(radius);
    if (r === null || r < 0) return "—";
    return (Math.PI * r * r).toFixed(4); // 4 decimales
  }, [radius]);

  return (
    <View style={{ flex: 1, backgroundColor: "#0d1117", padding: 16 }}>
      <Text style={{ color: colors.primary, fontSize: 22, marginBottom: 12 }}>Área de círculo</Text>

      <TextInput
        keyboardType="decimal-pad"
        placeholder="Radio"
        placeholderTextColor="#8b949e"
        value={radius}
        onChangeText={setRadius}
        style={{
          color: colors.text,
          borderColor: "#30363d",
          borderWidth: 1,
          paddingHorizontal: 12,
          paddingVertical: 10,
          borderRadius: 10,
          backgroundColor: "#161b22",
          marginBottom: 10,
        }}
      />

      <Text style={{ color: colors.text, fontSize: 18 }}>
        Área: <Text style={{ color: colors.primary, fontWeight: "bold" }}>{area}</Text>
      </Text>
    </View>
  );
}