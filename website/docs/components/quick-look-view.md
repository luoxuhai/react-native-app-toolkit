# QuickLookView

Preview files using QuickLook framework. Support for local and remote files.
QuickLook can generate previews for common file types, including:

- iWork and Microsoft Office documents
- Images
- Live Photos
- Text files
- PDFs
- Audio and video files
- Augmented reality objects that use the usdz file format (iOS and iPadOS only)

### Example:

```tsx
import { QuickLookView } from 'react-native-app-toolkit';

function Home() {
  return (
    <QuickLookView
      style={{ flex: 1 }}
      // An URL of the file, local or remote.
      url="https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
    />
  );
}
```
