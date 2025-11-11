import React from "react";
import { View, Text, Button } from "react-native";
import Saludo from "./src/components/Saludo";
import SaludoProps from "./src/components/SaludoProps";
import Contador from "./src/components/Contador";
import Caja from "./src/components/Caja";
import Perfil from "./src/components/Perfil";
import AppNavigator from "./hooks/src/navigation/AppNavigator";

export default function App() {
  return (
    <AppNavigator/>
  );
}