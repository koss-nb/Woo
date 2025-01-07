import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:woo/core/widgets/color.dart'; // Pour Timer
import 'package:woo/core/widgets/popUp.dart';
import 'package:woo/core/widgets/reaction.dart';
import 'package:woo/presentation/screens/pages/comment.dart';
import 'package:woo/presentation/screens/pages/share_on_my_account.dart';

class LocalVideoPlayer extends StatefulWidget {
  final String videoPath;
  final String likesCount;
  final String commentsCount;
  final VoidCallback? onTap;
  final IconData likeIcon;
  final IconData commentIcon;
  final IconData shareIcon;
  final IconData downloadIcon;
  final IconData visibilityIcon;
  final IconData moreOptionsIcon;
  final bool showLikeIcon;
  final bool showCommentIcon;
  final bool showShareIcon;
  final bool showDownloadIcon;
  final bool showVisibilityIcon;
  final bool showMoreOptionsIcon;
  final BorderRadius borderRadius;

  const LocalVideoPlayer({
    Key? key,
    required this.videoPath,
    required this.likesCount,
    required this.commentsCount,
    this.onTap,
    this.likeIcon = Icons.favorite,
    this.commentIcon = Icons.comment,
    this.shareIcon = Icons.share,
    this.downloadIcon = Icons.download,
    this.visibilityIcon = Icons.visibility_off,
    this.moreOptionsIcon = Icons.more_horiz,
    this.showLikeIcon = true,
    this.showCommentIcon = true,
    this.showShareIcon = true,
    this.showDownloadIcon = true,
    this.showVisibilityIcon = true,
    this.showMoreOptionsIcon = true,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  }) : super(key: key);

  @override
  _LocalVideoPlayerState createState() => _LocalVideoPlayerState();
}

class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showPlayButton = true;
  Timer? _hidePlayButtonTimer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _hidePlayButtonTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _showPlayButton = true;
      } else {
        _controller.play();
        _showPlayButton = true;

        // Masquer le bouton après 3 secondes
        _hidePlayButtonTimer?.cancel();
        _hidePlayButtonTimer = Timer(const Duration(seconds: 3), () {
          setState(() {
            _showPlayButton = false;
          });
        });
      }
    });
  }

  bool _showReactionBar = false;

  void _toggleReactionBar() {
    setState(() {
      _showReactionBar = !_showReactionBar;
    });
  }

  void _pauseVideoOnScroll() {
    if (_isPlaying) {
      _controller.pause();
      setState(() {
        _isPlaying = false;
        _showPlayButton = true; // Montre le bouton pause/play
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollStartNotification) {
          _pauseVideoOnScroll();
        }
        return true;
      },
      child: GestureDetector(
        onTap: () {
          if (_controller.value.isPlaying) {
            _togglePlayPause(); // Pause la vidéo et affiche le bouton Play
          } else {
            _togglePlayPause(); // Joue la vidéo et masque le bouton Play après 3 secondes
          }
        },
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: ClipRRect(
                borderRadius: widget.borderRadius,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    if (_controller.value.isInitialized)
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    if (_controller.value.isInitialized)
                      Positioned(
                        bottom: 23, // Placer la barre en bas de l'écran
                        left: 170,
                        right: 60,
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing:
                              true, // Permet d'interagir avec la barre
                          colors: VideoProgressColors(
                            playedColor: AppColors.primary,
                            backgroundColor: Colors.grey,
                            bufferedColor: Colors.white,
                          ),
                        ),
                      ),
                    if (_showPlayButton)
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: IconButton(
                            onPressed: _togglePlayPause,
                            icon: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    if (widget.showLikeIcon ||
                        widget.showCommentIcon ||
                        widget.showShareIcon ||
                        widget.showDownloadIcon)
                      if (_showReactionBar)
                        Positioned(
                          bottom: 50,
                          left: 0,
                          right: 0,
                          child: ReactionBar(),
                        ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              if (widget.showLikeIcon)
                                GestureDetector(
                                  onLongPress: _toggleReactionBar,
                                  onTap: () {
                                    // Ajoutez ici l'action pour un appui court si nécessaire
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        widget.likeIcon,
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  ),
                                ),
                              if (widget.showLikeIcon)
                                Text(
                                  widget.likesCount,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              if (widget.showCommentIcon)
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CommentPage(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    widget.commentIcon,
                                    color: Colors.white,
                                  ),
                                ),
                              if (widget.showCommentIcon)
                                Text(
                                  widget.commentsCount,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              if (widget.showShareIcon)
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Patagersurmoncompt(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    widget.shareIcon,
                                    color: Colors.white,
                                  ),
                                ),
                              const Spacer(flex: 10),
                              if (widget.showDownloadIcon)
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(widget.downloadIcon,
                                      color: Colors.white),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_showPlayButton)
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: IconButton(
                            onPressed: _togglePlayPause,
                            icon: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    if (widget.showVisibilityIcon)
                      Positioned(
                        top: 5,
                        left: 16,
                        child: IconButton(
                          onPressed: () {
                            // Action pour le bouton gauche
                            showMasquer(context);
                          },
                          icon: Icon(
                            widget.visibilityIcon,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    if (widget.showMoreOptionsIcon)
                      Positioned(
                        top: 5,
                        right: 16,
                        child: IconButton(
                          onPressed: () {
                            // Action pour le bouton droit
                            showPopupListeOptions(context);
                          },
                          icon: Icon(
                            widget.moreOptionsIcon,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
