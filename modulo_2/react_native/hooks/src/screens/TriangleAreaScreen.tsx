import React, { useMemo, useState } from "react";
import { View, Text, TextInput } from "react-native";
import colors from "../theme/colors";

function num(s: string): number | null {
  if (s.trim() === "") return null;
  const n = Number(s.replace(",", "."));
  return Number.isFinite(n) ? n : null;
}

export default function TriangleAreaScreen() {
  const [base, setBase] = useState("");
  const [height, setHeight] = useState("");

  const area = useMemo(() => {
    const b = num(base);
    const h = num(height);
    if (b === null || h === null || b < 0 || h < 0) return "—";
    return ((b * h) / 2).toString();
  }, [base, height]);

  const inputStyle = {
    color: colors.text,
    borderColor: "#30363d",
    borderWidth: 1,
    paddingHorizontal: 12,
    paddingVertical: 10,
    borderRadius: 10,
    backgroundColor: "#161b22",
    marginBottom: 10,
  } as const;

  return (
    <View style={{ flex: 1, backgroundColor: "#0d1117", padding: 16 }}>
      <Text style={{ color: colors.primary, fontSize: 22, marginBottom: 12 }}>Área de triángulo</Text>

      <TextInput
        keyboardType="decimal-pad"
        placeholder="Base"
        placeholderTextColor="#8b949e"
        value={base}
        onChangeText={setBase}
        style={inputStyle}
      />

      <TextInput
        keyboardType="decimal-pad"
        placeholder="Altura"
        placeholderTextColor="#8b949e"
        value={height}
        onChangeText={setHeight}
        style={inputStyle}
      />

      <Text style={{ color: colors.text, fontSize: 18 }}>
        Área: <Text style={{ color: colors.primary, fontWeight: "bold" }}>{area}</Text>
      </Text>
    </View>
  );
}