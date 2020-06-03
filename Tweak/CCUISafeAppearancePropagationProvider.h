
@class NSArray;


@protocol CCUISafeAppearancePropagationProvider <NSObject>

@property (nonatomic,readonly) NSArray * childViewControllersForAppearancePropagation; 
@optional
-(NSArray *)childViewControllersForAppearancePropagation;
@end
