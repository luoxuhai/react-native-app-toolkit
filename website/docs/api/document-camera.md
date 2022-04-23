# DocumentCamera

Scan documents with the camera.

![Screenshot](/screenshot/IMG_2589.PNG)

```typescript
import { DocumentCamera } from 'react-native-app-toolkit';

DocumentCamera.open({
  type: 'image',
  quality: 0.8,
}).then((result) => {
  /* 
  {
    type: 'image',
    source: ['/private/Application/tmp/react-native-kit/9DE1991A-EFA0-4507-AA2E-6FC9E4BE3ADB.jpg']
  }
*/
});

Toolkit.openDocumentCamera({
  type: 'pdf',
}).then((result) => {
  /* 
  { 
    type: 'pdf',
    source: "/private/Application/tmp/react-native-kit/9DE1991A-EFA0-4507-AA2E-6FC9E4BE3ADB.pdf" 
  }
*/
});
```
