// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../data/datasource_contract/auth_datasource.dart' as _i214;
import '../../data/datasource_contract/best_seller_datasource.dart' as _i575;
import '../../data/datasource_contract/cart_datasource/cart_datasource.dart'
    as _i770;
import '../../data/datasource_contract/categories_datasource.dart' as _i546;
import '../../data/datasource_contract/forget_password_datasource/forget_password_datasource.dart'
    as _i206;
import '../../data/datasource_contract/forget_password_datasource/reset_password_datasource.dart'
    as _i99;
import '../../data/datasource_contract/forget_password_datasource/verify_reset_code_datasource.dart'
    as _i574;
import '../../data/datasource_contract/get_all_products_datasource.dart'
    as _i466;
import '../../data/datasource_contract/guest_datasource.dart' as _i623;
import '../../data/datasource_contract/Home_Data_Source_Repo.dart' as _i755;
import '../../data/datasource_contract/Login_Data_Source_Repo.dart' as _i557;
import '../../data/datasource_contract/logout_datasource.dart' as _i375;
import '../../data/datasource_contract/occasion_datasource/occasions_datasource.dart'
    as _i331;
import '../../data/datasource_contract/profile_datasource.dart' as _i392;
import '../../data/datasource_impl/auth_datasource_impl.dart' as _i422;
import '../../data/datasource_impl/best_seller_datasource_impl.dart' as _i378;
import '../../data/datasource_impl/cart_datasource_impl/cart_datasource_impl.dart'
    as _i274;
import '../../data/datasource_impl/categories_datasource_impl.dart' as _i71;
import '../../data/datasource_impl/forget_password_datasource_impl/forget_password_datasource_impl.dart'
    as _i319;
import '../../data/datasource_impl/forget_password_datasource_impl/reset_password_datasource_impl.dart'
    as _i486;
import '../../data/datasource_impl/forget_password_datasource_impl/verify_reset_code_datasource_impl.dart'
    as _i353;
import '../../data/datasource_impl/get_all_products_datasource_impl.dart'
    as _i97;
import '../../data/datasource_impl/guest_datasource_impl.dart' as _i48;
import '../../data/datasource_impl/Home_Data_Source_Repo_Impl.dart' as _i437;
import '../../data/datasource_impl/Login_Data_Source_Repo_Impl.dart' as _i878;
import '../../data/datasource_impl/logout_datasource_impl.dart' as _i1011;
import '../../data/datasource_impl/occasions_datasource_impl/occassions_datasource_impl.dart'
    as _i626;
import '../../data/datasource_impl/profile_datasource_impl.dart' as _i807;
import '../../data/repo_impl/auth_repo_impl.dart' as _i540;
import '../../data/repo_impl/best_seller_repo_impl.dart' as _i133;
import '../../data/repo_impl/cart_repo_impl/cart_repo_impl.dart' as _i826;
import '../../data/repo_impl/categories_repo_impl.dart' as _i807;
import '../../data/repo_impl/forget_password_repo_impl/forget_password_repo_impl.dart'
    as _i210;
import '../../data/repo_impl/forget_password_repo_impl/reset_password_repo_impl.dart'
    as _i289;
import '../../data/repo_impl/forget_password_repo_impl/verify_reset_code_repo_impl.dart'
    as _i721;
import '../../data/repo_impl/get_all_products_repo_impl.dart' as _i883;
import '../../data/repo_impl/guest_repo_impl.dart' as _i905;
import '../../data/repo_impl/Home_Repo_Impl.dart' as _i420;
import '../../data/repo_impl/Login_Repo_Impl.dart' as _i722;
import '../../data/repo_impl/logout_repo_impl.dart' as _i88;
import '../../data/repo_impl/occasions_repo_impl.dart' as _i750;
import '../../data/repo_impl/profile_repo_impl.dart' as _i549;
import '../../domain/repo_contract/auth_repo.dart' as _i233;
import '../../domain/repo_contract/best_seller_repo.dart' as _i64;
import '../../domain/repo_contract/cart_repo/cart_repo.dart' as _i64;
import '../../domain/repo_contract/categories_repo.dart' as _i41;
import '../../domain/repo_contract/forget_password_repo_contract/forget_password_repo.dart'
    as _i976;
