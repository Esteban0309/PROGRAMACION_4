import React from "react";
import { LinearGradient } from "expo-linear-gradient";
import { View } from "react-native";
import { gradientPurple } from "../theme/gradients";
import WaveSvg from "./WaveSvg";

export default function GradientBg({ children }: { children: React.ReactNode }) {
  return (
    <View style={{ flex: 1, backgroundColor: "#0b0620" }}>
      <LinearGradient
        colors={gradientPurple.colors}
        start={gradientPurple.start}
        end={gradientPurple.end}
        style={{ ...StyleSheet.absoluteFillObject }}
      />
      <WaveSvg opacity={0.35} />
      {children}
    </View>
  );
}
import { StyleSheet } from "react-native";