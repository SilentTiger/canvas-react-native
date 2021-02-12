import React, { useLayoutEffect } from 'react'

import { StyleSheet, View, Text } from 'react-native'
import CanvasReactNative, { CanvasReactNativeStatic } from 'canvas-react-native'
import { useRef } from 'react'

export default function App() {
  const canvasReactNativeRef = useRef<CanvasReactNativeStatic>(null)

  useLayoutEffect(() => {
    if (canvasReactNativeRef.current) {
      const ctx = canvasReactNativeRef.current.getContext()
      ctx.lineWidth = 10
      ctx.lineJoin = 'round'
      ctx.lineTo(100, 200)
      ctx.lineJoin = 'miter'
      ctx.lineTo(200, 100)
      ctx.lineJoin = 'bevel'
      ctx.lineTo(300, 200)
      // canvasReactNativeRef.current.sync()
    }
  })

  return (
    <View style={styles.container}>
      <Text>Result: 1</Text>
      <CanvasReactNative ref={canvasReactNativeRef} style={styles.canvas} />
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'stretch',
    justifyContent: 'flex-start',
    backgroundColor: 'red',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  canvas: {
    flex: 1,
  },
})
