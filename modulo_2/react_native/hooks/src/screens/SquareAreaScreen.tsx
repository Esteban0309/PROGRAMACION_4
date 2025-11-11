import React, { useMemo, useState } from "react";
import { View, Text, TextInput } from "react-native";
import colors from "../theme/colors";

function parseNum(s: string): number | null {
  if (!s.trim()) return null;
  const v = Number(s.replace(",", "."));
  return Number.isFinite(v) ? v : null;
}

export default function SquareAreaScreen() {
  const [side, setSide] = useState("");

  const area = useMemo(() => {
    const s = parseNum(side);
    if (s === null || s < 0) return "—";
    return (s * s).toString();
  }, [side]);

  return (
    <View style={{ flex: 1, backgroundColor: "#0d1117", padding: 16 }}>
      <Text style={{ color: colors.primary, fontSize: 22, marginBottom: 12 }}>Área de cuadrado</Text>

      <TextInput
        keyboardType="decimal-pad"
        placeholder="Lado"
        placeholderTextColor="#8b949e"
        value={side}
        onChangeText={setSide}
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