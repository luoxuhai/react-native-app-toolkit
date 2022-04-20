import { RNToolkit } from '../internal/nativeInterface';

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
