import { RTKVideoEditor } from '../internal/nativeInterface';

/**
 * Open a video editor for trimming video frames.
 * @returns Promise<VideoEditorResult>
 */
export function open(
  source: string,
  options?: VideoEditorOptions
): Promise<VideoEditorResult> {
  return RTKVideoEditor.openVideoEditor({
    source,
    maxDuration: 600,
    quality: 'high',
    ...options,
  });
}

/**
 * Returns a Boolean value indicating whether a video file can be edited.
 * @returns Promise
 */
export function canEdit(source: string): Promise<boolean> {
  return RTKVideoEditor.canEdit(source);
}
