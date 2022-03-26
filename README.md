# react-native-app-toolkit

React Native App Toolkit, a high quality react-native toolkit.

English | [简体中文](./README-zh_CN.md)

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

Allows you to generate images from video files to use as thumbnails

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

| Name            | Type    | Description                                                                                                                                                       |
| --------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **quality**     | number  | A value in range 0.0 - 1.0 specifying quality level of the result image. 1 means no compression (highest quality) and 0 the highest compression (lowest quality). |
| **time**        | number  | The time position where the image will be retrieved in ms.                                                                                                        |
| **includeSize** | boolean | Include image file size                                                                                                                                           |
| **headers**     | object  | In case sourceFilename is a remote URI, headers object is passed in a network request.                                                                            |
|                 |

#### `VideoThumbnailsResult`

| Name       | Type   | Description                  |
| ---------- | ------ | ---------------------------- |
| **uri**    | string | uri to the created image.    |
| **width**  | number | Width of the created image.  |
| **height** | number | Height of the created image. |
| **size**   | number | Size of the created image.   |

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
