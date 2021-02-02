#import <Foundation/Foundation.h>
#import "React/RCTViewManager.h"

@interface RCT_EXTERN_MODULE(CanvasReactNative, RCTViewManager)
    RCT_EXTERN_METHOD(sync:(nonnull NSNumber *)node
                      command:(nonnull NSString *) command
                      )
@end
