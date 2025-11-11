import React, { useState } from "react";
import { View, Text, Button } from "react-native";

export default function Perfil() {
  const [edad, setEdad] = useState(25);

  return (
    <View style={{ alignItems: "center", marginTop: 50 }}>
      <Text style={{ color: "#58a6ff", fontSize: 20 }}>
        Nombre: Francisco
      </Text>
      <Text style={{ color: "#c9d1d9" }}>
        Edad: {edad}
      </Text>
      <Button title="Cumplir años" onPress={() => setEdad(edad + 1)} />
    </View>
  );
}