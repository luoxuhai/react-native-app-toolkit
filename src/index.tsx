import { NativeModules, Platform, ColorSchemeName } from 'react-native';

import QuickLookView from './components/QuickLookView';

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

export function setAppearanceColorScheme(
  colorsSchemeName: ColorSchemeName
): Promise<void> {
  return RNToolkit.setAppearanceColorScheme(colorsSchemeName);
}

/**
 * Shows what the document camera sees.
 * @returns Promise
 */
export function openDocumentCamera(
  options?: DocumentCameraOptions
): Promise<DocumentCameraResult> {
  return RNToolkit.openDocumentCamera({
    type: 'pdf',
    quality: 1,
    ...options,
  });
}

/**
 * Open a video editor for trimming video frames.
 * @returns Promise
 */
export function openVideoEditor(
  source: string,
  options?: VideoEditorOptions
): Promise<VideoEditorResult> {
  return RNToolkit.openVideoEditor({
    source,
    ...options,
  });
}

export { QuickLookView };
