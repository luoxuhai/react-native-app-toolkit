# openDocumentCamera

Scan documents with the camera.

![Screenshot](/screenshot/IMG_2589.PNG)

```typescript
import * as Toolkit from 'react-native-app-toolkit';

Toolkit.openDocumentCamera({
  type: 'image',
  quality: 0.8,
}).then((result) => {
/* 
  {
    type: 'image',
    source: ['/private/var/mobile/Containers/Data/Application/C03E6837-70A7-47D2-BA71-716690C46BEF/tmp/react-native-kit/9DE1991A-EFA0-4507-AA2E-6FC9E4BE3ADB.jpg']
  }
*/
});

Toolkit.openDocumentCamera({
  type: 'pdf',
}).then((result) => {
/* 
  { 
    type: 'pdf',
    source: "/private/var/mobile/Containers/Data/Application/C03E6837-70A7-47D2-BA71-716690C46BEF/tmp/react-native-kit/9DE1991A-EFA0-4507-AA2E-6FC9E4BE3ADB.pdf" 
  }
*/
});
```
