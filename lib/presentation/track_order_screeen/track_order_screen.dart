import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/utils/assets_manager.dart';
import 'package:flora_mart/core/utils/config.dart';
import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/core/utils/string_manager.dart';
import 'package:flora_mart/core/utils/text_style_manager.dart';
import 'package:flora_mart/data/model/getSavedAddressResponce.dart';
import 'package:flora_mart/data/model/order_tracked/order_tracked_response.dart';
import 'package:flora_mart/presentation/auth/view_model/cubit/auth_cubit.dart';
import 'package:flora_mart/presentation/order_map_screen/view_model.dart/cubit/order_map_cubit.dart';
import 'package:flora_mart/presentation/track_order_screeen/view_model/cubit/track_order_cubit.dart';
import 'package:flora_mart/presentation/track_order_screeen/widget/driver_info_siction.dart';
import 'package:flora_mart/presentation/order_map_screen/order_map_screen.dart';
import 'package:flora_mart/presentation/track_order_screeen/widget/time_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrackOrderScreen extends StatefulWidget {
  final String orderId;
  final AddressesModel address;
  const TrackOrderScreen(
      {super.key, required this.orderId, required this.address});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  void initState() {
    final user = AuthCubit.get(context).userModel;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TrackOrderCubit.get(context).createTrackedOrder(OrderTrackerModel(
          orderId: widget.orderId,
          userId: user?.user?.id ?? "",
          userLatitude: widget.address.lat,
          userLongitude: widget.address.long,
          estimatedArrival: DateTime.now().add(const Duration(days: 3))));

      TrackOrderCubit.get(context).getTrackedOrder(widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.trackorder),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, RouteManager.mainScreen, (_) => false),
          ),
        ),
        body: BlocBuilder<TrackOrderCubit, TrackOrderState>(
          builder: (context, state) {
            if (state is GetTrackOrderSuccessState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppStrings.estimatedArrival,
                      style: AppTextStyle.medium14.copyWith(color: Colors.grey),
                    ),
                    Text(
                      state.orderTrackerModel.estimatedArrival != null
                          ? formatter
                              .format(state.orderTrackerModel.estimatedArrival!)
                          : 'Soon',
                      style: AppTextStyle.medium16,
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                    Config.spaceMedium,
                    state.orderTrackerModel.driverName != null &&
                            state.orderTrackerModel.driverPhone != null
                        ? DriverInfoSiction(
                            driverPhone: state.orderTrackerModel.driverPhone,
                            driverName: state.orderTrackerModel.driverName,
                          )
                        : Center(
                            child: Text(
                              AppStrings.waitingfordriveraccept,
                              style: AppTextStyle.regular24,
                            ),
                          ),
                    Config.spaceMedium,
                    Center(child: SvgPicture.asset(AssetsManager.imagesCar)),
                    Config.spaceMedium,
                    Expanded(
                        child: TimeLineWidget(
                      orderStatus: state.orderTrackerModel.orderStatus ?? [],
                    )),
                    // Update the ElevatedButton onPressed callback (around line 95)
                    ElevatedButton(
                        onPressed: () {
                          // Update the onPressed callback state
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => getIt<OrdermapCubit>()
                                  ..initMap(widget.address),
                                child: OrderMapScreen(
                                  address: widget.address,
                                  orderTrackerModel: state.orderTrackerModel,
                                ),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(double.infinity, Config.screenHight! * 0.06),
                        ),
                        child: Text(
                          AppStrings.showmap,
                          style: AppTextStyle.medium18.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        )),
                    Config.spaceSmall,
                  ],
                ),
              );
            }
            if (state is GetTrackOrderErrorState) {
              return Center(child: Text(state.message));
            }
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ));
          },
        ),
      ),
    );
  }
}
