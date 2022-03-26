interface VideoThumbnailOptions {
  /**
   * 输出图像质量
   *
   * @default 1
   */
  quality?: number;
  /**
   * 截取时间点
   *
   * @default 0
   */
  time?: number;
  /**
   * 返回的结果中是否包含图像文件大小
   *
   * @default false
   */
  includeSize?: boolean;
  /**
   * 网络视频资源的请求头
   */
  headers?: Record<string, string>;
}

interface VideoThumbnailResult {
  uri?: string;
  width?: number;
  height?: number;
  size?: number;
}
