// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix_clone/application/downloads/downloads_bloc.dart'
    as _i10;
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart'
    as _i11;
import 'package:netflix_clone/application/home/home_bloc.dart' as _i12;
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart'
    as _i13;
import 'package:netflix_clone/application/search/search_bloc.dart' as _i9;
import 'package:netflix_clone/domain/downloads/repositories/i_download_repo.dart'
    as _i3;
import 'package:netflix_clone/domain/new_and_hot/repositories/i_hot_and_new_repo.dart'
    as _i5;
import 'package:netflix_clone/domain/search/repositories/i_search_repo.dart'
    as _i7;
import 'package:netflix_clone/infrastructure/downloads/repositories/downloads_repository_impl.dart'
    as _i4;
import 'package:netflix_clone/infrastructure/hot_and_new/repositories/hot_and_new_repository_impl.dart'
    as _i6;
import 'package:netflix_clone/infrastructure/search/repositories/search_repository_impl.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IDownloadsRepo>(() => _i4.DownloadsRepositoryImpl());
    gh.lazySingleton<_i5.IHotAndNewRepository>(
        () => _i6.HotAndNewRepositoryImpl());
    gh.lazySingleton<_i7.ISearchRepo>(() => _i8.SearchRepositoryImpl());
    gh.factory<_i9.SearchBloc>(() => _i9.SearchBloc(
          gh<_i3.IDownloadsRepo>(),
          gh<_i7.ISearchRepo>(),
        ));
    gh.factory<_i10.DownloadsBloc>(
        () => _i10.DownloadsBloc(gh<_i3.IDownloadsRepo>()));
    gh.factory<_i11.FastLaughBloc>(
        () => _i11.FastLaughBloc(gh<_i3.IDownloadsRepo>()));
    gh.factory<_i12.HomeBloc>(
        () => _i12.HomeBloc(gh<_i5.IHotAndNewRepository>()));
    gh.factory<_i13.HotAndNewBloc>(
        () => _i13.HotAndNewBloc(gh<_i5.IHotAndNewRepository>()));
    return this;
  }
}
