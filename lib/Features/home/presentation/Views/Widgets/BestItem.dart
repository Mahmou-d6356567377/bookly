import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/Helps/constants.dart';
import '../../../../../core/styles/styles.dart';


class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                       const Expanded(child:  BookRating()),
                     ],
                   ),
              ],
                       ),
           ),
        ],
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row( 
      children: [ 
       const Spacer(),
       const Icon(FontAwesomeIcons.solidStar,
       color: Color(0xffFFDD4D),),
       const SizedBox(width: 6.3,),
       const Text('4.8',style: Styles.style15,),
       const SizedBox(width: 5,),
       Text('(23443)',style: Styles.style14.copyWith(color:Color(0xff707070)),),
      ],
    );
  }
}