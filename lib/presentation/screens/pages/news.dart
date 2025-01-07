import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/popUp.dart';
import 'package:woo/core/widgets/publication.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';
import 'package:woo/core/widgets/video_player.dart';
import 'package:woo/presentation/screens/pages/chat.dart';
import 'package:woo/presentation/screens/pages/create_news.dart';
import 'package:woo/presentation/screens/pages/notification.dart';
import 'package:woo/presentation/screens/pages/profile.dart'; // Importez le widget de la barre de navigation

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _selectedIndex = 0;
  bool _isLoading = false;
  bool _hasMoreData = true;
  List<Map<String, dynamic>> posts = [];
  final ScrollController _scrollController = ScrollController();
  // Liste de données des postes
  final List<Map<String, dynamic>> allPosts = [
    {
      "username": "@animeLover",
      "timeAgo": "A l'instant",
      "postDescription": "Regardez mon dernier cosplay de Naruto!",
      "hashtags": "#cosplay #naruto #anime",
      "likes": "120",
      "comments": "30",
      "imagePath": AssetImage("images/animes.jpeg"),
    },
    {
      "username": "@otakuGirl",
      "timeAgo": "10 min",
      "postDescription": "Art digital inspiré de One Piece.",
      "hashtags": "#art #onepiece #otaku",
      "likes": "340",
      "comments": "45",
      "imagePath": "videos/naruto.MP4",
    },
    {
      "username": "@chibiQueen",
      "timeAgo": "20 min",
      "postDescription": "Chibi art que j'ai créé aujourd'hui!",
      "hashtags": "#chibi #art #kawaii",
      "likes": "410",
      "comments": "25",
      "imagePath": AssetImage("images/n3.png"),
    },
    {
      "username": "@mangaKing",
      "timeAgo": "15 min",
      "postDescription": "Découvrez mon nouveau manga préféré!",
      "hashtags": "#manga #reading #otaku",
      "likes": "280",
      "comments": "60",
      "imagePath": "videos/n3.avi",
    },
    {
      "username": "@sakuraFan",
      "timeAgo": "25 min",
      "postDescription": "Mon hommage à Sakura Haruno.",
      "hashtags": "#naruto #sakura #fanart",
      "likes": "500",
      "comments": "80",
      "imagePath": "videos/n4.avi",
    },
    
  ];

  // Charger un nouveau lot de 4 éléments
  void _loadMorePosts() {
    if (_isLoading || !_hasMoreData) return;

    setState(() {
      _isLoading = true;
    });

    // Simuler une attente pour récupérer toutes les données
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // Charge tous les posts si plus de données sont disponibles
        if (posts.length < allPosts.length) {
          posts.addAll(allPosts);
        } else {
          _hasMoreData = false; // Il n'y a plus de données à charger
        }
        _isLoading = false;
      });
    });
  }

  // Vérifier si on est proche du bas de la liste pour charger plus de contenu
  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMorePosts();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadMorePosts(); // Charger les premiers 4 posts
    _scrollController.addListener(_onScroll); // Ajouter l'écouteur de scroll
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

// Liste des pages que vous souhaitez afficher
  final List<Widget> _pages = [
    NewsPage(), // Remplacez par la page de news
    MessagePage(), // Remplacez par la page de messages
    CreatePage(), // Remplacez par la page de publication
    NotifiPage(), // Remplacez par la page de notifications
    ProfilePage(), // Remplacez par la page de profil
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Ajoutez ici la logique pour la navigation si nécessaire
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => _pages[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Supprimer le bouton retour
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'WOO',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                // Remplacer le bouton abonnement par un bouton icône
                IconButton(
                  onPressed: () {
                    showPopupAvecBoutonExterieur(context);
                  },
                  icon: Icon(
                    Icons.cached_outlined,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_rounded,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap:
              true, // Nécessaire pour éviter l'erreur de ListView dans SingleChildScrollView
          physics:
              NeverScrollableScrollPhysics(), // Désactive le scroll interne de ListView
          padding: EdgeInsets.all(10),
          itemCount: posts.length + 1,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index == posts.length) {
              // Afficher un indicateur de chargement au bas
              return _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink();
            }
            final post = posts[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Vérifiez si le chemin correspond à une vidéo
                post["imagePath"] is String &&
                        (post["imagePath"].endsWith('.MP4') ||
                            post["imagePath"].endsWith('.MOV') ||
                            post["imagePath"].endsWith('.mp4') ||
                            post["imagePath"].endsWith('.mov') ||
                            post["imagePath"].endsWith('.AVI') ||
                            post["imagePath"].endsWith('.avi'))
                    ? ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        child: LocalVideoPlayer(
                          likesCount: post["likes"],
                        commentsCount: post["comments"],
                          videoPath:
                              post["imagePath"], // Passez le chemin de la vidéo
                        ),
                      )
                    : Publication(
                        imageUrl: post["imagePath"],
                        likesCount: post["likes"],
                        commentsCount: post["comments"],
                      ),
                // Informations sous la carte
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post["username"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            post["timeAgo"],
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(post["postDescription"]),
                      SizedBox(height: 5),
                      Text(
                        post["hashtags"],
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Passez la fonction de callback
      ),
    );
  }
}
