import React from "react";
import { View, Text, Pressable } from "react-native";
import colors from "../theme/color";

function Item({ label, onPress }: { label: string; onPress: () => void }) {
    return (
        <Pressable
            onPress={onPress}
            style={({ pressed }) => ({
                backgroundColor: pressed ? "#1f2937" : "#161b22",
                padding: 16,
                borderRadius: 12,
                borderWidth: 1,
                borderColor: "#30363d",
                marginBottom: 12,
            })}
        >
            <Text style={{ color: colors.primary, fontWeight: "bold" }}>{label}</Text>
        </Pressable>
    );
}

export default function ToolsMenuScreen({ navigation }: any) {
    return (
        <View style={{ flex: 1, backgroundColor: "#0d1117", padding: 16 }}>
            <Text style={{ color: colors.primary, fontSize: 22, marginBottom: 16 }}>Herramientas</Text>

            <Item label="Calculadora básica" onPress={() => navigation.navigate("Calculator")} />
            <Item label="Área de un triángulo" onPress={() => navigation.navigate("TriangleArea")} />
            <Item label="Área de un círculo" onPress={() => navigation.navigate("CircleArea")} />
            <Item label="Área de un cuadrado" onPress={() => navigation.navigate("SquareArea")} />
        </View>
    );
}