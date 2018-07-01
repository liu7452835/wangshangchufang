//
//  MBProgressHUD.h
//  Version 0.9.1
//  Created by Matej Bukovinski on 2.4.09.
// 借用第三方库

// This code is distributed under the terms and conditions of the MIT license. 

// Copyright (c) 2009-2015 Matej Bukovinski
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol MBProgressHUDDelegate;


typedef NS_ENUM(NSInteger, MBProgressHUDMode) {
	/** Progress is shown using an UIActivityIndicatorView. This is the default. */
    /** 使用UIActivityIndicatorView显示进度条，这是默认设置 */
	MBProgressHUDModeIndeterminate,
	/** Progress is shown using a round, pie-chart like, progress view. */
    /** 进度显示使用圆形饼图，如进度视图*/
	MBProgressHUDModeDeterminate,
	/** Progress is shown using a horizontal progress bar */
    /** 进度显示使用水平进度条*/
	MBProgressHUDModeDeterminateHorizontalBar,
	/** Progress is shown using a ring-shaped progress view. */
    /** 使用环形进度视图显示进度。*/
	MBProgressHUDModeAnnularDeterminate,
	/** Shows a custom view */
    /** 使用自定义视图显示 */
	MBProgressHUDModeCustomView,
	/** Shows only labels */
    /** 只使用标签显示 */
	MBProgressHUDModeText
};

typedef NS_ENUM(NSInteger, MBProgressHUDAnimation) {
	/** Opacity animation */
    /** 不透明动画 */
	MBProgressHUDAnimationFade,
	/** Opacity + scale animation */
    /** 不透明+比例尺动画 */
	MBProgressHUDAnimationZoom,
	MBProgressHUDAnimationZoomOut = MBProgressHUDAnimationZoom,
	MBProgressHUDAnimationZoomIn
};


#ifndef MB_INSTANCETYPE
#if __has_feature(objc_instancetype)
	#define MB_INSTANCETYPE instancetype
#else
	#define MB_INSTANCETYPE id
#endif
#endif

#ifndef MB_STRONG
#if __has_feature(objc_arc)
	#define MB_STRONG strong
#else
	#define MB_STRONG retain
#endif
#endif

#ifndef MB_WEAK
#if __has_feature(objc_arc_weak)
	#define MB_WEAK weak
#elif __has_feature(objc_arc)
	#define MB_WEAK unsafe_unretained
#else
	#define MB_WEAK assign
#endif
#endif

#if NS_BLOCKS_AVAILABLE
typedef void (^MBProgressHUDCompletionBlock)(void);
#endif


/** 
 * Displays a simple HUD window containing a progress indicator and two optional labels for short messages.
 *
 * This is a simple drop-in class for displaying a progress HUD view similar to Apple's private UIProgressHUD class.
 * The MBProgressHUD window spans over the entire space given to it by the initWithFrame constructor and catches all
 * user input on this region, thereby preventing the user operations on components below the view. The HUD itself is
 * drawn centered as a rounded semi-transparent view which resizes depending on the user specified content.
 *
 * This view supports four modes of operation:
 * - MBProgressHUDModeIndeterminate - shows a UIActivityIndicatorView
 * - MBProgressHUDModeDeterminate - shows a custom round progress indicator
 * - MBProgressHUDModeAnnularDeterminate - shows a custom annular progress indicator
 * - MBProgressHUDModeCustomView - shows an arbitrary, user specified view (@see customView)
 *
 * All three modes can have optional labels assigned:
 * - If the labelText property is set and non-empty then a label containing the provided content is placed below the
 *   indicator view.
 * - If also the detailsLabelText property is set then another label is placed below the first label.
 
 *显示一个简单的HUD窗口，其中包含进度指示器和两个用于短消息的可选标签。
 *这是一个简单的嵌入式类，用于显示类似于Apple专用UIProgressHUD类的进度HUD视图。
 *MBProgressHUD窗口跨越了通过initWithFrame构造函数提供给它的整个空间，并捕获该区域的所有用户输入，从而阻止用户对视图下方组件的操作。 HUD本身被绘制为一个圆形的半透明视图，该视图根据用户指定的内容调整大小。
 *此视图支持四种操作模式：
 *
 * - MBProgressHUDModeIndeterminate - 显示一个UIActivityIndi​​catorView
 * - MBProgressHUDModeDeterminate - 显示自定义的圆形进度指示器
 * - MBProgressHUDModeAnnularDeterminate - 显示自定义环形进度指示器
 * - MBProgressHUDModeCustomView - 显示一个任意的，用户指定的视图
 *
 *所有三种模式都可以分配可选标签：
 *
 * - 如果labelText属性设置为非空，则包含提供内容的标签将放置在指示器视图下方。
 * - 如果也设置了detailsLabelText属性，则在第一个标签下面放置另一个标签。
 */
