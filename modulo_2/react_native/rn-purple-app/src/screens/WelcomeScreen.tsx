import React from "react";
import { View, Text, Image } from "react-native";
import GradientBg from "../components/GradientBg";
import GlassCard from "../components/GlassCard";
import AppButton from "../components/AppButton";

export default function WelcomeScreen({ navigation }: any) {
  return (
    <GradientBg>
      <View style={{ flex: 1, justifyContent: "center", padding: 24 }}>
        <GlassCard style={{ padding: 24, marginBottom: 16 }}>
          <Text style={{ color: "#fff", fontSize: 28, fontWeight: "700", marginBottom: 6 }}>Hello!</Text>
          <Text style={{ color: "#ddd" }}>Bienvenido a PurpleApp: navega con Tabs y Drawer, e inicia sesión para gestionar productos.</Text>
        </GlassCard>
        <View style={{ flexDirection: "row", gap: 12 }}>
          <View style={{ flex: 1 }}><AppButton label="Get Started" onPress={() => navigation.navigate("Login")} /></View>
          <View style={{ flex: 1 }}><AppButton label="Sign up" outline onPress={() => navigation.navigate("Register")} /></View>
        </View>
      </View>
    </GradientBg>
  );
}