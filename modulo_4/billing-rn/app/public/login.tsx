import { router } from "expo-router";
import { View, Text, TextInput, Pressable, StyleSheet } from "react-native";
import { useState } from "react";
import { useAuth } from "../../src/features/auth/presentation/authContext";

export default function LoginScreen() {
  const { login, getFriendlyError } = useAuth();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const onLogin = async () => {
    setError("");
    try {
      await login(username.trim(), password);
      router.replace("/private/home");
    } catch (e: unknown) {
      setError(getFriendlyError(e));
      console.log("Login error:", e);
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Login</Text>

      <TextInput
        placeholder="Username"
        style={styles.input}
        autoCapitalize="none"
        value={username}
        onChangeText={setUsername}
      />

      <TextInput
        placeholder="Password"
        style={styles.input}
        secureTextEntry
        value={password}
        onChangeText={setPassword}
      />

      {!!error && <Text style={styles.error}>{error}</Text>}

      <Pressable style={styles.btnPrimary} onPress={onLogin}>
        <Text style={styles.btnText}>Ingresar</Text>
      </Pressable>

      <Pressable style={styles.btnLink} onPress={() => router.push("/public/register")}>
        <Text style={styles.linkText}>¿No tienes cuenta? Regístrate</Text>
      </Pressable>

      <Text style={styles.hint}>
        Si falla conexión, revisa <Text style={{ fontWeight: "700" }}>ENV.API_BASE_URL</Text>.
      </Text>
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
  btnPrimary: {
    backgroundColor: "#2563eb",
    padding: 14,
    borderRadius: 10,
    alignItems: "center",
    marginTop: 6,
  },
  btnText: { color: "white", fontWeight: "700" },
  btnLink: { paddingVertical: 8, alignItems: "center" },
  linkText: { color: "#2563eb", fontWeight: "600" },
  hint: { marginTop: 12, opacity: 0.75, fontSize: 12, textAlign: "center" },
});
