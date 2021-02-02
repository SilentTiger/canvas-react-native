import React, { Component, forwardRef, Ref, useCallback, useEffect, useImperativeHandle, useRef } from 'react'
import { findNodeHandle, NativeMethods, requireNativeComponent, UIManager, ViewProps } from 'react-native'
import CanvasContext from './CanvasContext'
import Synchronizer from './Synchronizer'

const CanvasReactNative = requireNativeComponent('CanvasReactNative')
const nativeCommands = UIManager.getViewManagerConfig('CanvasReactNative').Commands

export interface CanvasReactNativeStatic {
  getContext: () => CanvasContext
}

export interface CanvasReactNativeProps extends ViewProps {
  interval?: number
}

function CanvasReactNativeWrap(props: CanvasReactNativeProps, ref: Ref<CanvasReactNativeStatic>) {
  const { interval = 16 } = props

  const nativeCanvasRef = useRef<Component<unknown, {}, any> & Readonly<NativeMethods>>(null)

  const synchronizeHandler = useCallback((command: string) => {
    const canvasNodeHandle = findNodeHandle(nativeCanvasRef.current)
    UIManager.dispatchViewManagerCommand(canvasNodeHandle, nativeCommands.sync, [command])
  }, [])

  const synchronizer = useRef<Synchronizer>(new Synchronizer(synchronizeHandler))
  const contextRef = useRef<CanvasContext>(new CanvasContext(synchronizer.current))

  useEffect(() => {
    synchronizer.current.setInterval(interval)
  }, [interval])

  useImperativeHandle<CanvasReactNativeStatic, CanvasReactNativeStatic>(ref, () => ({
    getContext: () => {
      return contextRef.current
    },
    sync: synchronizer.current.sync,
  }))

  return <CanvasReactNative ref={nativeCanvasRef} />
}

export default forwardRef<CanvasReactNativeStatic, CanvasReactNativeProps>(CanvasReactNativeWrap)
