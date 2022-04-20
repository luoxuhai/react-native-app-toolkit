import React from 'react';
import { requireNativeComponent, ViewProps } from 'react-native';

interface QuickLookViewProps extends ViewProps {
  /**
   * An URI of the file, local or remote.
   */
  url?: string;
}

export function QuickLookView(props: QuickLookViewProps) {
  return <RNQuickLookView {...props} />;
}

var RNQuickLookView = requireNativeComponent('RNQuickLookView');
