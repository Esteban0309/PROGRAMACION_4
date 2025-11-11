import React from "react";
import { View, Text, ScrollView } from "react-native";
import GradientBg from "../components/GradientBg";
import GlassCard from "../components/GlassCard";

export default function HomeScreen() {
  return (
    <GradientBg>
      <ScrollView contentContainerStyle={{ padding: 16, gap: 12 }}>
        <GlassCard>
          <Text style={{ color: "#fff", fontSize: 20, fontWeight: "700", marginBottom: 6 }}>Noticias</Text>
          <Text style={{ color: "#ddd" }}>Texto de ejemplo tipo “card” con efecto glass. Añade más tarjetas para simular el feed.</Text>
        </GlassCard>
        <GlassCard><Text style={{ color: "#fff" }}>Atajos: Productos, Perfil, Ajustes.</Text></GlassCard>
      </ScrollView>
    </GradientBg>
  );
}
