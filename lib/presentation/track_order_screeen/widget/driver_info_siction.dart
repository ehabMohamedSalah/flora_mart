import 'package:flora_mart/core/resuable_comp/toast_message.dart';
import 'package:flora_mart/core/utils/assets_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverInfoSiction extends StatelessWidget {
  final String? driverPhone;
  final String? driverName;
  const DriverInfoSiction(
      {super.key, required this.driverPhone, required this.driverName});

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(AssetsManager.imagesDeliveryBoy),
      SizedBox(width: Config.screenWidth! * 0.05),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          driverName ?? "",
          style: AppTextStyle.medium14,
        ),
        Text(
          AppStrings.isyourdeliveryherofortoday,
          style: AppTextStyle.regular12,
        ),
      ]),
      SizedBox(width: Config.screenWidth! * 0.09),
      InkWell(
        onTap: () async {
          await FlutterPhoneDirectCaller.callNumber(driverPhone ?? "");
        },
        child: SvgPicture.asset(AssetsManager.imagesCall),
      ),
      SizedBox(width: Config.screenWidth! * 0.05),
      InkWell(
        onTap: () async {
          final phone =
              driverPhone ?? "".replaceAll('+', '').replaceAll(' ', '');
          final url = Uri.parse("https://wa.me/$phone");

          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          } else {
            toastMessage(
                message: AppStrings.whatsAppcannotbeopened,
                tybeMessage: TybeMessage.negative);
          }
        },
        child: SvgPicture.asset(AssetsManager.imagesWhatsapp),
      ),
    ]);
  }
}
