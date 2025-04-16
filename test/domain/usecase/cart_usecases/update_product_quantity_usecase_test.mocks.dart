// Mocks generated by Mockito 5.4.5 from annotations
// in flora_mart/test/domain/usecase/cart_usecases/update_product_quantity_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flora_mart/core/api/api_result.dart' as _i4;
import 'package:flora_mart/data/model/cart/cart_response.dart' as _i6;
import 'package:flora_mart/domain/repo_contract/cart_repo/cart_repo.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

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

/// A class which mocks [CartRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockCartRepo extends _i1.Mock implements _i2.CartRepo {
  MockCartRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.ApiResult<dynamic>> addToCart({
    required String? productId,
    required int? quantity,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#addToCart, [], {
              #productId: productId,
              #quantity: quantity,
            }),
            returnValue: _i3.Future<_i4.ApiResult<dynamic>>.value(
              _i5.dummyValue<_i4.ApiResult<dynamic>>(
                this,
                Invocation.method(#addToCart, [], {
                  #productId: productId,
                  #quantity: quantity,
                }),
              ),
            ),
          )
          as _i3.Future<_i4.ApiResult<dynamic>>);

  @override
  _i3.Future<_i4.ApiResult<_i6.CartResponse>> getCartItems() =>
      (super.noSuchMethod(
            Invocation.method(#getCartItems, []),
            returnValue: _i3.Future<_i4.ApiResult<_i6.CartResponse>>.value(
              _i5.dummyValue<_i4.ApiResult<_i6.CartResponse>>(
                this,
                Invocation.method(#getCartItems, []),
              ),
            ),
          )
          as _i3.Future<_i4.ApiResult<_i6.CartResponse>>);

  @override
  _i3.Future<_i4.ApiResult<_i6.CartResponse>> removeFromCart({
    required String? productId,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#removeFromCart, [], {#productId: productId}),
            returnValue: _i3.Future<_i4.ApiResult<_i6.CartResponse>>.value(
              _i5.dummyValue<_i4.ApiResult<_i6.CartResponse>>(
                this,
                Invocation.method(#removeFromCart, [], {#productId: productId}),
              ),
            ),
          )
          as _i3.Future<_i4.ApiResult<_i6.CartResponse>>);

  @override
  _i3.Future<_i4.ApiResult<_i6.CartResponse>> updateProductQuantity({
    required String? productId,
    required int? quantity,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#updateProductQuantity, [], {
              #productId: productId,
              #quantity: quantity,
            }),
            returnValue: _i3.Future<_i4.ApiResult<_i6.CartResponse>>.value(
              _i5.dummyValue<_i4.ApiResult<_i6.CartResponse>>(
                this,
                Invocation.method(#updateProductQuantity, [], {
                  #productId: productId,
                  #quantity: quantity,
                }),
              ),
            ),
          )
          as _i3.Future<_i4.ApiResult<_i6.CartResponse>>);
}
