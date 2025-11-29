import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/common/widgets/app_scaffold.dart';
import 'package:flutter_carlos112mo/features/wall/presentation/controller/wall_controller.dart';
import 'package:flutter_carlos112mo/features/wall/presentation/screens/create_post_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';

class WallScreen extends StatelessWidget {
  const WallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WallController wallController = Get.find<WallController>();
    return AppScaffold(
      showDefaultAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text('Social Wall', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: (){
                Get.to(() => CreatePostScreen());
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.4),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    )

                  ]
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0xFF969696)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.messenger_outline, size: 20, color: Color(0xFF969696),),
                      SizedBox(width: 8),
                      Text('What\'s on your mind?', style: TextStyle(
                        color: Color(0xFF969696)
                      ),),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24,),
            Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: wallController.wallPost.length,
                  itemBuilder: (context, index){
                    final item = wallController.wallPost[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 24),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.4),
                            blurRadius: 4,
                            offset: Offset(0,0)
                        )
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/profile_sample.jpg'),
                            radius: 20,
                          ),
                          const SizedBox(width: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mr. Raja', style: TextStyle(
                                fontWeight: FontWeight.w600,)
                              ),
                              Text(formatDate(item?.createdAt ?? ''), style: TextStyle(
                                color: Color(0xFFCCCCCC),
                              ),)
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Text(item?.content ?? ''),
                      const SizedBox(height: 16,),
                      if(item?.teamId != null && item?.teamId?.isNotEmpty == true)
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLightGreen,
                                borderRadius: BorderRadius.circular(8),

                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Match Invitation', style: TextStyle(
                                      color: AppColors.primaryGreen
                                  ),),
                                  SizedBox(height: 18,),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today_outlined, size: 20, color: AppColors.primaryGreen,),
                                      const SizedBox(width: 8,),
                                      Text('September 17, 2025   at 16:00'),
                                    ],
                                  ),
                                  const SizedBox(height: 16,),
                                  Row(
                                    children: [
                                      Icon(Icons.messenger_outline, size: 20, color: AppColors.primaryGreen,),
                                      const SizedBox(width: 8,),
                                      Text('Green Valley Field'),
                                    ],
                                  ),
                                  const SizedBox(height: 16,),
                                  Row(
                                    children: [
                                      Icon(Icons.person_outline, size: 20, color: AppColors.primaryGreen,),
                                      const SizedBox(width: 8,),
                                      Text('Team: City Strikers'),
                                    ],
                                  ),
                                  const SizedBox(height: 16,),
                                  Text('3 players needed', style: TextStyle(
                                      color: AppColors.primaryGreen
                                  ),),
                                  const SizedBox(height: 16,),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size.fromWidth(double.maxFinite),
                                      backgroundColor: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      wallController.joinMatch(item?.teamId ?? '');
                                    },
                                    child: const Text("Join Match"),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16,),
                          ],
                        ),
                      Divider(
                        color: Color(0xFD9D9D9F),
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        children: [
                          const SizedBox(width: 56,),
                          Image.asset('assets/images/thumb_up.png', height: 20, width: 20,),
                          const SizedBox(width: 8,),
                          Text('Like'),
                          Spacer(),
                          Image.asset('assets/images/comment.png', height: 20, width: 20,),
                          const SizedBox(width: 8,),
                          Text('Comment'),
                          const SizedBox(width: 56,),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      if(item?.comments != null && item?.comments?.isNotEmpty == true)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Comments'),
                            const SizedBox(height: 16,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/profile_sample.jpg'),
                                  radius: 20,
                                ),
                                const SizedBox(width: 8,),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE5E7EB),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Sarah Owner', style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),),
                                      const SizedBox(height: 8,),
                                      Text(item?.comments?.last.text ?? ''),
                                      const SizedBox(height: 8,),
                                      Text('Aug 14 • 4:00 PM', style: TextStyle(color: Color(0xFF969696)),),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                    else
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/profile_sample.jpg'),
                            radius: 20,
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: TextField(
                              controller: wallController.getCommentController(item?.sId ?? ''),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide(color: Color(0xFF969696)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    borderSide: BorderSide(color: Color(0xFF969696)),
                                  ),
                                hintText: 'What\'s on your mind?',
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    wallController.postComment(item?.sId ?? '');
                                  },
                                    child: Icon(Icons.send, color: Color(0xFF969696), size: 20,))
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
            )

          ],
        ),
      ),
    );
  }
  String formatDate(String isoDate){
    try{
      DateTime date = DateTime.parse(isoDate).toLocal();
      String formatted = DateFormat("MMM d, yyyy • h:mm a").format(date);
      return formatted;
    }catch(e){
      return isoDate;
    }
  }
}
