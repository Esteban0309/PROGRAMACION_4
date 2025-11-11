import React from "react";
import { createDrawerNavigator } from "@react-navigation/drawer";
import TabsNavigator from "./TabsNavigator";
import ProductFormScreen from "../screens/ProductFormScreen";
import colors from "../theme/colors";

export type DrawerParamList = { Tabs: undefined; ProductForm: { id?: number } | undefined; };

const Drawer = createDrawerNavigator<DrawerParamList>();

export default function DrawerNavigator() {
  return (
    <Drawer.Navigator
      screenOptions={{
        headerStyle:{ backgroundColor:"#170e33" }, headerTintColor:"#fff",
        drawerStyle:{ backgroundColor:"#170e33" }, drawerActiveTintColor: colors.primary, drawerInactiveTintColor:"#ddd"
      }}
    >
      <Drawer.Screen name="Tabs" component={TabsNavigator} options={{ title:"Inicio" }} />
      <Drawer.Screen name="ProductForm" component={ProductFormScreen} options={{ title:"Nuevo producto" }} />
    </Drawer.Navigator>
  );
}