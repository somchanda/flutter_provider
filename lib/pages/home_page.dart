import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/helpers/apihelper.dart';
import 'package:using_provider/models/post.dart';
import 'package:using_provider/providers/homepageprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _getPosts() async {
    var provider = Provider.of<HomePageProvider>(context, listen: false);
    var response = await APIHelper.getPosts();
    if (response.isSuccessful == true) {
      provider.setPostList(response.data);
      provider.setIsProcessing(false);
    }
  }

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Using Provider"),
      ),
      body: Consumer<HomePageProvider>(
        builder: (context, value, child) => value.isProcessing == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  Post post = value.getPostByIndex(index);
                  return ListTile(
                    leading: const Icon(Icons.list),
                    title: Text(post.title!),
                    subtitle: Text(
                      post.body!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
                itemCount: value.postList!.length,
              ),
      ),
    );
  }
}
