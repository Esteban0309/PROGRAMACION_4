import React, { useMemo, useState } from "react";
import { View, Text, TextInput, Pressable } from "react-native";
import colors from "../theme/colors";

function toNumber(s: string): number | null {
    if (s.trim() === "") return null;
    const n = Number(s.replace(",", ".")); // permite "1,5"
    return Number.isFinite(n) ? n : null;
}

export default function CalculatorScreen() {
    const [a, setA] = useState("");
    const [b, setB] = useState("");
    const [op, setOp] = useState<"+" | "-" | "*" | "/">("+");

    const result = useMemo(() => {
        const x = toNumber(a);
        const y = toNumber(b);
        if (x === null || y === null) return "—";
        switch (op) {
            case "+": return (x + y).toString();
            case "-": return (x - y).toString();
            case "*": return (x * y).toString();
            case "/": return y === 0 ? "∞ (no definido)" : (x / y).toString();
            default: return "—";
        }
    }, [a, b, op]);

    const Input = (props: any) => (
        <TextInput
            keyboardType="decimal-pad"
            placeholder={props.placeholder}
            placeholderTextColor="#8b949e"
            value={props.value}
            onChangeText={props.onChangeText}
            style={{
                color: colors.text,
                borderColor: "#30363d",
                borderWidth: 1,
                paddingHorizontal: 12,
                paddingVertical: 10,
                borderRadius: 10,
                backgroundColor: "#161b22",
                marginBottom: 10,
            }}
        />
    );

    const OpBtn = ({ value }: { value: typeof op }) => (
        <Pressable
            onPress={() => setOp(value)}
            style={({ pressed }) => ({
                paddingVertical: 10,
                paddingHorizontal: 16,
                borderRadius: 10,
                borderWidth: 1,
                borderColor: op === value ? colors.primary : "#30363d",
                backgroundColor: pressed ? "#1f2937" : "#161b22",
                marginRight: 8,
            })}
        >
            <Text style={{ color: op === value ? colors.primary : colors.text, fontWeight: "bold" }}>{value}</Text>
        </Pressable>
    );

    return (
        <View style={{ flex: 1, backgroundColor: "#0d1117", padding: 16 }}>
            <Text style={{ color: colors.primary, fontSize: 22, marginBottom: 12 }}>Calculadora</Text>

            <Input placeholder="Valor A" value={a} onChangeText={setA} />
            <Input placeholder="Valor B" value={b} onChangeText={setB} />

            <View style={{ flexDirection: "row", marginVertical: 8 }}>
                <OpBtn value="+" />
                <OpBtn value="-" />
                <OpBtn value="*" />
                <OpBtn value="/" />
            </View>

            <Text style={{ color: colors.text, fontSize: 18, marginTop: 12 }}>
                Resultado: <Text style={{ color: colors.primary, fontWeight: "bold" }}>{result}</Text>
            </Text>
        </View>
    );
}