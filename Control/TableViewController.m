//
//  TableViewController.m
//  Control
//
//  Created by xinying on 2016/2/12.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "TableViewController.h"
#import "ZXCreatMyMapVC.h"
#import "ZXQRcodeVC.h"
#import "ZXMapkitVC.h"

#import "ZXAVPlayerVC.h"
#import "ZXVedioVC.h"

#import "ZXThreadVC.h"
#import "ZXRunLoopVC.h"

#import "ZXDesignModeTableVC.h"
#import "ZXfmdbVC.h"
#import "ZXplistVC.h"
#import "ZXHookUtil.h"
#import "ZXCollectionVC.h"
#import "Control-Swift.h"

#import "NSObject+YYParse.h"

//#import <React/RCTRootView.h>

@interface TableViewController ()
@property(nonatomic,strong)UIImage *cgImage;

@end

@implementation TableViewController
    
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"基础小示例";
    self.navigationController.navigationBar.backgroundColor =[UIColor blueColor];
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    
    NSString *str =@"123";
    NSData *data =[str dataUsingEncoding:NSUTF8StringEncoding];
    ZXLog(@"%@",[data getMD5Data]);
    
    NSString *str2 =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    UISegmentedControl *sgc =[[UISegmentedControl alloc] initWithItems:@[@"88",@"99"]];
//    [sgc setTintColor:[UIColor redColor]];
//    sgc.frame =CGRectMake(100, 100, kScreenWidth /2, 50);
//    sgc.backgroundColor =[UIColor whiteColor];
//    sgc.apportionsSegmentWidthsByContent =YES;
//    [self.view addSubview:sgc];
    
    
    NSURL *jsCodeLocation = [NSURL
                             URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];

//    RCTRootView *rootView =
//    [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
//                         moduleName        : @"ControlJS"
//                         initialProperties :
//     @{
//       @"scores" : @[
//               @{
//                   @"name" : @"Alex",
//                   @"value": @"42"
//                   },
//               @{
//                   @"name" : @"Joel",
//                   @"value": @"10"
//                   }
//               ]
//       }
//                          launchOptions    : nil];
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view = rootView;
//    [self presentViewController:vc animated:YES completion:nil];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame =CGRectMake(kScreenWidth -80, 0, 50, 50);
    [btn addTarget:self action:@selector(shareBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSString *s = nil;
    if ([s isKindOfClass:[NSString class]]) {
        
    }
    BOOL is = [s isEqualToString:@""];
    
//    ZXThreadVC *vc = [ZXThreadVC new];
    UIAlertAction *vc = [UIAlertAction actionWithTitle:@"nih" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }];
    Class cls = vc.class;
    NSLog(@"ZXThreadVC time1: %@", vc.description);
    
    unsigned int count = 0;
    Ivar *members = class_copyIvarList(cls, &count);
    for (int i = 0; i < count; i++) {
        Ivar var = members[i];
        const char *varName = ivar_getName(var);
        const char *memberType = ivar_getTypeEncoding(var); //变量类型
        NSLog(@"memberName = %s ; type = %s ", varName ,memberType);
        
        NSString *str = [NSString stringWithUTF8String:varName];
        if ([str containsString:@"imageView"]) {
            NSLog(@"包含了");
        }
    }

    //更改私有变量
    Ivar m_member = members[1];
    object_setIvar(vc, m_member, @"");
    NSLog(@"ZXThreadVC time2: %@", vc.description);
    free(members);
    
    [vc setValue:[UIColor colorWithWhite:0 alpha:1] forPrivateKey:@"titleTextColor"];
    [vc setValue:nil forPrivateKey:@"alertController"];
    
    //
    NSString *strA = @"字符";
    NSNumber *num = @20;
    NSArray *arr = @[@"shu1",@"shu2"];
    SEL sel = NSSelectorFromString(@"ObjcMsgSendWithString:withNum:withArray:");
    ((void (*) (id, SEL, NSString *, NSNumber *, NSArray *)) objc_msgSend)(self, sel, strA, num, arr);
    
    [self performSelector:@selector(ObjcMsgSendWithString:withNum:withArray:) withObjects:@[strA, num, arr]];
}

- (void)ObjcMsgSendWithString:(NSString *)strA
                      withNum:(NSNumber *)num
                    withArray:(NSArray *)arr {
    NSLog(@"ObjcMsgSendWithString被调用了");
}

    
-(void)shareBtnPressed: (UIButton *)sender{
    
}

-(void)onFavBtnPressed: (UIButton *)sender{
    
}
        
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate
//选中单元格要调用此协议函数
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Class cls =[self VCClasses][indexPath.section][indexPath.row];
    if ([cls isEqual:[ZXQRcodeVC class]]) {
        UIStoryboard * storyboard=[UIStoryboard storyboardWithName:@"ZXQRcodeVC" bundle:[NSBundle mainBundle]];
        
        [self.navigationController pushViewController:storyboard.instantiateInitialViewController animated:YES];
    }else
    [self.navigationController pushViewController:[[[self VCClasses][indexPath.section][indexPath.row] alloc] init] animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.textLabel.text = [self tableTitles][indexPath.section][indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
        UITableViewCell * cell = [[UITableViewCell alloc] init];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self tableTitles].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self tableTitles][section].count;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0){
    return 200;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0){
    return 150;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0){
    return 220;
}