import '../../domain/repo_contract/forget_password_repo_contract/reset_password_repo.dart'
    as _i161;
import '../../domain/repo_contract/forget_password_repo_contract/verify_reset_code_repo.dart'
    as _i544;
import '../../domain/repo_contract/get_all_products_repo.dart' as _i697;
import '../../domain/repo_contract/guest_repo.dart' as _i234;
import '../../domain/repo_contract/Home_Repo.dart' as _i820;
import '../../domain/repo_contract/Login_Repo.dart' as _i831;
import '../../domain/repo_contract/logout_repo_contract.dart' as _i656;
import '../../domain/repo_contract/occasions_repo.dart' as _i130;
import '../../domain/repo_contract/profile_repo.dart' as _i772;
import '../../domain/usecase/cart_usecases/add_to_cart_usecase.dart' as _i971;
import '../../domain/usecase/cart_usecases/get_cart_items_usecase.dart'
    as _i271;
import '../../domain/usecase/cart_usecases/remove_from_cart_usecase.dart'
    as _i1045;
import '../../domain/usecase/cart_usecases/update_product_quantity_usecase.dart'
    as _i249;
import '../../domain/usecase/categories_usecase.dart' as _i1036;
import '../../domain/usecase/changeGuest_usecase.dart' as _i285;
import '../../domain/usecase/check_guest_usecase.dart' as _i304;
import '../../domain/usecase/forget_password_usecases/forget_password_usecase.dart'
    as _i418;
import '../../domain/usecase/forget_password_usecases/reset_password_usecase.dart'
    as _i383;
import '../../domain/usecase/forget_password_usecases/verify_reset_code_usecase.dart'
    as _i323;
import '../../domain/usecase/get_all_products_usecase.dart' as _i784;
import '../../domain/usecase/get_best_sellers_usecase.dart' as _i814;
import '../../domain/usecase/get_profile_details_usecase.dart' as _i920;
import '../../domain/usecase/home_Usecase.dart' as _i1069;
import '../../domain/usecase/login_Usecase.dart' as _i181;
import '../../domain/usecase/logout_usecase.dart' as _i140;
import '../../domain/usecase/occasions_usecase.dart' as _i896;
import '../../domain/usecase/register_usecase.dart' as _i626;
import '../../presentation/auth/view_model/cubit/auth_cubit.dart' as _i351;
import '../../presentation/best_seller/view_model/cubit/best_seller_cubit.dart'
    as _i165;
import '../../presentation/tabs/cart_tab/view_model/cubit/cart_cubit.dart'
    as _i1071;
import '../../presentation/tabs/categories_tab/view_model/categories_cubit.dart'
    as _i196;
import '../../presentation/tabs/categories_tab/view_model/product_cubit.dart'
    as _i931;
import '../../presentation/tabs/home_tab/view_model/cubit/home_cubit.dart'
    as _i979;
import '../../presentation/tabs/home_tab/widgets/occasions/view_model/occasions_cubit.dart'
    as _i790;
import '../../presentation/tabs/profile_tab/view_model/main_profile_cubit.dart'
    as _i238;
