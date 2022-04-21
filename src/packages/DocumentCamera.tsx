import { RTKDocumentCamera } from '../internal/nativeInterface';

/**
 * Shows what the document camera sees.
 * @returns Promise
 */
export function open(
  options?: DocumentCameraOptions
): Promise<DocumentCameraResult> {
  return RTKDocumentCamera.openDocumentCamera({
    type: 'pdf',
    quality: 1,
    ...options,
  });
}

export function isSupported() {
  return RTKDocumentCamera.isSupported();
}
