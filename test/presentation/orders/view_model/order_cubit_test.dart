

import 'package:bloc_test/bloc_test.dart';
import 'package:flora_mart/core/api/api_result.dart';
import 'package:flora_mart/data/model/order_response/Metadata.dart';
import 'package:flora_mart/data/model/order_response/OrderResponse.dart';
import 'package:flora_mart/data/model/order_response/Orders.dart';
import 'package:flora_mart/domain/usecase/order_usecase.dart';
import 'package:flora_mart/presentation/orders/view_model/order_cubit.dart';
import 'package:flora_mart/presentation/orders/view_model/order_intent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'order_cubit_test.mocks.dart';
@GenerateMocks([OrderUsecase])
void main() {
  late OrderCubit orderCubit;
  late MockOrderUsecase mockOrderUsecase;

  setUp(() {
    mockOrderUsecase = MockOrderUsecase();
    orderCubit = OrderCubit(mockOrderUsecase);
  });

  // Provide a dummy value for ApiResult<OrderResponse>
  provideDummy<ApiResult<OrderResponse>>(SuccessApiResult<OrderResponse>(OrderResponse(
    orders: [
      Orders(id: "order_1", user: "user_1")
    ],
    metadata: Metadata(
      currentPage: 1,
      totalItems: 1,
      totalPages: 1,
      limit: 20,
    ),
  )));

  final dummyOrderResponse = OrderResponse(
    orders: [
      Orders(id: "order_1", user: "user_1")
    ],
    metadata: Metadata(
      currentPage: 1,
      totalItems: 1,
      totalPages: 1,
      limit: 20,
    ),
  );

  blocTest<OrderCubit, OrderState>(
    'emits [OrderLoadingState, OrderSuccessState] when GetOrderIntent is called and succeeds',
    build: () {
      when(mockOrderUsecase.call()).thenAnswer(
            (_) async => SuccessApiResult<OrderResponse>(dummyOrderResponse),
      );
      return orderCubit;
    },
    act: (cubit) => cubit.doIntent(GetOrderIntent()),
    expect: () => [
      isA<OrderLoadingState>(),
      isA<OrderSuccessState>(),
    ],
  );

  blocTest<OrderCubit, OrderState>(
    'emits [OrderLoadingState, OrderErrorState] when GetOrderIntent fails',
    build: () {
      when(mockOrderUsecase.call()).thenAnswer(
            (_) async => ErrorApiResult<OrderResponse>(Exception("Failed")),
      );
      return orderCubit;
    },
    act: (cubit) => cubit.doIntent(GetOrderIntent()),
    expect: () => [
      isA<OrderLoadingState>(),
      isA<OrderErrorState>(),
    ],
  );
}