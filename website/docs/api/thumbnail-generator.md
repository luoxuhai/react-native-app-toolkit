# ThumbnailGenerator

Generate thumbnails for common file types, including:

- iWork and Microsoft Office documents
- Images
- Live Photos
- Text files
- PDFs
- Audio and video files

```typescript
import { ThumbnailGenerator } from 'react-native-app-toolkit';

ThumbnailGenerator.generate({
  path: '/private/var/Application/9DE1991A-EFA0-4507-AA2E-6FC9E4BE3ADB.pdf',
  width: 100,
  height: 100,
}).then((res) => {
  /*
    {
      path: "/private/Application/tmp/react-native-kit/9DE1991A-EFA0-4507-AA2E-6FC9E4BE3ADB.jpg"
    }
  */
});
```
