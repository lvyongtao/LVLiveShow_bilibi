//
//  LVLiveViewController.m
//  LiveShow_bilibi
//
//  Created by lvyongtao on 16/10/25.
//  Copyright © 2016年 lvyongtao. All rights reserved.
//

#import "LVLiveViewController.h"

#import "LVLiveModel.h"
#import "LVCreatorItem.h"
#import "UIImageView+WebCache.h"

@interface LVLiveViewController ()

@property (strong, nonatomic) IJKFFMoviePlayerController *player;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation LVLiveViewController
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"back sucess");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",_live.creator.portrait]];
    [self.imageView sd_setImageWithURL:imageUrl placeholderImage:nil];
    self.imageView.alpha = 0.0;
    NSURL *url = [NSURL URLWithString:_live.stream_addr];
    
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    
    // 准备播放
    [playerVc prepareToPlay];
    _player = playerVc;
    playerVc.view.frame = [UIScreen mainScreen].bounds;
    
    [self.view insertSubview:playerVc.view atIndex:0];

    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 界面消失，一定要记得停止播放
    [_player pause];
    [_player stop];
    [_player shutdown];
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
