import React, { useEffect, useState } from "react";
import { View, Alert } from "react-native";
import GradientBg from "../components/GradientBg";
import GlassCard from "../components/GlassCard";
import AppInput from "../components/AppInput";
import AppButton from "../components/AppButton";
import { createProduct, getProduct, updateProduct } from "../services/products.service";

export default function ProductFormScreen({ route, navigation }: any) {
  const id = route?.params?.id as number | undefined;
  const [title, setTitle] = useState("");
  const [price, setPrice] = useState("0");
  const [description, setDescription] = useState("");

  useEffect(() => {
    if (!id) return;
    getProduct(id).then(p => {
      setTitle(p.title); setPrice(String(p.price)); setDescription(p.description);
    });
  }, [id]);

  const submit = async () => {
    try {
      const payload = { title, price: Number(price), description, image: "https://i.pravatar.cc", category: "others" };
      if (id) await updateProduct(id, payload);
      else await createProduct(payload);
      Alert.alert("OK", "Guardado"); navigation.goBack();
    } catch (e: any) { Alert.alert("Error", e.message ?? "No se pudo guardar"); }
  };

  return (
    <GradientBg>
      <View style={{ flex:1, padding: 16 }}>
        <GlassCard>
          <AppInput label="Título" value={title} onChangeText={setTitle} />
          <AppInput label="Precio" value={price} onChangeText={setPrice} keyboardType="decimal-pad" />
          <AppInput label="Descripción" value={description} onChangeText={setDescription} multiline />
          <AppButton label="Guardar" onPress={submit} />
        </GlassCard>
      </View>
    </GradientBg>
  );
}