import 'package:flora_mart/core/di/di.dart';
import 'package:flora_mart/core/utils/routes_manager.dart';
import 'package:flora_mart/presentation/tabs/home_tab/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resuable_comp/app_bar.dart';
import '../../../../core/utils/string_manager.dart';
import 'image_widget.dart';

class OccasionWidget extends StatefulWidget {
  @override
  _OccasionWidgetState createState() => _OccasionWidgetState();
}

class _OccasionWidgetState extends State<OccasionWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // تحديد عدد التبويبات هنا
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: AppBarWidget(
            onpressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteManager.homeScreen,
                    (route) => false,
              );
            },
            title: AppStrings.occasions,
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true, // التبويبات قابلة للتمرير
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
            ],
            labelColor: Colors.red, // لون النص عند التحديد
            unselectedLabelColor: Colors.grey, // لون النص الغير محدد
            indicatorColor: Colors.red, // لون الخط أسفل التبويب المحدد
            labelStyle: TextStyle(fontSize: 14.sp), // تعيين حجم الخط لكل التبويبات
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 40.h),
            Text(
              AppStrings.BloomWithOurExquisiteBestSellers,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // محتوى التبويب 1
                    Center(child: Text("Content for Tab 1")),
                    // محتوى التبويب 2
                    Center(child: Text("Content for Tab 2")),
                    // محتوى التبويب 3
                    Center(child: Text("Content for Tab 3")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
