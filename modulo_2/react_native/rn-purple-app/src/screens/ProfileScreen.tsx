import React from "react";
import { View, Text, Image } from "react-native";
import GradientBg from "../components/GradientBg";
import GlassCard from "../components/GlassCard";
import AppButton from "../components/AppButton";
import { authStore } from "../store/auth";
import { logout } from "../services/auth.service";

export default function ProfileScreen({ navigation }: any) {
  const { email } = authStore.get();
  return (
    <GradientBg>
      <View style={{ flex:1, padding:16, gap:12 }}>
        <GlassCard style={{ alignItems:"center" }}>
          <Image source={{ uri: "https://i.pravatar.cc/150" }} style={{ width: 110, height: 110, borderRadius: 55, marginBottom: 10 }} />
          <Text style={{ color:"#fff", fontSize:20, fontWeight:"700" }}>John Smith</Text>
          <Text style={{ color:"#cfd" }}>{email ?? "user@example.com"}</Text>
        </GlassCard>
        <GlassCard>
          <Text style={{ color:"#fff", marginBottom:8 }}>Tus métricas</Text>
          <Text style={{ color:"#ddd" }}>Pedidos: 75 — Favoritos: 983 — Puntos: 5978</Text>
        </GlassCard>
        <AppButton label="Cerrar sesión" onPress={() => { logout(); navigation.replace("Auth"); }} />
      </View>
    </GradientBg>
  );
}