---
sidebar_position: 2
---

# Usage

## Components example

```tsx
import { QuickLookView } from 'react-native-app-toolkit';

function Home() {
  return (
    <QuickLookView
      style={{ flex: 1 }}
      url="https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
    />
  );
}
```

## API example

```javascript
import * as Toolkit from 'react-native-app-toolkit';

Toolkit.getVideoThumbnail(
  'https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4'
).then((res) => {
  // VideoThumbnailsResult
});
```
