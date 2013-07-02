MediaMaterial
=============

Play music and video from local and remote.

==========================================================================================
MusicPlayer App: The app uses AVFoundation.framwork. We create an AVPlayer object to handle the controls of music playback.

Create an AVPlayer object.
<code>self.audioPlayer = [[AVPlayer alloc] init];</code>

Prepare an local music URL.
<code>NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3”]];</code>

Use an AVPlayerItem object to represent the music.
<code>AVPlayerItem * currentItem = [AVPlayerItem playerItemWithURL:url];</code>
    
Add the AVPlayerItem to AVPlayer and play it.
<code>[self.audioPlayer replaceCurrentItemWithPlayerItem:currentItem];
[self.audioPlayer play];</code>


==========================================================================================
VideoPlayer App: The app uses MediaPlayer.framwork. We create a MPMoviePlayerController to handle video playing issues.

Create a MPMoivePLayerController with the content URL.
<code>moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];</code>

Add moviePlayer to the main view as a subView.
<code>[self.view addSubview:moviePlayer.view];</code>

Then set to fullScreen with an animation.
<code>[moviePlayer setFullscreen:YES animated:YES];</code>