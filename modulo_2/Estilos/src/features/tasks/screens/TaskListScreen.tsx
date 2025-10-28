import React, { useState } from "react";
import { View } from "react-native";
import MainLayout from "../../../layouts/MainLayout";
import TaskItem from "../components/TaskItem";
import AppButton from "../../../components/AppButton";
import colors from "../../../theme/colors";

export default function TaskListScreen({ navigation }: any) {
  const [tasks] = useState([
    { id: "1", title: "Preparar clase de RN", done: true },
    { id: "2", title: "Crear ejemplo de navegación", done: false },
    { id: "3", title: "Publicar build de Expo", done: false },
  ]);

  return (
    <MainLayout scroll contentStyle={{ backgroundColor: colors.background }}>
      <View style={{ marginBottom: 12 }}>
        {tasks.map((t) => (
          <TaskItem key={t.id} title={t.title} done={t.done} />
        ))}
      </View>

      <AppButton
        label="Ver detalle de la 2da tarea"
        onPress={() => navigation.navigate("TaskDetail", { id: "2" })}
      />
    </MainLayout>
  );
}