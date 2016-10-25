//
//  ViewController.m
//  LiveShow_bilibi
//
//  Created by lvyongtao on 16/10/25.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "LVLiveModel.h"
#import "MJExtension.h"
#import "LVLiveCell.h"
#import "LVLiveViewController.h"
static NSString * const ID = @"cell";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *videoTableView;


@property (strong, nonatomic) NSMutableArray *lives;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"LVLiveShow_bilibi";
    
    [_videoTableView registerNib:[UINib nibWithNibName:@"LVLiveCell" bundle:nil] forCellReuseIdentifier:ID];
    _videoTableView.backgroundColor = [UIColor grayColor];
    _videoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self loadData];
}

- (void)loadData{
    NSString *url = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _lives = [LVLiveModel mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];
        NSLog(@"lives = %@",_lives);
        [_videoTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
    
}


#pragma mark --model


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _lives.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LVLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.live = _lives[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LVLiveViewController *liveVc = [[LVLiveViewController alloc] init];
    liveVc.live = _lives[indexPath.row];
    
    [self presentViewController:liveVc animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 430;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
