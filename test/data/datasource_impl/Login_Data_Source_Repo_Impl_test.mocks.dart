// Mocks generated by Mockito 5.4.5 from annotations
// in flora_mart/test/data/datasource_impl/login_data_source_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:dio/dio.dart' as _i2;
import 'package:flora_mart/core/api/api_manager.dart' as _i4;
import 'package:flora_mart/core/cache/shared_pref.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0<T> extends _i1.SmartFake implements _i2.Response<T> {
  _FakeResponse_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeFuture_1<T1> extends _i1.SmartFake implements _i3.Future<T1> {
  _FakeFuture_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ApiManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiManager extends _i1.Mock implements _i4.ApiManager {
  MockApiManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.Response<dynamic>> getRequest({
    required String? endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getRequest, [], {
              #endpoint: endpoint,
              #queryParameters: queryParameters,
              #headers: headers,
            }),
            returnValue: _i3.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(#getRequest, [], {
                  #endpoint: endpoint,
                  #queryParameters: queryParameters,
                  #headers: headers,
                }),
              ),
            ),
          )
          as _i3.Future<_i2.Response<dynamic>>);

  @override
  _i3.Future<_i2.Response<dynamic>> postRequest({
    required String? endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#postRequest, [], {
              #endpoint: endpoint,
              #body: body,
              #headers: headers,
            }),
            returnValue: _i3.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(#postRequest, [], {
                  #endpoint: endpoint,
                  #body: body,
                  #headers: headers,
                }),
              ),
            ),
          )
          as _i3.Future<_i2.Response<dynamic>>);

  @override
  _i3.Future<_i2.Response<dynamic>> put({
    required String? endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#put, [], {
              #endpoint: endpoint,
              #queryParameters: queryParameters,
              #headers: headers,
              #data: data,
            }),
            returnValue: _i3.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(#put, [], {
                  #endpoint: endpoint,
                  #queryParameters: queryParameters,
                  #headers: headers,
                  #data: data,
                }),
              ),
            ),
          )
          as _i3.Future<_i2.Response<dynamic>>);

  @override
  _i3.Future<_i2.Response<dynamic>> delete({
    required String? endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#delete, [], {
              #endpoint: endpoint,
              #queryParameters: queryParameters,
              #headers: headers,
            }),
            returnValue: _i3.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(#delete, [], {
                  #endpoint: endpoint,
                  #queryParameters: queryParameters,
                  #headers: headers,
                }),
              ),
            ),
          )
          as _i3.Future<_i2.Response<dynamic>>);

  @override
  _i3.Future<_i2.Response<dynamic>> patchRequest({
    required String? endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#patchRequest, [], {
              #endpoint: endpoint,
              #body: body,
              #headers: headers,
            }),
            returnValue: _i3.Future<_i2.Response<dynamic>>.value(
              _FakeResponse_0<dynamic>(
                this,
                Invocation.method(#patchRequest, [], {
                  #endpoint: endpoint,
                  #body: body,
                  #headers: headers,
                }),
              ),
            ),
          )
          as _i3.Future<_i2.Response<dynamic>>);
}

/// A class which mocks [CacheHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockCacheHelper extends _i1.Mock implements _i5.CacheHelper {
  MockCacheHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> init() =>
      (super.noSuchMethod(
            Invocation.method(#init, []),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<bool> checkGuest() =>
      (super.noSuchMethod(
            Invocation.method(#checkGuest, []),
            returnValue: _i3.Future<bool>.value(false),
          )
          as _i3.Future<bool>);

  @override
  _i3.Future<bool> setData<T>(String? key, T? value) =>
      (super.noSuchMethod(
            Invocation.method(#setData, [key, value]),
            returnValue: _i3.Future<bool>.value(false),
          )
          as _i3.Future<bool>);

  @override
  _i3.Future<T> getData<T>(String? key) =>
      (super.noSuchMethod(
            Invocation.method(#getData, [key]),
            returnValue:
                _i6.ifNotNull(
                  _i6.dummyValueOrNull<T>(
                    this,
                    Invocation.method(#getData, [key]),
                  ),
                  (T v) => _i3.Future<T>.value(v),
                ) ??
                _FakeFuture_1<T>(this, Invocation.method(#getData, [key])),
          )
          as _i3.Future<T>);

  @override
  _i3.Future<bool> removeData(String? key) =>
      (super.noSuchMethod(
            Invocation.method(#removeData, [key]),
            returnValue: _i3.Future<bool>.value(false),
          )
          as _i3.Future<bool>);

  @override
  _i3.Future<bool> logout() =>
      (super.noSuchMethod(
            Invocation.method(#logout, []),
            returnValue: _i3.Future<bool>.value(false),
          )
          as _i3.Future<bool>);
}
