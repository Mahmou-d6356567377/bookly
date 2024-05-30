import 'package:flutter/material.dart';

import '../../../../../core/Helps/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
        child: Row(
          
          children: [ 
            Image.asset(kLogoImage, width: 85,),
            const Spacer(),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
        ],),
       
      ),
    );
  }
}