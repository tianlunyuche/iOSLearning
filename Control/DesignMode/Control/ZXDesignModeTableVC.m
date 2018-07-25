//
//  ZXDesignModeTableVC.m
//  Control
//
//  Created by xinying on 2016/5/17.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXDesignModeTableVC.h"
#import "ZXFlyWeightVC.h"
#import "ZXDecorativeVC.h"

@interface ZXDesignModeTableVC ()

//@property(nonatomic,strong)NSMutableArray *titleArrays;
@end

@implementation ZXDesignModeTableVC

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.tableView.allowsMultipleSelectionDuringEditing =YES;
    [self createSubView];
}

//- (NSMutableArray *)titleArrays{
//    if (!_titleArrays) {
//         _titleArrays =[[self tableTitles] mutableCopy];
//    }
//    return _titleArrays;
//}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{

    if (self.tableView.isEditing) {
        ZXLog(@"end Editing");
        [self.tableView beginUpdates];
        NSArray *selectRows =[self.tableView indexPathsForSelectedRows];
        NSMutableIndexSet *indexpaths =[[NSMutableIndexSet alloc] init];
        NSMutableIndexSet *sec =[[NSMutableIndexSet alloc] init];
        for (NSIndexPath *path in selectRows) {
//            [indexpaths addIndex:path.row];
//            [sec addIndex:path.section];
            
//            [self.tableTitles[path.section] removeObjectAtIndex:path.row];
        }

//        NSIndexSet *sec3 =[sec copy];
//        NSIndexSet *indexSet =[indexpaths copy];
//        [sec3 enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
//            ZXLog(@"self.titleArrays[idx] =%@",self.titleArrays[idx]);
//   
//        }];
        ZXLog(@"sec =%@",sec);
//        ZXLog(@"indexpaths =%lu sec =%lu",indexpaths.count,(unsigned long)sec.count);
////        ZXLog(@"indexpaths =%@",indexpaths);


        [self.tableView deleteRowsAtIndexPaths:selectRows withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
        [self.tableView setEditing:NO animated:YES];
    }else{
        ZXLog(@"begin Editing");
        [self.tableView setEditing:YES animated:YES];
    }
}

- (void)createSubView{
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
//选中单元格要调用此协议函数
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!tableView.isEditing) {
        if ((indexPath.section == 0 )&& (indexPath.row == 0)) {
            
            [self.navigationController pushViewController:[[ZXFlyWeightVC alloc] init] animated:YES];
        }
        if ((indexPath.section == 1 )&& (indexPath.row == 0)) {
            
            [self.navigationController pushViewController:[[ZXDecorativeVC alloc] init] animated:YES];
            
        }
    }

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.textLabel.text =[self tableTitles][indexPath.section][indexPath.row];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    return cell;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.tableTitles.count;

    }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.tableTitles[section] count];
}

#pragma mark - data
- (NSArray <NSArray *> *)tableTitles {
    return @[@[@"享元模式"],
               @[@"装饰着模式"]];
};

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
