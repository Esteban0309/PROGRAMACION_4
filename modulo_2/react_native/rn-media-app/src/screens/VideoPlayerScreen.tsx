import React, { useState } from "react";
import { ScrollView, Text, TextInput, View } from "react-native";
import AvPlayer from "../components/AvPlayer";
import colors from "../theme/colors";

const DEFAULT_URL = "https://d23dyxeqlo5psv.cloudfront.net/big_buck_bunny.mp4";

export default function VideoPlayerScreen() {
  const [url, setUrl] = useState(DEFAULT_URL);

  return (
    <ScrollView style={{ backgroundColor: colors.bg }} contentContainerStyle={{ padding: 16, gap: 16 }}>
      <Text style={{ color: colors.primary, fontSize: 20 }}>Video remoto</Text>

      <Text style={{ color: colors.text }}>Pega una URL de video (mp4, HLS, etc.):</Text>
      <TextInput
        value={url}
        onChangeText={setUrl}
        autoCapitalize="none"
        autoCorrect={false}
        placeholder="https://..."
        placeholderTextColor={colors.subtle}
        style={{ color: colors.text, borderColor: colors.border, borderWidth: 1, borderRadius: 10, paddingHorizontal: 12, paddingVertical: 10, backgroundColor: colors.card }}
      />

      <AvPlayer source={{ uri: url }} useNativeControls autoPlay />

      <View>
        <Text style={{ color: colors.subtle, marginTop: 8 }}>Tip: para HLS (m3u8) usa una URL pública de demo.</Text>
      </View>
    </ScrollView>
  );
}