import { RTKVideoEditor } from '../internal/nativeInterface';

/**
 * Open a video editor for trimming video frames.
 * @returns Promise
 */
export function open(
  source: string,
  options?: VideoEditorOptions
): Promise<VideoEditorResult> {
  return RTKVideoEditor.openVideoEditor({
    source,
    ...options,
  });
}
