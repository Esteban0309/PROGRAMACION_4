import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import UsersListScreen from "../screens/UsersListScreen";
import UserFormScreen from "../screens/UserFormScreen";
import colors from "../theme/colors";

export type RootStackParamList = {
  Users: undefined;
  UserForm: { id?: number } | undefined;
};

const Stack = createNativeStackNavigator<RootStackParamList>();

export default function AppNavigator() {
  return (
    <NavigationContainer>
      <Stack.Navigator
        screenOptions={{
          headerStyle: { backgroundColor: "#161b22" },
          headerTintColor: colors.primary,
          contentStyle: { backgroundColor: "#0d1117" },
        }}
      >
        <Stack.Screen name="Users" component={UsersListScreen} options={{ title: "Usuarios" }} />
        <Stack.Screen name="UserForm" component={UserFormScreen} options={{ title: "Formulario" }} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}