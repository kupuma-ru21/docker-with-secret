/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_SECRET: string;
  readonly VITE_SECRET2: string;
  // more env variables...
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
