import React from "react";
import { View, ViewStyle } from "react-native";
import colors from "../theme/colors";

export default function GlassCard({ children, style }: { children: React.ReactNode; style?: ViewStyle }) {
  return (
    <View
      style={[{
        backgroundColor: "rgba(255,255,255,0.06)",
        borderWidth: 1, borderColor: "rgba(255,255,255,0.15)",
        padding: 16, borderRadius: 16
      }, style]}
    >{children}</View>
  );
}