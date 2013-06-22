//
//  MVViewController.m
//  MusicPlayer
//
//  Created by dev27 on 5/14/13.
//  Copyright (c) 2013 Codigator. All rights reserved.
//

#import "MVViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface MVViewController ()
@property (weak, nonatomic) IBOutlet UIButton *togglePlayPause;
@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UILabel *durationOutlet;
@property (weak, nonatomic) IBOutlet UISlider *sliderOutlet;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *songsList;

@property (strong, nonatomic) AVPlayer *audioPlayer;
@end

@implementation MVViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  //1
  self.tableView.dataSource =self;
  self.tableView.delegate = self;
  //2
  self.audioPlayer = [[AVPlayer alloc] init];
  //3
  [self.tableView reloadData];
  //4
    

    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]];
    AVPlayerItem * currentItem = [AVPlayerItem playerItemWithURL:url];
    NSString *songTitle = @"Local music";
    
    [self.audioPlayer replaceCurrentItemWithPlayerItem:currentItem];
    [self.audioPlayer play];
    [self.togglePlayPause setSelected:YES];
    self.songName.text = songTitle;
    [self.sliderOutlet setMaximumValue:self.audioPlayer.currentItem.duration.value/self.audioPlayer.currentItem.duration.timescale];
  [self configurePlayer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)togglePlayPauseTapped:(id)sender {
  if(self.togglePlayPause.selected) {
    [self.audioPlayer pause];
    [self.togglePlayPause setSelected:NO];
  } else {
    [self.audioPlayer play];
    [self.togglePlayPause setSelected:YES];
  }

}
- (IBAction)sliderDragged:(id)sender {
  [self.audioPlayer seekToTime:CMTimeMakeWithSeconds((int)(self.sliderOutlet.value) , 1)];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//  return self.songsList.count;
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"MusicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (indexPath.row == 0) {
          cell.textLabel.text = @"Local music";
    }else if(indexPath.row == 1){
      cell.textLabel.text = @"Remote music";
    }
  else
      cell = nil;
  return cell;
}

#pragma mark - TableView Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self.audioPlayer pause];
    static NSString *cellIdentifier = @"MusicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    AVPlayerItem *currentItem;
    NSString *songTitle;
    if(indexPath.row == 0){
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]];
        currentItem = [AVPlayerItem playerItemWithURL:url];
        songTitle = @"Local music";
    }else{
    currentItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://music.baidu.com/data/music/file?link=http://zhangmenshiting.baidu.com/data2/music/41445605/14959061190800128.mp3?xcode=1c491492e7c8e41ac6c9ddd5d9424975f875b61110668c14"]];
        songTitle = @"Remote music";
    }
  
  [self.audioPlayer replaceCurrentItemWithPlayerItem:currentItem];
  [self.audioPlayer play];
  [self.togglePlayPause setSelected:YES];
  self.songName.text = songTitle;
  [self.sliderOutlet setMaximumValue:self.audioPlayer.currentItem.duration.value/self.audioPlayer.currentItem.duration.timescale];
}

-(void) configurePlayer {
  //7
  __block MVViewController * weakSelf = self;
  //8
  [self.audioPlayer addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1, 1)
                                                 queue:NULL
                                            usingBlock:^(CMTime time) {
                                              if(!time.value) {
                                                return;
                                              }
                
                       
                                              
                                              int currentTime = (int)((weakSelf.audioPlayer.currentTime.value)/weakSelf.audioPlayer.currentTime.timescale);
                                              int currentMins = (int)(currentTime/60);
                                              int currentSec  = (int)(currentTime%60);
                                              

                                              
                                              NSString * durationLabel =
                                              [NSString stringWithFormat:@"%02d:%02d",currentMins,currentSec];
                                              weakSelf.durationOutlet.text = durationLabel;
                                              weakSelf.sliderOutlet.value = currentTime;
                                            }];

}

@end
