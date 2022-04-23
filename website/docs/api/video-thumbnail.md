# VideoThumbnail

Allows you to generate images from video files to use as thumbnails

```typescript
import { VideoThumbnail } from 'react-native-app-toolkit';

VideoThumbnail.getThumbnail(
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
