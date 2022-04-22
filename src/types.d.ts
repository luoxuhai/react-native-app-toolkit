type TransitionStyle =
  | 'coverVertical'
  | 'flipHorizontal'
  | 'crossDissolve'
  | 'partialCurl';

type PresentationStyle =
  | 'fullScreen'
  | 'pageSheet'
  | 'formSheet'
  | 'popover'
  | 'none'
  | 'currentContext'
  | 'overFullScreen'
  | 'overCurrentContext'
  | 'default';

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

type DocumentCameraResultType = 'pdf' | 'image';

interface DocumentCameraOptions {
  /**
   * @default 'pdf'
   */
  type?: DocumentCameraResultType;
  /**
   * @default 1
   */
  quality?: number;
}

interface DocumentCameraResult {
  type: DocumentCameraResultType;
  source: string | string[];
}

interface VideoEditorOptions {
  /**
   * The maximum duration, in seconds, permitted for trimmed movies saved by the video editor.
   * The system-enforced maximum duration for a video recording is 10 minutes; you can set this value to 10 minutes or less. The default value for this property is also 10 minutes.
   * @default 600
   */
  maxDuration?: number;
  /**
   * @default 'high'
   */
  quality?: 'high' | 'medium' | 'low';
  /**
   * @default 'overFullScreen'
   */
  transitionStyle?: TransitionStyle;
  /**
   * @default 'coverVertical'
   */
  presentationStyle?: PresentationStyle;
}

interface VideoEditorResult {
  uri: string;
  width: number;
  height: number;
  duration: number;
  size: number;
}
