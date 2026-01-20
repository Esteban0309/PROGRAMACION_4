import { router } from "expo-router";
import { View, Text, TextInput, Pressable, StyleSheet } from "react-native";
import { useState } from "react";
import { useAuth } from "../../src/features/auth/presentation/authContext";

export default function RegisterScreen() {
  const { register, getFriendlyError } = useAuth();
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [msg, setMsg] = useState("");
  const [error, setError] = useState("");

  const onRegister = async () => {
    setError("");
    setMsg("");
    try {
      await register(username.trim(), email.trim(), password);
      setMsg("Cuenta creada. Ahora inicia sesión.");
      setTimeout(() => router.replace("/public/login"), 700);
    } catch (e: unknown) {
      setError(getFriendlyError(e));
      console.log("Register error:", e);
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Registro</Text>

      <TextInput
        placeholder="Username"
        style={styles.input}
        autoCapitalize="none"
        value={username}
        onChangeText={setUsername}
      />

      <TextInput
        placeholder="Email"
        style={styles.input}
        autoCapitalize="none"
        keyboardType="email-address"
        value={email}
        onChangeText={setEmail}
      />

      <TextInput
        placeholder="Password"
        style={styles.input}
        secureTextEntry
        value={password}
        onChangeText={setPassword}
      />

      {!!error && <Text style={styles.error}>{error}</Text>}
      {!!msg && <Text style={styles.msg}>{msg}</Text>}

      <Pressable style={styles.btnSuccess} onPress={onRegister}>
        <Text style={styles.btnText}>Crear cuenta</Text>
      </Pressable>

      <Pressable style={styles.btnLink} onPress={() => router.back()}>
        <Text style={styles.linkText}>Volver</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, padding: 20, justifyContent: "center", gap: 10 },
  title: { fontSize: 22, fontWeight: "700", marginBottom: 10 },
  input: {
    borderWidth: 1,
    borderColor: "#30363d",
    borderRadius: 10,
    padding: 12,
  },
  error: { color: "#f87171", marginTop: 4 },
  msg: { color: "#86efac", marginTop: 4 },
  btnSuccess: {
    backgroundColor: "#16a34a",
    padding: 14,
    borderRadius: 10,
    alignItems: "center",
    marginTop: 6,
  },
  btnText: { color: "white", fontWeight: "700" },
  btnLink: { paddingVertical: 8, alignItems: "center" },
  linkText: { color: "#2563eb", fontWeight: "600" },
});
