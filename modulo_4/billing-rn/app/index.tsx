import { Redirect } from "expo-router";
import { Text } from "react-native";
import { useAuth } from "../src/features/auth/presentation/authContext";

export default function Index() {
  const { isLoading, isAuthenticated } = useAuth();
  if (isLoading) return <Text style={{ padding: 20 }}>Cargando...</Text>;
  return <Redirect href={isAuthenticated ? "/private/home" : "/public/login"} />;
}
