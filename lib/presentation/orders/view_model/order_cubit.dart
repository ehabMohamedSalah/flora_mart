import 'package:bloc/bloc.dart';
import 'package:flora_mart/data/model/order_response/OrderResponse.dart';
import 'package:flora_mart/domain/usecase/order_usecase.dart';
import 'package:flora_mart/presentation/orders/view_model/order_intent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../core/api/api_result.dart';

part 'order_state.dart';

@injectable
class OrderCubit extends Cubit<OrderState> {
  static OrderCubit get(context) => BlocProvider.of(context);

  OrderUsecase orderUsecase;
  OrderCubit(this.orderUsecase) : super(OrderInitial());

  void doIntent(OrderIntent orderIntent) {
    switch (orderIntent) {
      case GetOrderIntent():
        _getOrder(intent: orderIntent);
        break;
    }
  }

  void _getOrder({required GetOrderIntent intent}) async{
    emit(OrderLoadingState());
    var result=await orderUsecase.call();

    switch (result) {
      case SuccessApiResult<OrderResponse>():
        print("success");
        emit(OrderSuccessState(result.data!));
      case ErrorApiResult<OrderResponse>():
        print("error");
        print(result.exception.toString());
        emit(OrderErrorState(result.exception.toString()));
    }

  }

}
