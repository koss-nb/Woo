import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/publication.dart';
import 'package:woo/core/widgets/video_player.dart';

class CommentPage extends StatelessWidget {
  CommentPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> posts = [
    {
      "username": "@animeLover",
      "timeAgo": "A l'instant",
      "postDescription": "Regardez mon dernier cosplay de Naruto!",
      "hashtags": "#cosplay #naruto #anime",
      "likes": "120",
      "comments": "30",
      "imagePath": AssetImage("images/animes.jpeg"),
    },
  ];

  final List<Map<String, dynamic>> comments = [
    {
      "username": "@user1",
      "comment": "C'est super bien fait !",
      "likes": "10",
      "subComments": [
        {
          "username": "@user2",
          "comment": "Ouais, vraiment impressionnant !",
          "likes": "5"
        },
        {
          "username": "@user3",
          "comment": "Je suis d'accord, c'est incroyable !",
          "likes": "3"
        },
      ],
    },
    {
      "username": "@user4",
      "comment": "J'adore ce cosplay!",
      "likes": "20",
      "subComments": [
        {
          "username": "@user5",
          "comment": "Il est vraiment fidèle au personnage !",
          "likes": "8"
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Affichage du post avec le bouton de retour superposé
          Expanded(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        posts[0]["imagePath"] is String &&
                                (posts[0]["imagePath"].endsWith('.MP4') ||
                                    posts[0]["imagePath"].endsWith('.MOV') ||
                                    posts[0]["imagePath"].endsWith('.mov') ||
                                    posts[0]["imagePath"].endsWith('.AVI') ||
                                    posts[0]["imagePath"].endsWith('.avi'))
                            ? ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxHeight: 675, // Limiter la hauteur
                                ),
                                child: LocalVideoPlayer(
                                  videoPath: posts[0]["imagePath"],
                                  likesCount: posts[0]["likes"],
                                  commentsCount: posts[0]["comments"],
                                  showVisibilityIcon: false,
                                  showMoreOptionsIcon: false,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              )
                            : Publication(
                                imageUrl: posts[0]["imagePath"],
                                likesCount: posts[0]["likes"],
                                commentsCount: posts[0]["comments"],
                                showVisibilityIcon: false,
                                showMoreOptionsIcon: false,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    posts[0]["username"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    posts[0]["timeAgo"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(posts[0]["postDescription"]),
                              const SizedBox(height: 5),
                              Text(
                                posts[0]["hashtags"],
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        tooltip: 'Retour',
                      ),
                    ),
                  ],
                ),

                // Section des commentaires
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          var comment = comments[index];
                          return Column(
                            children: [
                              ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "images/5bd5fc17416c01761655b8e5335c6f03.jpg"),
                                  radius: 20,
                                ),
                                title: Text(comment["username"]),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(comment["comment"]),
                                    Text(
                                      "${comment["likes"]} Likes",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              ExpansionTile(
                                title: SizedBox(height: 0),
                                children: List.generate(
                                  comment["subComments"].length,
                                  (subIndex) {
                                    var subComment =
                                        comment["subComments"][subIndex];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: ListTile(
                                        leading: const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "images/5bd5fc17416c01761655b8e5335c6f03.jpg"),
                                          radius: 20,
                                        ),
                                        title: Text(subComment["username"]),
                                        subtitle: Text(subComment["comment"]),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage("images/5bd5fc17416c01761655b8e5335c6f03.jpg"),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ajouter un commentaire',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Action pour envoyer le commentaire
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
