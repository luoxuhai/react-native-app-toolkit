# react-native-app-toolkit

React Native App Toolkit, 一个高质量的 react-native 工具库。

## 入门

如果你正在使用 `react-native >= 0.60` 你只需要做一个简单的：

```shell
yarn add react-native-app-toolkit
```

如果使用 npm：

```shell
npm i react-native-app-toolkit --save
```

之后，我们需要安装依赖项才能在 iOS 上使用该项目（如果您在 Android 上使用，则可以跳过此部分）。

现在运行一个简单的: `npx pod-install` 或 `cd ios && pod install`. 之后，您应该能够在平台、iOS 和 Android 上使用该库。

## API

### getVideoThumbnail(path:string, options?: VideoThumbnailOptions): Promise<VideoThumbnailsResult>

允许您从视频文件生成图像以用作缩略图

```javascript
import * as Toolkit from 'react-native-app-toolkit';

Toolkit.getVideoThumbnail(
  'https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4',
  {
    time: 1000, // ms
    quality: 0.8,
  }
).then((res) => {
  // VideoThumbnailsResult
});
```

#### `VideoThumbnailsOptions`

| 名称            | 类型    | 描述                             |
| --------------- | ------- | -------------------------------- |
| **quality**     | number  | 输出图像质量                     |
| **time**        | number  | 截取时间点, ms                   |
| **includeSize** | boolean | 返回的结果中是否包含图像文件大小 |
| **headers**     | object  | 网络视频资源的请求头             |

#### `VideoThumbnailsResult`

| 名称       | 类型   | 描述           |
| ---------- | ------ | -------------- |
| **uri**    | string | 创建图像的 uri |
| **width**  | number | 图像的宽度     |
| **height** | number | 图像的高度     |
| **size**   | number | 图像文件大小   |

## 贡献

请参阅 [贡献指南](CONTRIBUTING.md) 以了解如何为存储库和开发工作流程做出贡献。

## 开源协议

MIT
