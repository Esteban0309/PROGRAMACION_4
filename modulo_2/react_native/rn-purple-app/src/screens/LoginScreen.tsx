import React, { useState } from "react";
import { View, Text, Alert } from "react-native";
import GradientBg from "../components/GradientBg";
import GlassCard from "../components/GlassCard";
import AppInput from "../components/AppInput";
import AppButton from "../components/AppButton";
import { login } from "../services/auth.service";
import colors from "../theme/colors";

export default function LoginScreen({ navigation }: any) {
  const [email, setEmail] = useState("eve.holt@reqres.in");
  const [password, setPassword] = useState("cityslicka");
  const [loading, setLoading] = useState(false);

  const onLogin = async () => {
    try {
      setLoading(true);
      await login(email, password);
      navigation.replace("App"); // pasa al Drawer + Tabs
    } catch (e: any) {
      Alert.alert("Error", e?.response?.data?.error ?? e.message ?? "No se pudo iniciar sesión");
    } finally { setLoading(false); }
  };

  return (
    <GradientBg>
      <View style={{ flex: 1, justifyContent: "center", padding: 24 }}>
        <GlassCard>
          <Text style={{ color: "#fff", fontSize: 22, fontWeight: "700", marginBottom: 12 }}>Iniciar sesión</Text>
          <AppInput label="Email" keyboardType="email-address" autoCapitalize="none" value={email} onChangeText={setEmail} />
          <AppInput label="Password" secureTextEntry value={password} onChangeText={setPassword} />
          <AppButton label={loading ? "Ingresando..." : "Sign in"} onPress={onLogin} />
          <Text style={{ color: colors.subtle, marginTop: 10 }} onPress={() => navigation.navigate("Register")}>¿No tienes cuenta? Regístrate</Text>
        </GlassCard>
      </View>
    </GradientBg>
  );
}