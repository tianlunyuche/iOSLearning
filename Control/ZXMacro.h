//
//  ZXMacro.h
//  Control
//
//  Created by xinying on 2016/4/2.
//  Copyright © 2016年 paohon. All rights reserved.
//

#ifndef ZXMacro_h
#define ZXMacro_h

//MARK: - 屏幕尺寸
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
#define kScreenHeight           [UIScreen mainScreen].bounds.size.height
#define kScreenBounds           [UIScreen mainScreen].bounds

//MARK: -
#define kUserDefaults           [NSUserDefaults standardUserDefaults]
#define kApplication            [UIApplication sharedApplication]
#define kNotificationCenter     [NSNotificationCenter defaultCenter]

//MARK: - color
#define UIColorFromRGB(rgbValue)                                   \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0    \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]  \

#define ZXRGBA(r, g, b, a)                                          \
[UIColor colorWithRed:r/255.0                                      \
green:g/255.0                                      \
blue:b/255.0 alpha:a]                             \

#define ZXcolor(r, g, b) ZXRGBA(r, g, b, 1)
//公用颜色
#define ZXCommonColor [UIColor colorWithRed:254/255.0  green:129/255.0 blue:0 alpha:1.0]

#define BASE_COLOR [UIColor colorWithRed:104/255.0 green:187/255.0 blue:30/255.0 alpha:1]
#define BASE_BACKGROUND_COLOR [UIColor colorWithRed:236/255.0 green:236/255.0 blue:244/255.0 alpha:1]


#define klineColor [UIColor colorWithRed:50.0f/255.0f green:214.0f/255.0f blue:210.0f/255.0f alpha:1.0f]
#define kbackgdColor [UIColor colorWithRed:236.0f /255.0f green:236.0f /255.0f blue:236.0f /255.0f alpha:1]

//MARK: - ImageView
#define kImgV(img) [[UIImageView alloc] initWithImage:[UIImage imageNamed:img]]

//Cell相关信息
#define ZXStatusToolbarWidth 35
#define ZXStatusCellMargin 5
#define ZXStatusCellInset 8
#define ZXStatusOriginalNameFont [UIFont systemFontOfSize:17]
#define ZXStatusOriginalTimeFont [UIFont systemFontOfSize:10]
#define ZXStatusOriginalSourceFont ZXStatusOriginalTimeFont
#define ZXStatusRetweetedNameFont [UIFont systemFontOfSize:18]
#define ZXStatusOriginalDidMoreNotication @"StatusOriginalDidMoreNotication"
#define WEAKSELF  typeof(self) __weak weakSelf=self;


// 富文本字体
#define ZXStatusRichTextFont [UIFont systemFontOfSize:18]
// 转发微博正文字体
#define ZXStatusHighTextColor SWColor(93, 123, 169)
// 表情的最大行数
#define ZXEmotionMaxRows 3
// 表情的最大列数
#define ZXEmotionMaxCols 7
// 每页最多显示多少个表情
#define ZXEmotionMaxCountPerPage (ZXEmotionMaxRows * ZXEmotionMaxCols - 1)
// 表情选择通知
#define ZXEmotionDidSelectedNotification @"EmotionDidSelectedNotification"
// 表情选择是emotion key
#define ZXSelectedEmotion @"SelectEmotionKey"
#define ZXEmotionDidDeletedNotification @"EmotionDidDeletedNotification"
// 富文本链接属性标志
#define ZXLinkAttr @"ZXLinkAttr"
// 富文本链接通知
#define ZXLinkDidSelectedNotification @"ZXLinkDidSelectedNotification"
// 转发微博的字体颜色
#define ZXStatusRetweededTextColor ZXcolor(111, 111, 111)
// 普通文本通知
#define ZXStatusNormalTextDidSelectedNotification @"ZXStatusNormalTextDidSelectedNotification"


//MARK: - weakify strongify
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#endif /* ZXMacro_h */
