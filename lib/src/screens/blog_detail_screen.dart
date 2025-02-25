import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarityhealth/src/widgets/custom_appname.dart';

import '../provider/blog_provider.dart';


class BlogDetailScreen extends ConsumerWidget {
  final String blogId;
  BlogDetailScreen({required this.blogId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogFuture = ref.watch(blogDetailProvider(blogId));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const CustomAppName(fontSize: 20),
      ),
      body: blogFuture.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
        data: (blog) {
          if (blog == null) {
            return const Center(child: Text("Blog not found"));
          }

          return Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.network(blog['imageURL'],
                        fit: BoxFit.cover, width: double.infinity),
                  ),
                  const SizedBox(height: 10),
                  Text(blog['title'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(blog['content'], style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
