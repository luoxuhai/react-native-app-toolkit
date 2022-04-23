import React from 'react';
import { requireNativeComponent, ViewProps } from 'react-native';

interface QuickLookViewProps extends ViewProps {
  /**
   * An URI of the file, local or remote.
   */
  url?: string;
}

function QuickLookView(props: QuickLookViewProps) {
  return <RTKQuickLookView {...props} />;
}

export { QuickLookView as View };

var RTKQuickLookView = requireNativeComponent('RTKQuickLook');
