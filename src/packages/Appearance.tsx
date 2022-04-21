import type { ColorSchemeName } from 'react-native';

import { RTKAppearance } from '../internal/nativeInterface';

export function setAppearanceColorScheme(
  colorsSchemeName: ColorSchemeName
): Promise<void> {
  return RTKAppearance.setAppearanceColorScheme(colorsSchemeName);
}
