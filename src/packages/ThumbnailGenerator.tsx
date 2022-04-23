import { RTKThumbnailGenerator } from '../internal/nativeInterface';

/**
 * Generate thumbnails for common file types
 */
export function generate(
  options?: ThumbnailGeneratorOptions
): Promise<ThumbnailGeneratorResult> {
  return RTKThumbnailGenerator.generate(options);
}