import '../api/api_manager.dart' as _i1047;
import '../cache/shared_pref.dart' as _i299;
import '../logger/logger_module.dart' as _i279;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerModule = _$LoggerModule();
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.singleton<_i299.CacheHelper>(() => _i299.CacheHelper());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.factory<_i99.ResetpasswordDataSourceRepo>(() =>
        _i486.Resetpassworddatasourcerepoimpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i574.VerifyresetcodeRepoDataSource>(() =>
        _i353.Verifyresetcoderepodatasourceimpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i623.GuestDatasource>(
        () => _i48.GuestDatasourceImpl(gh<_i299.CacheHelper>()));
    gh.factory<_i206.ForgetpasswordDataSourseRepo>(() =>
        _i319.ForgetpasswordDataSourceRepoImpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i214.AuthDatasource>(
        () => _i422.AuthDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i375.LogoutDatasource>(() => _i1011.LogoutDatasourceImpl(
          apiManager: gh<_i1047.ApiManager>(),
          cacheHelper: gh<_i299.CacheHelper>(),
        ));
    gh.factory<_i755.HomeDataSourceRepo>(
        () => _i437.HomeDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i575.BestSellerDataSource>(
        () => _i378.BestSellerDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i392.ProfileDatasource>(() => _i807.ProfileDatasourceImpl(
          gh<_i1047.ApiManager>(),
          gh<_i299.CacheHelper>(),
        ));
    gh.factory<_i820.HomeRepo>(
        () => _i420.homeRepoImpl(gh<_i755.HomeDataSourceRepo>()));
    gh.factory<_i331.OccassionsDataSource>(
        () => _i626.OccasionsDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i233.AuthRepo>(
        () => _i540.AuthRepoImpl(gh<_i214.AuthDatasource>()));
    gh.factory<_i770.CartDatasource>(() => _i274.CartDatasourceImpl(
          apiManager: gh<_i1047.ApiManager>(),
          cacheHelper: gh<_i299.CacheHelper>(),
        ));
    gh.factory<_i557.LoginDataSourceRepo>(() => _i878.LoginDatasourceImpl(
          gh<_i1047.ApiManager>(),
          gh<_i299.CacheHelper>(),
        ));
    gh.factory<_i466.GetAllProductsDatasource>(
        () => _i97.GetAllProductsDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i1069.HomeUsecase>(
        () => _i1069.HomeUsecase(homeRepo: gh<_i820.HomeRepo>()));
    gh.factory<_i234.GuestRepo>(
        () => _i905.GuestRepoImpl(gh<_i623.GuestDatasource>()));
    gh.factory<_i544.VerifyresetcodeRepo>(() => _i721.Verifyresetcoderepoimpl(
        gh<_i574.VerifyresetcodeRepoDataSource>()));
    gh.factory<_i697.GetAllProductsRepo>(() =>
        _i883.GetAllProductsRepoImpl(gh<_i466.GetAllProductsDatasource>()));
    gh.factory<_i546.CategoriesDatasource>(
        () => _i71.CategoriesDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i656.LogoutRepoContract>(() =>
        _i88.LogoutRepoImpl(logoutDatasource: gh<_i375.LogoutDatasource>()));
    gh.factory<_i161.ResetpasswordRepo>(() =>
        _i289.Resetpasswordrepoimpl(gh<_i99.ResetpasswordDataSourceRepo>()));
    gh.factory<_i784.GetAllProductsUsecase>(
        () => _i784.GetAllProductsUsecase(gh<_i697.GetAllProductsRepo>()));
    gh.factory<_i41.CategoriesRepo>(
        () => _i807.CategoriesRepoImpl(gh<_i546.CategoriesDatasource>()));
    gh.factory<_i130.OccasionsRepo>(
        () => _i750.OcassionsRepoImpl(gh<_i331.OccassionsDataSource>()));
    gh.factory<_i772.ProfileRepo>(
        () => _i549.ProfileRepoImpl(gh<_i392.ProfileDatasource>()));
    gh.factory<_i976.ForgetpasswordRepo>(() => _i210.Forgetpasswordrepoimpl(
        forgetpassword_data_sourse_repo:
            gh<_i206.ForgetpasswordDataSourseRepo>()));
    gh.factory<_i64.BestSellerRepo>(
        () => _i133.BestSellerRepoImpl(gh<_i575.BestSellerDataSource>()));
    gh.factory<_i896.OccassionsUsecase>(
        () => _i896.OccassionsUsecase(gh<_i130.OccasionsRepo>()));
    gh.factory<_i831.LoginRepo>(
        () => _i722.SigninRepoImpl(gh<_i557.LoginDataSourceRepo>()));
    gh.factory<_i979.HomeCubit>(
        () => _i979.HomeCubit(gh<_i1069.HomeUsecase>()));
    gh.factory<_i285.ChangeguestUsecase>(
        () => _i285.ChangeguestUsecase(gh<_i234.GuestRepo>()));
    gh.factory<_i304.CheckGuestUseCase>(
        () => _i304.CheckGuestUseCase(gh<_i234.GuestRepo>()));
    gh.factory<_i64.CartRepo>(
        () => _i826.CartRepoImpl(gh<_i770.CartDatasource>()));
    gh.factory<_i181.LoginUsecase>(
        () => _i181.LoginUsecase(loginRepo: gh<_i831.LoginRepo>()));
    gh.factory<_i626.RegisterUsecase>(
        () => _i626.RegisterUsecase(gh<_i233.AuthRepo>()));
    gh.factory<_i323.VerifyresetcodeUseCase>(() =>
        _i323.VerifyresetcodeUseCase(repo: gh<_i544.VerifyresetcodeRepo>()));
    gh.factory<_i931.ProductCubit>(() => _i931.ProductCubit(
        getAllProductsUsecase: gh<_i784.GetAllProductsUsecase>()));
    gh.factory<_i418.ForgetPasswordUseCase>(() => _i418.ForgetPasswordUseCase(
        forgetPassword: gh<_i976.ForgetpasswordRepo>()));
    gh.factory<_i140.LogoutUsecase>(() => _i140.LogoutUsecase(
        logoutRepoContract: gh<_i656.LogoutRepoContract>()));
    gh.factory<_i1036.CategoriesUsecase>(
        () => _i1036.CategoriesUsecase(gh<_i41.CategoriesRepo>()));
    gh.factory<_i383.ResetpasswordUsecase>(
        () => _i383.ResetpasswordUsecase(repo: gh<_i161.ResetpasswordRepo>()));
    gh.factory<_i920.GetProfileDetailsUsecase>(
        () => _i920.GetProfileDetailsUsecase(gh<_i772.ProfileRepo>()));
    gh.factory<_i790.OccasionsCubit>(() => _i790.OccasionsCubit(
          gh<_i896.OccassionsUsecase>(),
          gh<_i784.GetAllProductsUsecase>(),
        ));
    gh.factory<_i814.GetBestSellersUseCase>(
        () => _i814.GetBestSellersUseCase(gh<_i64.BestSellerRepo>()));
    gh.factory<_i971.AddToCartUsecase>(
        () => _i971.AddToCartUsecase(gh<_i64.CartRepo>()));
    gh.factory<_i271.GetCartItemsUsecase>(
        () => _i271.GetCartItemsUsecase(gh<_i64.CartRepo>()));
    gh.factory<_i1045.RemoveFromCartUsecase>(
        () => _i1045.RemoveFromCartUsecase(gh<_i64.CartRepo>()));
    gh.factory<_i249.UpdateProductQuantityUsecase>(
        () => _i249.UpdateProductQuantityUsecase(gh<_i64.CartRepo>()));
    gh.factory<_i196.CategoriesCubit>(
        () => _i196.CategoriesCubit(gh<_i1036.CategoriesUsecase>()));
    gh.factory<_i351.AuthCubit>(() => _i351.AuthCubit(
          gh<_i323.VerifyresetcodeUseCase>(),
          gh<_i383.ResetpasswordUsecase>(),
          gh<_i418.ForgetPasswordUseCase>(),
          gh<_i304.CheckGuestUseCase>(),
          gh<_i285.ChangeguestUsecase>(),
          gh<_i626.RegisterUsecase>(),
          gh<_i181.LoginUsecase>(),
          gh<_i140.LogoutUsecase>(),
        ));
    gh.factory<_i165.BestSellerCubit>(
        () => _i165.BestSellerCubit(gh<_i814.GetBestSellersUseCase>()));
    gh.factory<_i238.MainProfileCubit>(
        () => _i238.MainProfileCubit(gh<_i920.GetProfileDetailsUsecase>()));
    gh.factory<_i1071.CartCubit>(() => _i1071.CartCubit(
          gh<_i971.AddToCartUsecase>(),
          gh<_i271.GetCartItemsUsecase>(),
          gh<_i974.Logger>(),
          gh<_i1045.RemoveFromCartUsecase>(),
          gh<_i249.UpdateProductQuantityUsecase>(),
        ));
    return this;
  }
}

class _$LoggerModule extends _i279.LoggerModule {}
