MediaMaterial
=============

Play music and video from local and remote.

==========================================================================================
MusicPlayer App: The app uses AVFoundation.framwork. We create an AVPlayer object to handle the controls of music playback.

Create an AVPlayer object.
self.audioPlayer = [[AVPlayer alloc] init];

Prepare an local music URL.
NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]];

Use an AVPlayerItem object to represent the music.
AVPlayerItem * currentItem = [AVPlayerItem playerItemWithURL:url];
    
Add the AVPlayerItem to AVPlayer and play it.
[self.audioPlayer replaceCurrentItemWithPlayerItem:currentItem];
[self.audioPlayer play];


==========================================================================================
VideoPlayer App: The app uses MediaPlayer.framwork. We create a MPMoviePlayerController to handle video playing issues.

Create a MPMoivePLayerController with the content URL.
moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];

Add moviePlayer to the main view as a subView
[self.view addSubview:moviePlayer.view];

Then set to fullScreen with an animation
[moviePlayer setFullscreen:YES animated:YES];



MusicPlayer这个app主要用的是AVFoundation这个framwork里的AVPlayer

每一首歌是以AVPlayerItem存在的。具体怎么获取资源，同样都是可以根据NSURL来的

audioPlayer加载了item后，就直接通过play方法来播放歌曲了。