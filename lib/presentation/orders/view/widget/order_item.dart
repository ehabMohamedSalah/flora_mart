
import 'package:flora_mart/core/resuable_comp/text_button.dart';
import 'package:flora_mart/core/utils/colors_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/order_response/OrderResponse.dart';
import 'package:flora_mart/data/model/order_response/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resuable_comp/custom_network_image.dart';
import '../../../../data/model/order_response/OrderItems.dart';
import '../../../../data/model/order_response/Orders.dart';
import 'order_text_button.dart';

class OrderItem extends StatelessWidget {
  Product product;
  Orders order;

  OrderItem({required this.product,required this.order});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319.w,
      height: 125.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color:Color(0xff535353) )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
           children: [
            CustomNetworkImage(
              imageUrl: product.imgCover,
              height:107.h ,
              width: 92.w,
            ),
            SizedBox(width: 16.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(product.title??"",style: AppTextStyle.regular12,),
              SizedBox(height: 4.h,),
              Text("EGP ${product.priceAfterDiscount}" ,style: AppTextStyle.medium14,),
                SizedBox(height: 4.h,),

                Text("Order number#${order.orderNumber}" ,style: AppTextStyle.regular12,),
               Spacer(),
              CustomOrderTextButton(
                  onPressed: (){
                    //
                  },
                  borderColor: ColorManager.addToCartButtonColor,
                  text: "Track Order",
                  color: ColorManager.addToCartButtonColor,
                  textColor: ColorManager.white
              )


            ],),
          ],
        ),
      ),
    );
  }
}
