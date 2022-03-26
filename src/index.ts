import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-app-toolkit' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const RNToolkit = NativeModules.RNToolkit
  ? NativeModules.RNToolkit
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function getVideoThumbnail(
  path: string,
  options?: VideoThumbnailOptions
): Promise<VideoThumbnailResult> {
  return RNToolkit.getVideoThumbnail(path, options);
}
