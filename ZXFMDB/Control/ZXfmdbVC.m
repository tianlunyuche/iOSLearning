//
//  ZXfmdbVC.m
//  Control
//
//  Created by xinying on 2016/5/23.
//  Copyright © 2016年 paohon. All rights reserved.
//

#import "ZXfmdbVC.h"
#import "ZXUserModel.h"
#import "ZXfmdbTool.h"
#import "ZXfdbView.h"

@interface ZXfmdbVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong)ZXfdbView *contentView;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *modalsArrM;

@end

@implementation ZXfmdbVC

- (ZXfdbView *)contentView{
    
    if (!_contentView) {
        _contentView =[[ZXfdbView  alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    }
    return _contentView;
}

- (NSMutableArray *)modalsArrM {
    if (!_modalsArrM) {
        _modalsArrM = [[NSMutableArray alloc] init];
    }
    return _modalsArrM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, self.modalsArrM.count *70) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    
    [[ZXfmdbTool sharedInstance] execSqlInFmdb:@"tmp" dbFileName:@"test.sqlite" dbHandler:^(FMDatabase *nn_db) {
        NSString *cSql = @"CREATE TABLE IF NOT EXISTS TEST (id INTEGER PRIMARY KEY, name TEXT NOT NULL, ID_No TEXT NOT NULL)";
        BOOL res = [nn_db executeUpdate:cSql];
        if (!res) {
            ZXLog(@"error when creating db table");
        } else {
            ZXLog(@"succ to creating db table");
        }
    }];
    
    [self.view addSubview:self.contentView];
    
    [self insertData];
    self.contentView.nickNameTextField.text=@"小狗";
    self.contentView.card_idTextField.text =@"40";
    [self insertData];
    [self updateData];
    [self insertData];
    [self deleteData];
}

#pragma mark - 数据库操作

- (void)insertData {
    [[ZXfmdbTool sharedInstance] execSqlInFmdb:@"tmp" dbFileName:@"test.sqlite" dbHandler:^(FMDatabase *nn_db) {
        ZXUserModel *modal = [ZXUserModel modalWith:self.contentView.nickNameTextField.text  no:self.contentView.card_idTextField.text.intValue];

        NSString * sql = @"insert into TEST (name, ID_No) values(?, ?)";
        BOOL res = [nn_db executeUpdate:sql, self.contentView.nickNameTextField.text, self.contentView.card_idTextField.text];
        if (!res) {
            ZXLog(@"error to insert data");
        } else {
            ZXLog(@"succ to insert data");
            [self.modalsArrM addObject:modal];
            [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, kScreenWidth, self.modalsArrM.count*70)];
            [self.tableView reloadData];
        }
    }];
}

- (void)updateData {
    if (self.contentView.nickNameTextField.text) {
        [[ZXfmdbTool sharedInstance] execSqlInFmdb:@"tmp" dbFileName:@"test.sqlite" dbHandler:^(FMDatabase *nn_db) {
            NSString *uSql = @"UPDATE TEST SET ID_No = ? WHERE  name = ?";
            BOOL res = [nn_db executeUpdate:uSql, self.contentView.card_idTextField.text, self.contentView.nickNameTextField.text];
            if (!res) {
                NSLog(@"error to UPDATE data");
            } else {
                NSLog(@"succ to UPDATE data");
                [self queryData:nil];
            }
        }];
    }
    
}

- (void)deleteData {
    if (self.contentView.card_idTextField.text) {
        
        [[ZXfmdbTool sharedInstance] execSqlInFmdb:@"tmp" dbFileName:@"test.sqlite" dbHandler:^(FMDatabase *nn_db) {
            NSString *dSql = @"DELETE FROM TEST WHERE ID_No = ?";
            BOOL res = [nn_db executeUpdate:dSql, self.contentView.card_idTextField.text];
            if (!res) {
                ZXLog(@"error to DELETE data");
            } else {
                ZXLog(@"succ to DELETE data");
                [self queryData:nil];
            }
        }];
    }
}


- (IBAction)queryData:(id)sender {
    
    [[ZXfmdbTool sharedInstance] execSqlInFmdb:@"tmp" dbFileName:@"test.sqlite" dbHandler:^(FMDatabase *nn_db) {
        [self.modalsArrM removeAllObjects];
        
        NSMutableArray *arrM = [NSMutableArray array];
        NSString *qSql = @"SELECT * FROM TEST";
        FMResultSet *set = [nn_db executeQuery:qSql];
        
        
        while ([set next]) {
            
            NSString *name = [set stringForColumn:@"name"];
            NSString *ID_No = [set stringForColumn:@"ID_No"];
            
            ZXUserModel *modal = [ZXUserModel modalWith:name no:ID_No.intValue];
            [arrM addObject:modal];
        }
        [self.modalsArrM addObjectsFromArray:arrM];
        
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ZXLog(@"self.modalsArrM.count =%lu",(unsigned long)self.modalsArrM.count);
    return self.modalsArrM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    ZXUserModel *modal = self.modalsArrM[indexPath.row];
    cell.textLabel.text = modal.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%zd", modal.ID_No];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
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

@end
