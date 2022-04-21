import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-app-toolkit' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

let {
  RNToolkit,
  RTKMediaLibrary,
  RTKVideoEditor,
  RTKAppearance,
  RTKDocumentCamera,
} = NativeModules;

if (!RNToolkit) {
  RNToolkit = new Proxy(
    {},
    {
      get() {
        throw new Error(LINKING_ERROR);
      },
    }
  );
}

RNToolkit.init();

export {
  RNToolkit,
  RTKMediaLibrary,
  RTKVideoEditor,
  RTKAppearance,
  RTKDocumentCamera,
};
