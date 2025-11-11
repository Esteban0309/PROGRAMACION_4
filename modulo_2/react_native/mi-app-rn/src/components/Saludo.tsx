import React from "react";
import { View, Text } from "react-native";

export default function Saludo() {
  return (
    <View style={{ padding: 20 }}>
      <Text style={{ fontSize: 20, color: "white" }}>
        ¡Hola desde mi primer componente!
      </Text>
    </View>
  );
}