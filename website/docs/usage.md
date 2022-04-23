---
sidebar_position: 2
---

# Usage

## Example

```tsx
import { ThumbnailGenerator } from 'react-native-app-toolkit';

ThumbnailGenerator.generate({
  path: '/private/var/Application/9DE1991A-EFA0-4507-AA2E-6FC9E4BE3ADB.pdf',
  width: 100,
  height: 100,
}).then((res) => {
  // ThumbnailGeneratorResult
});
```
