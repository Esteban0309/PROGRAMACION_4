import React, { ReactNode } from "react";
import { SafeAreaView, StatusBar, StyleSheet, ViewStyle, ScrollView } from "react-native";
import colors from "../theme/colors";
import spacing from "../theme/spacing";

type Props = {
  children: ReactNode;
  scroll?: boolean;            // Usa scroll cuando el contenido sea largo
  contentStyle?: ViewStyle;    // Permite estilos adicionales por screen
};

export default function MainLayout({ children, scroll = false, contentStyle }: Props) {
  const Container: any = scroll ? ScrollView : SafeAreaView;

  return (
    <Container style={styles.safe}>
      <StatusBar barStyle="light-content" />
      <SafeAreaView style={[styles.inner, contentStyle]}>
        {children}
      </SafeAreaView>
    </Container>
  );
}

const styles = StyleSheet.create({
  safe: {
    flex: 1,
    backgroundColor: colors.background,
  },
  inner: {
    flex: 1,
    padding: spacing.lg,
    backgroundColor: colors.background,
  },
});