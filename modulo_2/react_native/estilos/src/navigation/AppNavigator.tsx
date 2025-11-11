import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import UsersListScreen from "../features/users/screens/UsersListScreen";
import UserDetailScreen from "../features/users/screens/UserDetailScreen";
import colors from "../theme/colors";

export type RootStackParamList = {
  Users: undefined;
  UserDetail: { id: number };
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
        <Stack.Screen name="UserDetail" component={UserDetailScreen} options={{ title: "Detalle" }} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}