import 'package:flutter/material.dart';
import 'package:snapshare/utils/image_url.dart';
import 'package:snapshare/view/widget/CommentTileModelSheet.dart';
import 'package:snapshare/view/widget/home_screen_app_bar.dart';
import 'package:snapshare/view/widget/user_post_card.dart';
import '../widget/my_profile_story.dart';
import '../widget/other_profile_story.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness;
    return  Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: HomeScreenAppBar()
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const MyProfileStory();
                    }
                    return const OtherProfileStory();
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 16,
              color: Colors.grey.shade200,
            ),
          ),

          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                      (context,index){
                  return UserPostCard(
                      onTab: (){
                        homePageBottomModelSheet();
                      }
                  );
              }

          ))

        ],
      ),
    );
  }


  Future<void>homePageBottomModelSheet()async {
    TextEditingController commentEditingController = TextEditingController();
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: 425,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:[
                  const SizedBox(height: 8,),
                  Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text("Comment",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black.withOpacity(.8),
                  ),),
                  const Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context,index){
                          return const CommentTileModelSheet();
                        }),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 20,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 19,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(AssetsPath.profileLogo),
                                radius: 18,
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 7,
                        child: TextFormField(
                          controller: commentEditingController,
                          decoration: const InputDecoration(
                            hintText: "Add Commmets",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(onPressed: (){}, child: Text(
                          "Post",style: TextStyle(
                          color: Colors.blue.shade500,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

}
