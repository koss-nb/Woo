import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/popUp.dart';
import 'package:woo/core/widgets/reaction.dart';
import 'package:woo/presentation/screens/pages/comment.dart';
import 'package:woo/presentation/screens/pages/share_on_my_account.dart';

class Publication extends StatefulWidget {
  final void Function()? onTap;
  final String likesCount;
  final String commentsCount;
  final AssetImage imageUrl;

  // Icônes personnalisables
  final IconData likeIcon;
  final IconData commentIcon;
  final IconData shareIcon;
  final IconData downloadIcon;
  final IconData visibilityIcon;
  final IconData moreOptionsIcon;

  // Drapeaux pour afficher ou masquer les icônes
  final bool showLikeIcon;
  final bool showCommentIcon;
  final bool showShareIcon;
  final bool showDownloadIcon;
  final bool showVisibilityIcon;
  final bool showMoreOptionsIcon;

  // Personnalisation de la bordure
  final BorderRadius borderRadius;

  const Publication({
    required this.likesCount,
    required this.commentsCount,
    required this.imageUrl,
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
    this.borderRadius = const BorderRadius.all(Radius.circular(20)), // Valeur par défaut
    super.key,
  });

  @override
  State<Publication> createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  bool _showReactionBar = false;

  void _toggleReactionBar() {
    setState(() {
      _showReactionBar = !_showReactionBar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: ClipRRect(
              borderRadius: widget.borderRadius, // Utilisation de la bordure personnalisée
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image(
                      image: widget.imageUrl,
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          children: [
                            if (widget.showLikeIcon)
                              GestureDetector(
                                onLongPress: _toggleReactionBar,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    widget.likeIcon,
                                    color: AppColors.primary,
                                  ),
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
                                      builder: (context) => Patagersurmoncompt(),
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
                                icon: Icon(
                                  widget.downloadIcon,
                                  color: Colors.white,
                                ),
                              ),
                          ],
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
    );
  }
}