@interface MBProgressHUD : UIView


/**
 Creates a new HUD, adds it to provided view and shows it. The counterpart to this method is hideHUDForView:animated:.
 创建一个新的HUD，将其添加到提供的视图并显示它。 与此方法相对应的是hideHUDForView: animated:
 
 @param view HUD将被添加到的此视图.
 @param animated 如果设置为YES，则HUD将使用当前的animationType显示。 如果设置为NO，则HUD不会使用.
 
 @return instancetype
 */
+ (MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view animated:(BOOL)animated;

/**
 Finds the top-most HUD subview and hides it. The counterpart to this method is showHUDAddedTo:animated:
 查找最顶级的HUD子视图并隐藏它。 与此方法相对应的是showHUDAddedTo: animated:

 @param view 查找HUD子视图的视图.
 @param animated 如果设置为YES，则HUD将使用当前的animationType消失。 如果设置为NO，则HUD不会使用.
 
 @return 如果找到并移除了HUD，则返回YES，否则返回NO.
 */
+ (BOOL)hideHUDForView:(UIView *)view animated:(BOOL)animated;

/**
 Finds all the HUD subviews and hides them.
 查找所有HUD子视图并隐藏它们。

 @param view 将要搜索HUD子视图的视图
 @param animated 如果设置为YES，HUD将使用当前的animationType消失。 如果设置为NO，则HUD不会使用动画消失
 
 @return 找到并移除的HUD数量
 */
+ (NSUInteger)hideAllHUDsForView:(UIView *)view animated:(BOOL)animated;

/**
 Finds the top-most HUD subview and returns it.
 查找最顶级的HUD子视图并将其返回。

 @param view 将要搜索的视图
 
 @return instancetype
 */
+ (MB_INSTANCETYPE)HUDForView:(UIView *)view;

/**
 Finds all HUD subviews and returns them.
 查找所有HUD子视图并将其返回。

 @param view 将要搜索的视图。
 @return 所有找到的HUD视图（MBProgressHUD对象数组）
 */
+ (NSArray *)allHUDsForView:(UIView *)view;

/**
 A convenience constructor that initializes the HUD with the window's bounds. Calls the designated constructor with window.bounds as the parameter.
 一个便捷的构造函数，用窗口界限初始化HUD。 以window.bounds作为参数调用指定的构造函数。

 @param window 将为HUD提供边界的窗口实例。 应该与HUD的超级视图（即HUD将添加到的窗口）相同。
 @return 返回HUD实例
 */
- (id)initWithWindow:(UIWindow *)window;

/**
 A convenience constructor that initializes the HUD with the view's bounds. Calls the designated constructor with view.bounds as the parameter
 一个便捷的构造函数，用视图的边界初始化HUD。 以view.bounds作为参数调用指定的构造函数

 @param view 将提供HUD边界的视图实例。 应该与HUD的超级视图相同（即HUD将添加到的视图）。
 @return 返回HUD实例
 */
- (id)initWithView:(UIView *)view;

/**
 Display the HUD. You need to make sure that the main thread completes its run loop soon after this method call so the user interface can be updated. Call this method when your task is already set-up to be executed in a new thread
 (e.g., when using something like NSOperation or calling an asynchronous call like NSURLRequest).
 显示HUD。 您需要确保主线程在此方法调用后不久完成其运行循环，以便可以更新用户界面。 当您的任务已经设置为在新线程中执行时（例如，使用像NSOperation之类的东西或调用NSURLRequest之类的异步调用时），调用此方法。

 @param animated 如果设置为YES，则HUD将使用当前的animationType显示。 如果设置为NO，则HUD不会在出现时使用动画。
 */
- (void)show:(BOOL)animated;

/**
 Hide the HUD. This still calls the hudWasHidden: delegate. This is the counterpart of the show: method. Use it to hide the HUD when your task completes.
 隐藏HUD。 这仍然会调用hudWasHidden：delegate。 这是show：method的对应部分。 当您的任务完成时使用它来隐藏HUD。

 @param animated 如果设置为YES，则HUD将使用当前的animationType消失。 如果设置为NO，则HUD在消失时不会使用动画。
 */
- (void)hide:(BOOL)animated;

/**
 Hide the HUD after a delay. This still calls the hudWasHidden: delegate. This is the counterpart of the show: method. Use it to hide the HUD when your task completes.
 在延迟后隐藏HUD。 这仍然调用hudWasHidden：delegate。 这是show：method的对应部分。 当您的任务完成时使用它来隐藏HUD。

 @param animated 如果设置为YES，则HUD将使用当前的animationType消失。 如果设置为NO，则HUD在消失时不会使用动画。
 @param delay 以秒为单位的延迟，直到隐藏HUD
 */
- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;

/**
 Shows the HUD while a background task is executing in a new thread, then hides the HUD.
 This method also takes care of autorelease pools so your method does not have to be concerned with setting up a pool.
 在新线程中执行后台任务时显示HUD，然后隐藏HUD。
 这种方法也使用autorelease池，所以你的方法不必关心设置一个池。

 @param method 显示HUD时执行的方法。 该方法将在新线程中执行
 @param target 目标方法所属的对象
 @param object 要传递给方法的可选对象
 @param animated 如果设置为YES，则HUD将使用当前animationType显示（dis）。 如果设置为“否”，则在出现（dis）时HUD不会使用动画
 */
- (void)showWhileExecuting:(SEL)method onTarget:(id)target withObject:(id)object animated:(BOOL)animated;

#if NS_BLOCKS_AVAILABLE


/**
 Shows the HUD while a block is executing on a background queue, then hides the HUD.
 当一个块在背景队列上执行时显示HUD，然后隐藏HUD。

 @param animated 如果设置为YES，则HUD将使用当前animationType显示（消失）。 如果设置为“否”，则在出现（消失）时HUD不会使用动画。
 @param block 显示HUD时要执行的块。
 */
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block;

/**
 Shows the HUD while a block is executing on a background queue, then hides the HUD
 在背景队列上执行块时显示HUD，然后隐藏HUD。

 @param animated 如果设置为YES，则HUD将使用当前animationType显示（消失）。 如果设置为“否”，则在出现（消失）时HUD不会使用动画。
 @param block 显示HUD时要执行的块。
 @param completion 完成时要执行的块。
 */
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block completionBlock:(MBProgressHUDCompletionBlock)completion;

/**
 Shows the HUD while a block is executing on the specified dispatch queue, then hides the HUD.
 在指定的调度队列上执行块时显示HUD，然后隐藏HUD。

 @param animated 如果设置为YES，则HUD将使用当前animationType显示（消失）。 如果设置为“否”，则在出现（消失）时HUD不会使用动画。
 @param block 显示HUD时要执行的块。
 @param queue 执行块的分派队列。
 */
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block onQueue:(dispatch_queue_t)queue;

/**
 Shows the HUD while a block is executing on the specified dispatch queue, executes completion block on the main queue, and then hides the HUD.
 在指定的调度队列上执行块时显示HUD，执行主队列上的完成块，然后隐藏HUD。
 
 @param animated 如果设置为YES，则HUD将使用当前animationType显示（消失）。 如果设置为“否”，则在出现（消失）时HUD不会使用动画。
 @param block 显示HUD时要执行的块。
 @param queue 执行块的分派队列
 @param completion 完成时要执行的块
 */
- (void)showAnimated:(BOOL)animated whileExecutingBlock:(dispatch_block_t)block onQueue:(dispatch_queue_t)queue
		  completionBlock:(MBProgressHUDCompletionBlock)completion;

/**
 * A block that gets called after the HUD was completely hidden.
 在HUD完全隐藏后被调用的块。
 */
@property (copy) MBProgressHUDCompletionBlock completionBlock;

#endif

/** 
 * MBProgressHUD operation mode. The default is MBProgressHUDModeIndeterminate.
 * MBProgressHUD操作模式。默认值是MBProgressHUDModeIndeterminate。
 * @see MBProgressHUDMode
 */
@property (assign) MBProgressHUDMode mode;

/**
 * The animation type that should be used when the HUD is shown and hidden. 
 * 显示和隐藏HUD时应使用的动画类型。
 * @see MBProgressHUDAnimation
 */
@property (assign) MBProgressHUDAnimation animationType;

/**
 * The UIView (e.g., a UIImageView) to be shown when the HUD is in MBProgressHUDModeCustomView.
 * For best results use a 37 by 37 pixel view (so the bounds match the built in indicator bounds).
 当HUD在MBProgressHUDModeCustomView中时将显示UIView（例如，UIImageView）。
 为获得最佳效果，请使用37 x 37像素视图（因此边界与内置指标边界相匹配）。
 */
@property (MB_STRONG) UIView *customView;

/** 
 * The HUD delegate object.
 * HUD委托对象
 * @see MBProgressHUDDelegate
 */
@property (MB_WEAK) id<MBProgressHUDDelegate> delegate;

/** 
 * An optional short message to be displayed below the activity indicator. The HUD is automatically resized to fit
 * the entire text. If the text is too long it will get clipped by displaying "..." at the end. If left unchanged or
 * set to @"", then no message is displayed.
 在活动指示符下面显示的可选短消息。 HUD会自动调整大小以适应整个文本。 如果文本太长，最后会显示“...”以剪切文本。 如果保持不变或设置为@“”，则不显示任何消息。
 */
@property (copy) NSString *labelText;

/** 
 * An optional details message displayed below the labelText message. This message is displayed only if the labelText
 * property is also set and is different from an empty string (@""). The details text can span multiple lines.
 在labelText消息下显示的可选详细信息。 此消息仅在labelText属性也设置且与空字符串（@“”）不同时才会显示。 详细信息文本可以跨越多行。
 */
@property (copy) NSString *detailsLabelText;

/** 
 * The opacity of the HUD window. Defaults to 0.8 (80% opacity).
  HUD窗口的不透明度。 默认为0.8（不透明度为80％）
 */
@property (assign) float opacity;

/**
 * The color of the HUD window. Defaults to black. If this property is set, color is set using
 * this UIColor and the opacity property is not used.  using retain because performing copy on
 * UIColor base colors (like [UIColor greenColor]) cause problems with the copyZone.
 HUD窗口的颜色。 默认为黑色。 如果设置了此属性，则使用此UIColor设置颜色，并且不使用不透明度属性。 使用retain是因为在UIColor基色（如[UIColor greenColor]）上执行复制会导致copyZone出现问题。
 */
@property (MB_STRONG) UIColor *color;

/** 
 * The x-axis offset of the HUD relative to the centre of the superview.
  HUD相对于超视图中心的x轴偏移量。
 */
@property (assign) float xOffset;

/** 
 * The y-axis offset of the HUD relative to the centre of the superview.
  HUD相对于超视图中心的y轴偏移量。
 */
@property (assign) float yOffset;

/**
 * The amount of space between the HUD edge and the HUD elements (labels, indicators or custom views). 
 * Defaults to 20.0
 HUD边缘和HUD元素（标签，指标或自定义视图）之间的空间量。
 默认为20.0
 */
@property (assign) float margin;

/**
 * The corner radius for the HUD
 * Defaults to 10.0
  HUD的拐角半径
  默认为10.0
 */
@property (assign) float cornerRadius;

/** 
 * Cover the HUD background view with a radial gradient.
 用径向渐变覆盖HUD背景视图。
 */
@property (assign) BOOL dimBackground;

/*
 * Grace period is the time (in seconds) that the invoked method may be run without 
 * showing the HUD. If the task finishes before the grace time runs out, the HUD will
 * not be shown at all. 
 * This may be used to prevent HUD display for very short tasks.
 * Defaults to 0 (no grace time).
 * Grace time functionality is only supported when the task status is known!
 * @see taskInProgress
 宽限期是被调用的方法可以在不显示HUD的情况下运行的时间（以秒为单位）。 如果任务在宽限时间耗尽之前完成，则HUD将不会显示。
 这可以用来防止HUD显示对于非常短的任务。
 默认为0（无宽限期）。
 只有当任务状态已知时才支持宽限时间功能！
 */
@property (assign) float graceTime;

/**
 * The minimum time (in seconds) that the HUD is shown. 
 * This avoids the problem of the HUD being shown and than instantly hidden.
 * Defaults to 0 (no minimum show time).
 显示HUD的最短时间（以秒为单位）。
 这避免了显示HUD的问题，并且立即隐藏起来。
 默认为0（没有最小显示时间）。
 */
@property (assign) float minShowTime;

/**
 * Indicates that the executed operation is in progress. Needed for correct graceTime operation.
 * If you don't set a graceTime (different than 0.0) this does nothing.
 * This property is automatically set when using showWhileExecuting:onTarget:withObject:animated:.
 * When threading is done outside of the HUD (i.e., when the show: and hide: methods are used directly),
 * you need to set this property when your task starts and completes in order to have normal graceTime 
 * functionality.
 表示正在执行的操作正在进行中。 正确的graceTime操作需要。
 如果您未设置宽限时间（不同于0.0），则不执行任何操作。
 使用showWhileExecuting: onTarget：withObject: animated: 方法时，此属性会自动设置：
 当线程在HUD之外完成时（即直接使用show：和hide：方法时），则需要在任务启动并完成时设置此属性，以便具有正常的graceTime功能。
 */
@property (assign) BOOL taskInProgress;

/**
 * Removes the HUD from its parent view when hidden. 
 * Defaults to NO.
 隐藏时从其父视图中移除HUD。
 默认为NO。
 */
@property (assign) BOOL removeFromSuperViewOnHide;

/** 
 * Font to be used for the main label. Set this property if the default is not adequate.
 要用于主标签的字体。 如果默认值不够，请设置此属性。
 */
@property (MB_STRONG) UIFont* labelFont;

/**
 * Color to be used for the main label. Set this property if the default is not adequate.
 要用于主标签的颜色。 如果默认值不够，请设置此属性。
 */
@property (MB_STRONG) UIColor* labelColor;

/**
 * Font to be used for the details label. Set this property if the default is not adequate.
 要用于主标签的字体。 如果默认值不够，请设置此属性。
 */
@property (MB_STRONG) UIFont* detailsLabelFont;

/** 
 * Color to be used for the details label. Set this property if the default is not adequate.
 要用于细节标签的颜色。 如果默认值不够，请设置此属性。
 */
@property (MB_STRONG) UIColor* detailsLabelColor;

/**
 * The color of the activity indicator. Defaults to [UIColor whiteColor]
 * Does nothing on pre iOS 5.
 活动指示器的颜色。 默认为[UIColor whiteColor]
 在iOS 5之前不做任何事情。
 */
@property (MB_STRONG) UIColor *activityIndicatorColor;

/** 
 * The progress of the progress indicator, from 0.0 to 1.0. Defaults to 0.0.
 进度指示器的进度从0.0到1.0。 默认为0.0。
 */
@property (assign) float progress;

/**
 * The minimum size of the HUD bezel. Defaults to CGSizeZero (no minimum size).
 HUD边框的最小尺寸。 默认为CGSizeZero（没有最小尺寸）。
 */
@property (assign) CGSize minSize;


/**
 * The actual size of the HUD bezel.
 * You can use this to limit touch handling on the bezel aria only.
 HUD边框的实际尺寸。
 你可以用此功能来限制边框上的触摸处理。
 * @see https://github.com/jdg/MBProgressHUD/pull/200
 */
@property (atomic, assign, readonly) CGSize size;


/**
 * Force the HUD dimensions to be equal if possible.
 如果可能，强制HUD尺寸相等。
 */
@property (assign, getter = isSquare) BOOL square;

@end


@protocol MBProgressHUDDelegate <NSObject>

@optional

/** 
 * Called after the HUD was fully hidden from the screen.
 在HUD完全隐藏在屏幕上之后调用。
 */
- (void)hudWasHidden:(MBProgressHUD *)hud;

@end


/**
 * A progress view for showing definite progress by filling up a circle (pie chart).
 通过填充一个圆圈（圆饼图）来显示确定进度的进度视图。
 */
@interface MBRoundProgressView : UIView 

/**
 * Progress (0.0 to 1.0)
 进度（0.0到1.0）
 */
@property (nonatomic, assign) float progress;

/**
 * Indicator progress color.
 * Defaults to white [UIColor whiteColor]
 指示进度颜色。
 默认为白色[UIColor whiteColor]
 */
@property (nonatomic, MB_STRONG) UIColor *progressTintColor;

/**
 * Indicator background (non-progress) color.
 * Defaults to translucent white (alpha 0.1)
 指示背景（未进展）的颜色。
 默认为半透明白色（alpha 0.1）
 */
@property (nonatomic, MB_STRONG) UIColor *backgroundTintColor;

/*
 * Display mode - NO = round or YES = annular. Defaults to round.
 显示模式 - NO =圆形 或 YES =环形。 默认为四舍五入。
 */
@property (nonatomic, assign, getter = isAnnular) BOOL annular;

@end


/**
 * A flat bar progress view.
 一个平条进度视图。
 */
@interface MBBarProgressView : UIView

/**
 * Progress (0.0 to 1.0)、
  进度（0.0到1.0）
 */
@property (nonatomic, assign) float progress;

/**
 * Bar border line color.
 * Defaults to white [UIColor whiteColor].
 线条边框颜色。
 默认值为白色。
 */
@property (nonatomic, MB_STRONG) UIColor *lineColor;

/**
 * Bar background color.
 * Defaults to clear [UIColor clearColor];
 条形背景颜色。
 默认值为清除[UIColor clearColor]
 */
@property (nonatomic, MB_STRONG) UIColor *progressRemainingColor;

/**
 * Bar progress color.
 * Defaults to white [UIColor whiteColor].
 进度条颜色。
 默认值为白色[UIColor whiteColor]。
 */
@property (nonatomic, MB_STRONG) UIColor *progressColor;

@end
