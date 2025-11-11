import React, { useState } from "react";
import { ScrollView, Text, Pressable, View } from "react-native";
import * as ImagePicker from "expo-image-picker";
import ImageGrid from "../components/ImageGrid";
import AvPlayer from "../components/AvPlayer";
import colors from "../theme/colors";

export default function MediaPickerScreen({ navigation }: any) {
  const [images, setImages] = useState<string[]>([]);
  const [videoUri, setVideoUri] = useState<string | null>(null);

  const pickImages = async () => {
    const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (status !== "granted") return alert("Permiso de galería denegado");
    const res = await ImagePicker.launchImageLibraryAsync({
      allowsMultipleSelection: true,
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      quality: 0.9
    });
    if (!res.canceled) setImages(res.assets.map(a => a.uri));
  };

  const pickVideo = async () => {
    const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (status !== "granted") return alert("Permiso de galería denegado");
    const res = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Videos
    });
    if (!res.canceled && res.assets[0]?.uri) setVideoUri(res.assets[0].uri);
  };

  return (
    <ScrollView style={{ backgroundColor: colors.bg }} contentContainerStyle={{ padding: 16, gap: 16 }}>
      <Text style={{ color: colors.primary, fontSize: 20 }}>Imágenes</Text>

      <Pressable
        onPress={pickImages}
        style={{ borderColor: colors.primary, borderWidth: 1, borderRadius: 8, padding: 10, alignSelf: "flex-start" }}
      >
        <Text style={{ color: colors.primary }}>Seleccionar imágenes</Text>
      </Pressable>

      <ImageGrid uris={images} />

      <View style={{ height: 16 }} />

      <Text style={{ color: colors.primary, fontSize: 20 }}>Video local</Text>

      <Pressable
        onPress={pickVideo}
        style={{ borderColor: colors.primary, borderWidth: 1, borderRadius: 8, padding: 10, alignSelf: "flex-start" }}
      >
        <Text style={{ color: colors.primary }}>Seleccionar video</Text>
      </Pressable>

      {videoUri ? (
        <AvPlayer source={{ uri: videoUri }} autoPlay />
      ) : (
        <Text style={{ color: colors.subtle }}>No hay video seleccionado.</Text>
      )}

      <View style={{ height: 24 }} />

      <Text style={{ color: colors.primary, fontSize: 20 }}>Otras pantallas</Text>
      <View style={{ flexDirection: "row", gap: 10, flexWrap: "wrap" }}>
        <Pressable
          onPress={() => navigation.navigate("VideoPlayer")}
          style={{ borderColor: colors.primary, borderWidth: 1, borderRadius: 8, padding: 10 }}
        >
          <Text style={{ color: colors.primary }}>Video remoto</Text>
        </Pressable>
        <Pressable
          onPress={() => navigation.navigate("YouTube")}
          style={{ borderColor: colors.primary, borderWidth: 1, borderRadius: 8, padding: 10 }}
        >
          <Text style={{ color: colors.primary }}>YouTube</Text>
        </Pressable>
      </View>
    </ScrollView>
  );
}