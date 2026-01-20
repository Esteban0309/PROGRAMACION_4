import AsyncStorage from "@react-native-async-storage/async-storage";

const ACCESS = "auth.access";
const REFRESH = "auth.refresh";

export const tokenStorage = {
  async setTokens(access: string, refresh: string) {
    await AsyncStorage.multiSet([[ACCESS, access], [REFRESH, refresh]]);
  },
  async clear() {
    await AsyncStorage.multiRemove([ACCESS, REFRESH]);
  },
  async getAccessToken() {
    return AsyncStorage.getItem(ACCESS);
  },
  async getRefreshToken() {
    return AsyncStorage.getItem(REFRESH);
  },
};
