//
//  ZXCollectionVC.m
//  Control
//
//  Created by xinying on 2016/12/11.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXCollectionVC.h"
#import "ZXCollectionViewCell.h"

@interface ZXCollectionVC () <UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ZXCollectionVC

static NSString * const reuseIdentifier = @"ZXCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectionView];
    
    self.view.backgroundColor =[UIColor brownColor];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView.tag == 100) {
        if (indexPath.section == 0) {
            UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CCell" forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[UICollectionViewCell alloc] init];
            }
            UICollectionViewFlowLayout *collectionViewLayout=[[UICollectionViewFlowLayout alloc] init];
            collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            
            _collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.bounds.size.width, 300) collectionViewLayout:collectionViewLayout];
            _collectionView.delegate = self;
            _collectionView.dataSource = self;
            _collectionView.backgroundColor =[UIColor blueColor];
            [_collectionView registerClass:ZXCollectionViewCell.class forCellWithReuseIdentifier:reuseIdentifier];
            [cell.contentView addSubview:_collectionView];
            
            
            // Configure the cell
            //        cell.backgroundColor =[UIColor greenColor];
            return cell;
        } else {
            ZXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
            // Configure the cell
            cell.backgroundColor =[UIColor greenColor];
            return cell;
        }
    }
    else {
        ZXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        // Configure the cell
        cell.backgroundColor =[UIColor redColor];
        return cell;
    }
    
    

}

#pragma mark <UICollectionViewDelegate>
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//     return UIEdgeInsetsMake(18, 10, 10, 10);
//}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView.tag == 100) {
        if (indexPath.section == 0) {
            return CGSizeMake([UIScreen mainScreen].bounds.size.width, 300);
        }
        return CGSizeMake(300, 150);
    } else {
        return CGSizeMake(200, 200);
    }
 
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 */
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}


#pragma mark - Table Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
  
    if (indexPath.row == 0) {
        NSString *simID =@"Collection";
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:simID];
        if (cell ==nil) {
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simID];
        }
        UICollectionViewFlowLayout *collectionViewLayout=[[UICollectionViewFlowLayout alloc] init];
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300) collectionViewLayout:collectionViewLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor =[UIColor grayColor];
        [_collectionView registerClass:ZXCollectionViewCell.class forCellWithReuseIdentifier:reuseIdentifier];
        [cell.contentView addSubview:_collectionView];
        return cell;
    } else {
        NSString *simID =@"SimpleTableIdentifier";
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:simID];
        if (cell ==nil) {
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simID];
        }
        cell.textLabel.text = @"你好啊";

        return cell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 300;
    }
    return 100;
}

#pragma mark - Lazyload
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *collectionViewLayout=[[UICollectionViewFlowLayout alloc] init];
        //        collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:collectionViewLayout];
        _collectionView.scrollEnabled  = YES;
        _collectionView.tag = 100;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor =[UIColor grayColor];
        [_collectionView registerClass:ZXCollectionViewCell.class forCellWithReuseIdentifier:reuseIdentifier];
        [_collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"CCell"];
    }
    return _collectionView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
