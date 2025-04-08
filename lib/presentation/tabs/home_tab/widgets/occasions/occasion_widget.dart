import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/data/model/occasions/Occasions.dart';
import 'package:flora_mart/domain/entity/occassions_entity/OccasionsResponse.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_cubit.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_intent.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view_model/occasions_cubit.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view_model/occasions_intent.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view_model/occasions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resuable_comp/app_bar.dart';
import '../../../../../core/resuable_comp/custom_tab_bar_widget.dart';
import '../../../../../core/utils/string_manager.dart';
import '../image_widget.dart';


class OccasionWidget extends StatefulWidget {
  @override
  _OccasionWidgetState createState() => _OccasionWidgetState();
}

class _OccasionWidgetState extends State<OccasionWidget> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int selectedIndex = 0;
  List<Occasions> occasionsList = [];

  late OccasionsCubit cubit; // define once

  @override
  void initState() {
    super.initState();
    cubit = getIt<OccasionsCubit>(); // inject once
    Future.delayed(Duration.zero, () {
      cubit.doIntent(GetOccaisonIntent());
    });
  }

  void _setupTabController() {
    _tabController?.dispose();
    _tabController = TabController(length: occasionsList.length, vsync: this);
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        setState(() {
          selectedIndex = _tabController!.index;
        });
      }
    });
  }

  void _onTabChanged(int index) {
    setState(() {
      selectedIndex = index;
      _tabController?.animateTo(index);
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    cubit.close(); // important
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<OccasionsCubit, OccasionsState>(
        listener: (context, state) {
          if (state is GetOccasionSuccess) {
            occasionsList = state.occasions?.occasions ?? [];
            _setupTabController();
          }
        },
        builder: (context, state) {
          if (state is GetOccasionLoading || _tabController == null) {
            return Scaffold(

              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is GetOccasionError) {
            return Scaffold(
               body: Center(child: Text("Error: ${state.message}")),
            );
          }

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteManager.homeScreen,
                          (route) => false,
                    );                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(AppStrings.occasions,style: Theme.of(context).textTheme.titleLarge,)),
                  Align(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      AppStrings.BloomWithOurExquisiteBestSellers,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),

                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomTabBar(
                  controller: _tabController!,
                  onTabChanged: _onTabChanged,
                  selectedIndex: selectedIndex,
                  tabs: occasionsList.map((o) => o.name ?? "Tab").toList(),
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 40.h),
                Expanded(
                  child: TabBarView(
                    controller: _tabController!,
                    children: occasionsList
                        .map((o) => Center(child: Text("Content for ${o.name}")))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
