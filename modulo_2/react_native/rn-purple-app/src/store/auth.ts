export type Session = { token: string | null; email?: string | null; };
let session: Session = { token: null, email: null };
export const authStore = {
  get: () => session,
  set: (s: Session) => { session = s; },
  clear: () => { session = { token: null, email: null }; },
};