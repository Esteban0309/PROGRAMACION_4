import React from "react";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import HomeScreen from "../screens/HomeScreen";
import ProductsListScreen from "../screens/ProductsListScreen";
import ProfileScreen from "../screens/ProfileScreen";
import { Ionicons } from "@expo/vector-icons";
import colors from "../theme/colors";

export type TabsParamList = { Home: undefined; Products: undefined; Profile: undefined; };

const Tab = createBottomTabNavigator<TabsParamList>();

export default function TabsNavigator() {
  return (
    <Tab.Navigator
      screenOptions={({ route }) => ({
        headerShown:false,
        tabBarStyle:{ backgroundColor:"#170e33", borderTopColor:"#251c52" },
        tabBarActiveTintColor: colors.primary,
        tabBarIcon: ({ color, size }) => {
          const map:any = { Home: "home", Products: "pricetags", Profile: "person-circle" };
          return <Ionicons name={map[route.name]} size={size} color={color} />;
        }
      })}
    >
      <Tab.Screen name="Home" component={HomeScreen} />
      <Tab.Screen name="Products" component={ProductsListScreen} />
      <Tab.Screen name="Profile" component={ProfileScreen} />
    </Tab.Navigator>
  );
}