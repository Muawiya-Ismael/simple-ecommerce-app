
import 'package:flutter/material.dart';
import 'package:simple_ecommerce_app/models/shoe.dart';

// ignore: must_be_immutable
class ShoeTile extends StatelessWidget {
  ShoeTile({super.key, required this.shoe, required this.onTap});

  Shoe shoe;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(left: 25.0),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius:  BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.imagePath),
          ),


          Text(
            shoe.description,
            style: TextStyle(
              color: Colors.grey[600]
            ),
          ),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 25.0,),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      const SizedBox(height: 5.0,),

                      Text(
                        '\$${shoe.price}',
                        style: const TextStyle(
                            color: Colors.grey
                        ),)
                    ],
                  ),
               ),

               GestureDetector(
                 onTap: onTap,
                 child: Container(
                   padding: const EdgeInsets.all(20.0),
                   decoration: const BoxDecoration(
                     color: Colors.black,
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(12),
                       bottomRight: Radius.circular(12),
                     )
                   ),
                   child: const Icon(
                     Icons.add,
                     color: Colors.white,
                   ),
                 ),
               )

            ],
          )

        ],
      ),

    );
  }
}
