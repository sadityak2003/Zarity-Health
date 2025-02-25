import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zarityhealth/src/widgets/custom_appname.dart';
import 'package:zarityhealth/src/widgets/custom_drawer.dart';
import '../provider/blog_provider.dart';
import 'blog_detail_screen.dart';

class BlogListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogStream = ref.watch(blogsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CustomAppName(fontSize: 20),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black54),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: blogStream.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
        data: (snapshot) {
          if (snapshot.docs.isEmpty) {
            return const Center(child: Text("No blog posts available"));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              var blog = snapshot.docs[index];
              String imageUrl = blog["imageURL"] ?? "";
              String title = blog["title"] ?? "Untitled";
              String summary = blog["summary"] ?? "No summary available.";
              String blogId = blog.id;

              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                      child: imageUrl.isNotEmpty
                          ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                        loadingBuilder:
                            (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image,
                                size: 80, color: Colors.grey),
                          );
                        },
                      )
                          : Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported,
                            size: 80, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Text(summary,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey)),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BlogDetailScreen(blogId: blogId),
                                  ),
                                );
                              },
                              child: const Text("Read More"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
