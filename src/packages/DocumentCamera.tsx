import { RNToolkit } from '../internal/nativeInterface';

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

export function isDocumentCameraSupported() {
  return RNToolkit.isDocumentCameraSupported();
}
