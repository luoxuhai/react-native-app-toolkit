import type { ColorSchemeName } from 'react-native';

import { RNToolkit } from '../internal/nativeInterface';

export function setAppearanceColorScheme(
  colorsSchemeName: ColorSchemeName
): Promise<void> {
  return RNToolkit.setAppearanceColorScheme(colorsSchemeName);
}
