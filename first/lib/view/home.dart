import 'dart:io';

import 'package:first/controller/animation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    
    Provider.of<AnimationControllerP>(context,listen: false).init(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final provider = context.watch<AnimationControllerP>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: provider.islarge ? 1 : 0.0,
              child: AnimatedContainer(
                width: provider.islarge ? 200 : 100,
                height: provider.islarge ? 200 : 100,
                color: provider.islarge ? Colors.amber : Colors.blue,
                duration: Duration(seconds: 1),
                curve: Curves.elasticOut,
                ),
            ),

              ElevatedButton(onPressed: (){
                provider.change();
              }, child: Text("click")),

              SizedBox(height: 20,),

              // explicit

//               TweenAnimationBuilder<Color?>(
//   tween: ColorTween(begin: Colors.brown, end: Colors.amber),
//   duration: Duration(seconds: 2),
//   builder: (_, Color? color, __) {
//     return ColorFiltered(
//       colorFilter: ColorFilter.mode(color ?? Colors.transparent, BlendMode.modulate),
//       child: Image.network(
//         "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e001435/GSFC_20171208_Archive_e001435~large.jpg?w=1920&h=1920&fit=clip&crop=faces%2Cfocalpoint",
//         fit: BoxFit.cover,
//       ),
//     );
//   },
// )
// if(Platform.isIOS){

// },

Platform.isIOS ? CupertinoButton(child: Icon(CupertinoIcons.add), onPressed: (){}):Icon(Icons.abc, color: Colors.white,),
platform == TargetPlatform.iOS ? CupertinoButton(child: Icon(CupertinoIcons.add), onPressed: (){}):Icon(Icons.abc, color: Colors.white,),

            GestureDetector(
              onTap: () {
                if(provider.rotationTransitionaController.isAnimating){
                  provider.rotationTransitionaController.stop();
                }else{
                  provider.rotationTransitionaController.repeat();
                }
              },
              child: RotationTransition(
                   turns: provider.rotationTransitionaController,
                   child: Image.network("https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e001435/GSFC_20171208_Archive_e001435~large.jpg?w=1920&h=1920&fit=clip&crop=faces%2Cfocalpoint",
                   fit: BoxFit.cover,
                   ),
                   ),
            )


              
          ],
        ),
      ),
    );
  }
}