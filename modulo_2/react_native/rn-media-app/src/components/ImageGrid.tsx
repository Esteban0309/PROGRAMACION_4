import React from "react";
import { Image, View } from "react-native";

export default function ImageGrid({ uris }: { uris: string[] }) {
  if (!uris?.length) return null;
  return (
    <View style={{ flexDirection: "row", flexWrap: "wrap", gap: 8 }}>
      {uris.map((uri) => (
        <Image
          key={uri}
          source={{ uri }}
          style={{ width: "31.5%", aspectRatio: 1, borderRadius: 10 }}
          resizeMode="cover"
        />
      ))}
    </View>
  );
}