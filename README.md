# react-native-app-toolkit

React Native App Toolkit, 一个高质量的 react-native 工具库。

## Getting started

If you are using `react-native >= 0.60` you just need to do a simple:

```shell
yarn add react-native-app-toolkit
```

Or if are using npm:

```shell
npm i react-native-app-toolkit --save
```

After that, we need to install the dependencies to use the project on iOS(you can skip this part, if you are using this on Android).

Now run a simple: `npx pod-install` or `cd ios && pod install`. After that, you should be able to use the library on both Platforms, iOS and Android.

## API

### getVideoThumbnail(path:string, options?: VideoThumbnailOptions): Promise<VideoThumbnailsResult>

允许您从视频文件生成图像以用作缩略图

```javascript
import Toolkit from 'react-native-app-toolkit';

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

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
