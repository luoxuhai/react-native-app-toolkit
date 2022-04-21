import { RTKMediaLibrary } from '../internal/nativeInterface';

export function getThumbnail(
  path: string,
  options?: VideoThumbnailOptions
): Promise<VideoThumbnailResult> {
  return RTKMediaLibrary.getVideoThumbnail(path, options);
}
