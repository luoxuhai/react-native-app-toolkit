import { RNToolkit } from '../internal/nativeInterface';

export function getVideoThumbnail(
  path: string,
  options?: VideoThumbnailOptions
): Promise<VideoThumbnailResult> {
  return RNToolkit.getVideoThumbnail(path, options);
}
