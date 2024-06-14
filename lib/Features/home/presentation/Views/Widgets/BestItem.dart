import 'package:bookly/Features/home/presentation/Views/Widgets/RatingWidget.dart';
import 'package:bookly/core/Utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Helps/constants.dart';
import '../../../../../core/styles/styles.dart';


class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRoutes.bd);
      },
      child: SizedBox(
        height: 126,
        child: Row(
          children: [ 
            AspectRatio(
              aspectRatio: 2.5/4,
              child: Container( 
                decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(ktestImage) ,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30,),
             Expanded(
               child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
               
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child:  Text('Harry Botter and the Goblet of fire' ,style: Styles.style20.copyWith(fontFamily: 'GT'),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    )),
               
               
                   const SizedBox(height: 3,),
                     Text('J.K. Rowline ',style: Styles.style14.copyWith(color: Colors.blueGrey ),
                     ),
               
                      const SizedBox(height: 3,),
                      Row(
                       children: [ 
                         Text('19.99',style: Styles.style20.copyWith(fontWeight: FontWeight.bold),
                         ),
                         const Expanded(child:  Row(
                           children: [
                            Spacer(),
                             BookRating(),
                           ],
                         )),
                       ],
                     ),
                ],
                         ),
             ),
          ],
        ),
      ),
    );
  }
}

