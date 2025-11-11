import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import UsersListScreen from "../screens/UsersListScreen";
import UserDetailScreen from "../screens/UserDetailScreen";
import PostsListScreen from "../screens/PostsListScreen";
import ToolsMenuScreen from "../screens/ToolsMenuScreen";
import CalculatorScreen from "../screens/CalculatorScreen";
import TriangleAreaScreen from "../screens/TriangleAreaScreen";
import CircleAreaScreen from "../screens/CircleAreaScreen";
import SquareAreaScreen from "../screens/SquareAreaScreen";
import colors from "../theme/colors";

export type RootStackParamList = {
  Users: undefined;
  UserDetail: { id: number };
  Posts: undefined;
  Tools: undefined;
  Calculator: undefined;
  TriangleArea: undefined;
  CircleArea: undefined;
  SquareArea: undefined;
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
        <Stack.Screen name="Posts" component={PostsListScreen} options={{ title: "Posts" }} />

        <Stack.Screen name="Tools" component={ToolsMenuScreen} options={{ title: "Tools" }} />
        <Stack.Screen name="Calculator" component={CalculatorScreen} options={{ title: "Calculadora" }} />
        <Stack.Screen name="TriangleArea" component={TriangleAreaScreen} options={{ title: "Área triángulo" }} />
        <Stack.Screen name="CircleArea" component={CircleAreaScreen} options={{ title: "Área círculo" }} />
        <Stack.Screen name="SquareArea" component={SquareAreaScreen} options={{ title: "Área cuadrado" }} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}