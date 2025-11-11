import React, { useEffect, useRef, useState } from "react";
import { ActivityIndicator, Pressable, Text, View } from "react-native";
import { Audio, ResizeMode, Video } from "expo-av";
import colors from "../theme/colors";

type Props = {
  source: { uri: string };
  autoPlay?: boolean;
  loop?: boolean;
  useNativeControls?: boolean;
};

export default function AvPlayer({ source, autoPlay = false, loop = false, useNativeControls = true }: Props) {
  const videoRef = useRef<Video>(null);
  const [status, setStatus] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Audio.setAudioModeAsync({
      playsInSilentModeIOS: true,
      staysActiveInBackground: false,
    });
  }, []);

  return (
    <View style={{ borderWidth: 1, borderColor: colors.border, borderRadius: 12, overflow: "hidden" }}>
      <Video
        ref={videoRef}
        source={source}
        style={{ width: "100%", aspectRatio: 16/9, backgroundColor: "#000" }}
        resizeMode={ResizeMode.CONTAIN}
        shouldPlay={autoPlay}
        isLooping={loop}
        useNativeControls={useNativeControls}
        onLoadStart={() => setLoading(true)}
        onLoad={() => setLoading(false)}
        onPlaybackStatusUpdate={(s) => setStatus(s)}
      />

      {loading && (
        <View style={{ position: "absolute", inset: 0, alignItems: "center", justifyContent: "center" }}>
          <ActivityIndicator color={colors.primary} />
        </View>
      )}

      {!useNativeControls && (
        <View style={{ flexDirection: "row", gap: 8, padding: 10, backgroundColor: colors.card }}>
          <Pressable
            onPress={() => status?.isPlaying ? videoRef.current?.pauseAsync() : videoRef.current?.playAsync()}
            style={{ borderWidth: 1, borderColor: colors.primary, borderRadius: 8, paddingHorizontal: 12, paddingVertical: 6 }}
          >
            <Text style={{ color: colors.primary }}>{status?.isPlaying ? "Pausar" : "Reproducir"}</Text>
          </Pressable>
          <Pressable
            onPress={() => videoRef.current?.replayAsync()}
            style={{ borderWidth: 1, borderColor: colors.primary, borderRadius: 8, paddingHorizontal: 12, paddingVertical: 6 }}
          >
            <Text style={{ color: colors.primary }}>Reiniciar</Text>
          </Pressable>
        </View>
      )}
    </View>
  );
}