//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}
//
//- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath{
//    return YES;
//}


// Section header & footer information. Views are preferred over title should you decide to provide both

-(UIImage *)cgImage{
    if (!_cgImage) {
        
        WEAKSELF
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            CIContext *context =[CIContext contextWithOptions:nil];
            CIImage *midImage =[CIImage imageWithData:UIImagePNGRepresentation([UIImage imageNamed:@"time.png"])];
            CIFilter *filter =[CIFilter filterWithName:@"CIGaussianBlur"];
            [filter setValue:midImage forKey:kCIInputImageKey];
            //改变模糊效果值,kCIInputRadiusKey
            [filter setValue:@80.0f forKey:kCIInputRadiusKey];
            CIImage *result =[filter valueForKey:kCIOutputImageKey];
            CGImageRef outImage =[context createCGImage:result fromRect:result.extent];
            

                _cgImage =[UIImage imageWithCGImage:outImage];
//                [weakSelf.tableView reloadData];

//        });
    }
    return _cgImage;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section ==0)
         {
            return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"time.png"]];
         }else{
                return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
         }
}// custom view for header. will be adjusted to default or specified header height
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green_button_p"]];
}// custom view for footer. will be adjusted to default or specified footer height

// Accessories (disclosures).

//- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED{
//    return UITableViewCellAccessoryDetailButton;
//}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    ZXLog(@"accessoryButtonTappedForRowWithIndexPath");
}

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    return YES;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    ZXLog(@"didHighlightRowAtIndexPath");
}
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    ZXLog(@"didUnhighlightRowAtIndexPath");
}


//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewCellEditingStyleInsert;
//}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED{
    ZXLog(@"titleForDeleteConfirmationButtonForRowAtIndexPath");
    return @"删除";
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return  YES;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle ==UITableViewCellEditingStyleDelete) {
        if (self.tableView.isEditing) {
            [self.tableView beginUpdates];
            NSArray * selectRows = [self.tableView indexPathsForSelectedRows];
            NSMutableIndexSet * indexpaths = [[NSMutableIndexSet alloc] init];
            for(NSIndexPath * path in selectRows){
                [indexpaths addIndex:path.row];
            }
        }
//        [[self tableTitles][indexPath.section] removeObjectAtIndex:indexPath.row];
        ZXLog(@"[self tableTitles] %@ %ld",[self tableTitles][indexPath.section],(long)indexPath.row);
        [tableView beginUpdates];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView endUpdates];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
    else if(editingStyle ==UITableViewCellEditingStyleInsert){
        ZXLog(@"UITableViewCellEditingStyleInsert");
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}


//- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{
//    ZXLog(@"editActionsForRowAtIndexPath");
//    return @[[[UITableViewRowAction alloc] init]];
//}// supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
//
//// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
//- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
//    ZXLog(@"shouldIndentWhileEditingRowAtIndexPath");
//    return YES;
//}
//
//// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
//- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED{
//    ZXLog(@"willBeginEditingRowAtIndexPath");
//}
//- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath __TVOS_PROHIBITED{
//    ZXLog(@"didEndEditingRowAtIndexPath");
//}
//
//// Moving/reordering
//
//// Allows customization of the target row for a particular row as it is being moved/reordered
////- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
////    return <#expression#>
////}
//
//// Indentation
//
//- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 50;
//}// return 'depth' of row for hierarchies
//
//// Copy/Paste.  All three methods must be implemented by the delegate.
//
//- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0){
//    return YES;
//}
//- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0){
//    return YES;
//}
//- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0){
//    ZXLog(@"performAction");
//}
//
//// Focus
//
//- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0){
//    return YES;
//}
//- (BOOL)tableView:(UITableView *)tableView shouldUpdateFocusInContext:(UITableViewFocusUpdateContext *)context NS_AVAILABLE_IOS(9_0){
//    return YES;
//}
//- (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator NS_AVAILABLE_IOS(9_0){
//    
//}
//- (nullable NSIndexPath *)indexPathForPreferredFocusedViewInTableView:(UITableView *)tableView NS_AVAILABLE_IOS(9_0){
//    
//}

// Variable height support

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 40;
//}



#pragma mark - data
- (NSArray <NSArray <Class> *> *)VCClasses{
    return @[@[[ZXCreatMyMapVC class],
               [ZXMapkitVC class]],
             @[[ZXAVPlayerVC class],
               [ZXVedioVC class]],
             @[[ZXThreadVC class],
               [ZXRunLoopVC class]],
             @[[ZXQRcodeVC class] ,[ZXCollectionVC class] ],
             @[[ZXDesignModeTableVC class],
               [ZXfmdbVC class],
               [ZXplistVC class],
               [ZXMainBarVC class]],
             @[NSClassFromString(@"ZXASIHttpVC")]];
}

- (NSMutableArray <NSMutableArray *> *)tableTitles {
    return [NSMutableArray arrayWithArray: @[@[@"地图调用",
               @"Mapkit地图"],
             @[@"音乐播放",
               @"视频播放"],
             @[@"线程间通信",
               @"运行循环"],
             @[@"二维码生成",
               @"CollectionView"],
             @[@"设计模式",
               @"FMDB数据库",
               @"Plist",
               @"Swift"],
             @[@"ASIHTTPRequest"]]];
};
@end
