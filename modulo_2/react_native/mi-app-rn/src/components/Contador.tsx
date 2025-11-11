import React, { useState } from "react";
import { View, Text, Button } from "react-native";

export default function Contador() {
  const [count, setCount] = useState(0);

  return (
    <View style={{ alignItems: "center" }}>
      <Text style={{ fontSize: 18, color: "#58a6ff" }}>
        Contador: {count}
      </Text>
      <Button title="Incrementar" onPress={() => setCount(count + 1)} />
    </View>
  );
}