import 'package:cached_network_image/cached_network_image.dart';
import 'package:dorcashub/general/allExports.dart';

//long tip container: this is used on the home page to show tips in the carosuel slider

class LongTipContainer extends StatelessWidget {
  final CommonSvgIconModel icon;
  final String title;
  final String description;
  final String learnMoreText;
  final String mainButtonText;
  final Function mainButtonFunction;

  const LongTipContainer(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.description,
      this.learnMoreText,
      @required this.mainButtonText,
      @required this.mainButtonFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        boxShadow: [
          BoxShadow(
            color: AppColors().blandGrey3,
            offset: Offset(-1.2, 1.2),
          ),
        ],
        color: AppColors().textWhite,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //rounded image
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors().blandGrey,
            ),
            child: CommonSvgIcon(
              svgDetials: icon,
              size: 60,
            ),
          ),

          SizedBox(height: 20),

          //texts
          Container(
            height: 120,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //tip title
                  CommonText(
                    text: title,
                    size: 16.5,
                    color: AppColors().black,
                    alignTextCenter: true,
                    bold: true,
                  ),

                  SizedBox(height: 10),

                  //tip description
                  CommonText(
                    text: description,
                    size: 15,
                    color: AppColors().darkGrey,
                    alignTextCenter: true,
                  ),
                ]),
          ),

          //main button
          GestureDetector(
            onTap: mainButtonFunction,
            child: Container(
              width: 250,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: AppColors().mainColor,
              ),
              child: Center(
                child: CommonText(
                    text: mainButtonText,
                    size: 14,
                    color: AppColors().textWhite),
              ),
            ),
          ),

          SizedBox(height: 10),

          //learn more button
          CommonText(
            text: learnMoreText != null
                ? learnMoreText.toUpperCase()
                : 'LEARN MORE',
            size: 14,
            color: AppColors().simpleBlue,
            alignTextCenter: true,
          ),
        ],
      ),
    );
  }
}

class BasicTipWiget extends StatelessWidget {
  final String title;
  final String description;
  final String learnMoreText;
  final String mainButtonText;
  final Function mainButtonFunction;

  const BasicTipWiget(
      {Key key,
      @required this.title,
      @required this.description,
      this.learnMoreText,
      @required this.mainButtonText,
      @required this.mainButtonFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // //divider
          // Container(
          //   width: 1000,
          //   height: 1,
          //   color: AppColors().grey
          // ),

          // SizedBox(height: 10),

          //container
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.more_vert,
                      size: 20,
                      color: AppColors().black,
                    ),
                  ),

                  CommonText(
                    text: title,
                    size: 17,
                    color: AppColors().black,
                    bold: true,
                  ),

                  SizedBox(height: 10),

                  //tip description
                  CommonText(
                    text: description,
                    size: 15,
                    color: AppColors().darkGrey,
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: mainButtonText.toUpperCase(),
                        size: 14,
                        color: AppColors().simpleBlue,
                        alignTextCenter: true,
                      ),

                      SizedBox(width: 10),

                      //learn more button
                      CommonText(
                        text: learnMoreText != null
                            ? learnMoreText.toUpperCase()
                            : 'LEARN MORE',
                        size: 14,
                        color: AppColors().simpleBlue,
                        alignTextCenter: true,
                      ),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

loadVideoPlayer() async {
  final videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

  await videoPlayerController.initialize();

  return videoPlayerController;
}


Widget videoPlayer() {
  return FutureBuilder(
      future: loadVideoPlayer(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CommonText(text: 'Video Loading');
        } else {
          final chewieController = ChewieController(
            videoPlayerController: snapshot.data,
            autoPlay: false,
            looping: false,
            materialProgressColors: ChewieProgressColors(backgroundColor: Colors.white, playedColor: Colors.white, handleColor: AppColors().mainColor),
            cupertinoProgressColors: ChewieProgressColors(backgroundColor: Colors.white, playedColor: Colors.white, handleColor: AppColors().mainColor),
          );

          return Chewie(
            controller: chewieController,
          );
        }
      });
}

class VideoTipWiget extends StatelessWidget {
  final String title;
  final String description;
  final String videoUrl;
  final String learnMoreText;
  final String mainButtonText;
  final Function mainButtonFunction;

  const VideoTipWiget(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.videoUrl,
      this.learnMoreText,
      @required this.mainButtonText,
      @required this.mainButtonFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //divider
          Container(
            width: 1000,
            height: 1,
            color: AppColors().grey
          ),

           SizedBox(height: 20),

          //container
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 200,
                    child: videoPlayer(),
                  ),

                   SizedBox(height: 10),
                  

                  CommonText(
                    text: title,
                    size: 17,
                    color: AppColors().black,
                    bold: true,
                  ),

                  SizedBox(height: 10),

                  //tip description
                  CommonText(
                    text: description,
                    size: 15,
                    color: AppColors().darkGrey,
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: mainButtonText.toUpperCase(),
                        size: 14,
                        color: AppColors().simpleBlue,
                        alignTextCenter: true,
                      ),

                      SizedBox(width: 10),

                      //learn more button
                      CommonText(
                        text: learnMoreText != null
                            ? learnMoreText.toUpperCase()
                            : 'LEARN MORE',
                        size: 14,
                        color: AppColors().simpleBlue,
                        alignTextCenter: true,
                      ),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}





class ImageTipWiget extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String learnMoreText;
  final String mainButtonText;
  final Function mainButtonFunction;

  const ImageTipWiget(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.imageUrl,
      this.learnMoreText,
      @required this.mainButtonText,
      @required this.mainButtonFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //divider
          Container(
            width: 1000,
            height: 1,
            color: AppColors().grey
          ),

           SizedBox(height: 20),

          //container
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 200,
                    child: CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: 1000,
      height: 200,
                    ),
                  ),

                   SizedBox(height: 10),
                  

                  CommonText(
                    text: title,
                    size: 17,
                    color: AppColors().black,
                    bold: true,
                  ),

                  SizedBox(height: 10),

                  //tip description
                  CommonText(
                    text: description,
                    size: 15,
                    color: AppColors().darkGrey,
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: mainButtonText.toUpperCase(),
                        size: 14,
                        color: AppColors().simpleBlue,
                        alignTextCenter: true,
                      ),

                      SizedBox(width: 10),

                      //learn more button
                      CommonText(
                        text: learnMoreText != null
                            ? learnMoreText.toUpperCase()
                            : 'LEARN MORE',
                        size: 14,
                        color: AppColors().simpleBlue,
                        alignTextCenter: true,
                      ),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}


class MyDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1, color: AppColors().blandGrey, height: 1,);
  }
}



class BasicItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const BasicItemWidget({Key key, @required this.icon, @required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 1000,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Icon(
             icon,
             size: 24,
             color: AppColors().grey,
            ),
    
            SizedBox(width: 20),
    
            CommonText(text: title, size: 20,)
          ]
        ),
        
      ),
    );
  }
}
