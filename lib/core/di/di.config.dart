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

import '../../data/datasource_contract/auth_datasource.dart' as _i214;
import '../../data/datasource_contract/guest_datasource.dart' as _i623;
import '../../data/datasource_impl/auth_datasource_impl.dart' as _i422;
import '../../data/datasource_impl/guest_datasource_impl.dart' as _i48;
import '../../data/repo_impl/auth_repo_impl.dart' as _i540;
import '../../data/repo_impl/guest_repo_impl.dart' as _i905;
import '../../domain/repo_contract/auth_repo.dart' as _i233;
import '../../domain/repo_contract/guest_repo.dart' as _i234;
import '../../domain/usecase/changeGuest_usecase.dart' as _i285;
import '../../domain/usecase/check_guest_usecase.dart' as _i304;
import '../../domain/usecase/register_usecase.dart' as _i626;
import '../../presentation/auth/view_model/cubit/auth_cubit.dart' as _i351;
import '../api/api_manager.dart' as _i1047;
import '../cache/shared_pref.dart' as _i299;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.singleton<_i299.CacheHelper>(() => _i299.CacheHelper());
    gh.factory<_i623.GuestDatasource>(
        () => _i48.GuestDatasourceImpl(gh<_i299.CacheHelper>()));
    gh.factory<_i214.AuthDatasource>(
        () => _i422.AuthDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i233.AuthRepo>(
        () => _i540.AuthRepoImpl(gh<_i214.AuthDatasource>()));
    gh.factory<_i234.GuestRepo>(
        () => _i905.GuestRepoImpl(gh<_i623.GuestDatasource>()));
    gh.factory<_i285.ChangeguestUsecase>(
        () => _i285.ChangeguestUsecase(gh<_i234.GuestRepo>()));
    gh.factory<_i304.CheckGuestUseCase>(
        () => _i304.CheckGuestUseCase(gh<_i234.GuestRepo>()));
    gh.factory<_i626.RegisterUsecase>(
        () => _i626.RegisterUsecase(gh<_i233.AuthRepo>()));
    gh.factory<_i351.AuthCubit>(() => _i351.AuthCubit(
          gh<_i304.CheckGuestUseCase>(),
          gh<_i285.ChangeguestUsecase>(),
          gh<_i626.RegisterUsecase>(),
        ));

    return this;
  }
}
