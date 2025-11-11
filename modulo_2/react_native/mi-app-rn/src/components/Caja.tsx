import React from "react";
import { StyleSheet, View, Text } from "react-native";

export default function Caja() {
  return (
    <View style={styles.box}>
      <Text style={styles.text}>Caja con estilo</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  box: {
    backgroundColor: "#1f6feb",
    padding: 20,
    borderRadius: 10,
    margin: 10,
  },
  text: {
    color: "white",
    fontWeight: "bold",
    textAlign: "center",
  },
});