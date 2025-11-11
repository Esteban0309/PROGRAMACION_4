import React, { useRef, useState } from "react";
import { ScrollView, Text, TextInput, View } from "react-native";
import YoutubePlayer, { YoutubeIframeRef } from "react-native-youtube-iframe";
import colors from "../theme/colors";

export default function YouTubeScreen() {
  const playerRef = useRef<YoutubeIframeRef>(null);
  const [videoId, setVideoId] = useState("dQw4w9WgXcQ");
  const [playing, setPlaying] = useState(true);

  return (
    <ScrollView style={{ backgroundColor: colors.bg }} contentContainerStyle={{ padding: 16, gap: 16 }}>
      <Text style={{ color: colors.primary, fontSize: 20 }}>YouTube</Text>

      <Text style={{ color: colors.text }}>Introduce el ID del video:</Text>
      <TextInput
        value={videoId}
        onChangeText={setVideoId}
        autoCapitalize="none"
        autoCorrect={false}
        placeholder="YouTube ID"
        placeholderTextColor={colors.subtle}
        style={{ color: colors.text, borderColor: colors.border, borderWidth: 1, borderRadius: 10, paddingHorizontal: 12, paddingVertical: 10, backgroundColor: colors.card }}
      />

      <View style={{ borderWidth: 1, borderColor: colors.border, borderRadius: 12, overflow: "hidden" }}>
        <YoutubePlayer
          ref={playerRef}
          height={220}
          play={playing}
          videoId={videoId}
          onChangeState={(s:any) => {
            if (s === "ended") setPlaying(false);
          }}
        />
      </View>

      <Text style={{ color: colors.subtle }}>Para listas de reproducción, usa la prop "playlist" o navega entre IDs.</Text>
    </ScrollView>
  );
}