import 'Session.dart';

/// message : "success"
/// session : {"id":"cs_test_a1UEwHtVlzwDaSIlc959OMuZNY9Gt019adQG32qnsjbbSSgzRdTdBMxlty","object":"checkout.session","adaptive_pricing":{"enabled":true},"after_expiration":null,"allow_promotion_codes":null,"amount_subtotal":34500,"amount_total":34500,"automatic_tax":{"enabled":false,"liability":null,"provider":null,"status":null},"billing_address_collection":null,"cancel_url":"http://localhost:3000/cart","client_reference_id":"68039de7a9832d8359e4ff7b","client_secret":null,"collected_information":{"shipping_details":null},"consent":null,"consent_collection":null,"created":1745067579,"currency":"egp","currency_conversion":null,"custom_fields":[],"custom_text":{"after_submit":null,"shipping_address":null,"submit":null,"terms_of_service_acceptance":null},"customer":null,"customer_creation":"if_required","customer_details":{"address":null,"email":"ahmedmohamed.ar30@gmail.com","name":null,"phone":null,"tax_exempt":"none","tax_ids":null},"customer_email":"ahmedmohamed.ar30@gmail.com","discounts":[],"expires_at":1745153979,"invoice":null,"invoice_creation":{"enabled":false,"invoice_data":{"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}},"livemode":false,"locale":null,"metadata":{"city":"Cairo","lat":"String","long":"String","phone":"01010700999","street":"details"},"mode":"payment","payment_intent":null,"payment_link":null,"payment_method_collection":"if_required","payment_method_configuration_details":{"id":"pmc_1MphffE0S7VoKZmPNNp2G77I","parent":null},"payment_method_options":{"card":{"request_three_d_secure":"automatic"}},"payment_method_types":["card","link"],"payment_status":"unpaid","permissions":null,"phone_number_collection":{"enabled":false},"recovered_from":null,"saved_payment_method_options":null,"setup_intent":null,"shipping_address_collection":null,"shipping_cost":null,"shipping_details":null,"shipping_options":[],"status":"open","submit_type":null,"subscription":null,"success_url":"http://localhost:3000/allOrders","total_details":{"amount_discount":0,"amount_shipping":0,"amount_tax":0},"ui_mode":"hosted","url":"https://checkout.stripe.com/c/pay/cs_test_a1UEwHtVlzwDaSIlc959OMuZNY9Gt019adQG32qnsjbbSSgzRdTdBMxlty#fidkdWxOYHwnPyd1blpxYHZxWjA0SHViYl1ANVYyU2pOX2hVVW9ASmZBUElpa2FLVnBUQGo2UFduUEhIXHx9aEhjanBGZ1NxZ3RKNVVtXWxcSTJ8Qzx2aWZkUEBpMXJCXVRHTkIxZzBSZmhENTUxYHVKMUpQVycpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl","wallet_options":null}

class CreditCardPaymentResponse {
  CreditCardPaymentResponse({
      this.message, 
      this.session,});

  CreditCardPaymentResponse.fromJson(dynamic json) {
    message = json['message'];
    session = json['session'] != null ? Session.fromJson(json['session']) : null;
  }
  String? message;
  Session? session;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (session != null) {
      map['session'] = session?.toJson();
    }
    return map;
  }

}