import { NativeModules } from 'react-native';

type CanvasReactNativeType = {
  multiply(a: number, b: number): Promise<number>;
};

const { CanvasReactNative } = NativeModules;

export default CanvasReactNative as CanvasReactNativeType;
