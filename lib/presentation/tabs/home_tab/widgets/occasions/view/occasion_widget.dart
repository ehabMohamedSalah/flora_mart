// ignore_for_file: library_private_types_in_public_api

import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/data/model/occasions/Occasions.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view/widget/product_of_occasions_widget.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view_model/occasions_cubit.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view_model/occasions_intent.dart';
import 'package:flora_mart/presentation/tabs/home_tab/widgets/occasions/view_model/occasions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resuable_comp/custom_tab_bar_widget.dart';
import '../../../../../../core/utils/string_manager.dart';

class OccasionScreen extends StatefulWidget {
  final String? selectedOccasionId;

  const OccasionScreen({super.key, this.selectedOccasionId});
  @override
  _OccasionScreenState createState() => _OccasionScreenState();
}

class _OccasionScreenState extends State<OccasionScreen>
    with SingleTickerProviderStateMixin {
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

    if (widget.selectedOccasionId != null) {
      final index =
          occasionsList.indexWhere((o) => o.id == widget.selectedOccasionId);
      if (index != -1) {
        selectedIndex = index;

        // هتأخر التغيير لحد ما كل حاجة تبقى جاهزة
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _tabController!.animateTo(index);
        });
      }
    }

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
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is GetOccasionError) {
            return Scaffold(
              body: Center(child: Text("Error: ${state.message}")),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.occasion,
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.bloomWithOurExquisiteBestSellers,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
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
                        .map((o) => ProductsOfOccasionWidget(
                              occasionId: o.id ?? "",
                            ))
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
