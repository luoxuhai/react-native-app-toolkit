# VideoEditor

Open a video editor for trimming video frames.

```typescript
import { VideoEditor } from 'react-native-app-toolkit';

VideoEditor.open(
  '/private/Application/tmp/react-native-kit/9DE1991A-EFA0-4507-AA2E-89C9E4BE3ADB.mp4',
  {
    maxDuration: 600,
    quality: 'high',
  }
).then((result) => {
  /* 
    {
      uri: '/private/Application/tmp/react-native-kit/9DE1991A-EFA0-4507-ABCD-6FC9E4BE3ADB.mp4'
    }
*/
});
```
