import 'AdaptivePricing.dart';
import 'AutomaticTax.dart';
import 'CollectedInformation.dart';
import 'CustomText.dart';
import 'CustomerDetails.dart';
import 'InvoiceCreation.dart';
import 'Metadata.dart';
import 'PaymentMethodConfigurationDetails.dart';
import 'PaymentMethodOptions.dart';
import 'PhoneNumberCollection.dart';
import 'TotalDetails.dart';

/// id : "cs_test_a1UEwHtVlzwDaSIlc959OMuZNY9Gt019adQG32qnsjbbSSgzRdTdBMxlty"
/// object : "checkout.session"
/// adaptive_pricing : {"enabled":true}
/// after_expiration : null
/// allow_promotion_codes : null
/// amount_subtotal : 34500
/// amount_total : 34500
/// automatic_tax : {"enabled":false,"liability":null,"provider":null,"status":null}
/// billing_address_collection : null
/// cancel_url : "http://localhost:3000/cart"
/// client_reference_id : "68039de7a9832d8359e4ff7b"
/// client_secret : null
/// collected_information : {"shipping_details":null}
/// consent : null
/// consent_collection : null
/// created : 1745067579
/// currency : "egp"
/// currency_conversion : null
/// custom_fields : []
/// custom_text : {"after_submit":null,"shipping_address":null,"submit":null,"terms_of_service_acceptance":null}
/// customer : null
/// customer_creation : "if_required"
/// customer_details : {"address":null,"email":"ahmedmohamed.ar30@gmail.com","name":null,"phone":null,"tax_exempt":"none","tax_ids":null}
/// customer_email : "ahmedmohamed.ar30@gmail.com"
/// discounts : []
/// expires_at : 1745153979
/// invoice : null
/// invoice_creation : {"enabled":false,"invoice_data":{"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}}
/// livemode : false
/// locale : null
/// metadata : {"city":"Cairo","lat":"String","long":"String","phone":"01010700999","street":"details"}
/// mode : "payment"
/// payment_intent : null
/// payment_link : null
/// payment_method_collection : "if_required"
/// payment_method_configuration_details : {"id":"pmc_1MphffE0S7VoKZmPNNp2G77I","parent":null}
/// payment_method_options : {"card":{"request_three_d_secure":"automatic"}}
/// payment_method_types : ["card","link"]
/// payment_status : "unpaid"
/// permissions : null
/// phone_number_collection : {"enabled":false}
/// recovered_from : null
/// saved_payment_method_options : null
/// setup_intent : null
/// shipping_address_collection : null
/// shipping_cost : null
/// shipping_details : null
/// shipping_options : []
/// status : "open"
/// submit_type : null
/// subscription : null
/// success_url : "http://localhost:3000/allOrders"
/// total_details : {"amount_discount":0,"amount_shipping":0,"amount_tax":0}
/// ui_mode : "hosted"
/// url : "https://checkout.stripe.com/c/pay/cs_test_a1UEwHtVlzwDaSIlc959OMuZNY9Gt019adQG32qnsjbbSSgzRdTdBMxlty#fidkdWxOYHwnPyd1blpxYHZxWjA0SHViYl1ANVYyU2pOX2hVVW9ASmZBUElpa2FLVnBUQGo2UFduUEhIXHx9aEhjanBGZ1NxZ3RKNVVtXWxcSTJ8Qzx2aWZkUEBpMXJCXVRHTkIxZzBSZmhENTUxYHVKMUpQVycpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl"
/// wallet_options : null

class Session {
  Session({
    this.id,
    this.object,
    this.adaptivePricing,
    this.afterExpiration,
    this.allowPromotionCodes,
    this.amountSubtotal,
    this.amountTotal,
    this.automaticTax,
    this.billingAddressCollection,
    this.cancelUrl,
    this.clientReferenceId,
    this.clientSecret,
    this.collectedInformation,
    this.consent,
    this.consentCollection,
    this.created,
    this.currency,
    this.currencyConversion,
    this.customFields,
    this.customText,
    this.customer,
    this.customerCreation,
    this.customerDetails,
    this.customerEmail,
    this.discounts,
    this.expiresAt,
    this.invoice,
    this.invoiceCreation,
    this.livemode,
    this.locale,
    this.metadata,
    this.mode,
    this.paymentIntent,
    this.paymentLink,
    this.paymentMethodCollection,
    this.paymentMethodConfigurationDetails,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.paymentStatus,
    this.permissions,
    this.phoneNumberCollection,
    this.recoveredFrom,
    this.savedPaymentMethodOptions,
    this.setupIntent,
    this.shippingAddressCollection,
    this.shippingCost,
    this.shippingDetails,
    this.shippingOptions,
    this.status,
    this.submitType,
    this.subscription,
    this.successUrl,
    this.totalDetails,
    this.uiMode,
    this.url,
    this.walletOptions,
  });

  Session.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    adaptivePricing = json['adaptive_pricing'] != null
        ? AdaptivePricing.fromJson(json['adaptive_pricing'])
        : null;
    afterExpiration = json['after_expiration'];
    allowPromotionCodes = json['allow_promotion_codes'];
    amountSubtotal = json['amount_subtotal'];
    amountTotal = json['amount_total'];
    automaticTax = json['automatic_tax'] != null
        ? AutomaticTax.fromJson(json['automatic_tax'])
        : null;
    billingAddressCollection = json['billing_address_collection'];
    cancelUrl = json['cancel_url'];
    clientReferenceId = json['client_reference_id'];
    clientSecret = json['client_secret'];
    collectedInformation = json['collected_information'] != null
        ? CollectedInformation.fromJson(json['collected_information'])
        : null;
    consent = json['consent'];
    consentCollection = json['consent_collection'];
    created = json['created'];
    currency = json['currency'];
    currencyConversion = json['currency_conversion'];
    if (json['custom_fields'] != null) {
      customFields = [];
      json['custom_fields'].forEach((v) {
        customFields ?? "";
      });
    }
    customText = json['custom_text'] != null
        ? CustomText.fromJson(json['custom_text'])
        : null;
    customer = json['customer'];
    customerCreation = json['customer_creation'];
    customerDetails = json['customer_details'] != null
        ? CustomerDetails.fromJson(json['customer_details'])
        : null;
    customerEmail = json['customer_email'];
    if (json['discounts'] != null) {
      discounts = [];
      json['discounts'].forEach((v) {
        discounts;
      });
    }
    expiresAt = json['expires_at'];
    invoice = json['invoice'];
    invoiceCreation = json['invoice_creation'] != null
        ? InvoiceCreation.fromJson(json['invoice_creation'])
        : null;
    livemode = json['livemode'];
    locale = json['locale'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    mode = json['mode'];
    paymentIntent = json['payment_intent'];
    paymentLink = json['payment_link'];
    paymentMethodCollection = json['payment_method_collection'];
    paymentMethodConfigurationDetails =
        json['payment_method_configuration_details'] != null
            ? PaymentMethodConfigurationDetails.fromJson(
                json['payment_method_configuration_details'])
            : null;
    paymentMethodOptions = json['payment_method_options'] != null
        ? PaymentMethodOptions.fromJson(json['payment_method_options'])
        : null;
    paymentMethodTypes = json['payment_method_types'] != null
        ? json['payment_method_types'].cast<String>()
        : [];
    paymentStatus = json['payment_status'];
    permissions = json['permissions'];
    phoneNumberCollection = json['phone_number_collection'] != null
        ? PhoneNumberCollection.fromJson(json['phone_number_collection'])
        : null;
    recoveredFrom = json['recovered_from'];
    savedPaymentMethodOptions = json['saved_payment_method_options'];
    setupIntent = json['setup_intent'];
    shippingAddressCollection = json['shipping_address_collection'];
    shippingCost = json['shipping_cost'];
    shippingDetails = json['shipping_details'];
    if (json['shipping_options'] != null) {
      shippingOptions = [];
      json['shipping_options'].forEach((v) {
        shippingOptions ?? "";
      });
    }
    status = json['status'];
    submitType = json['submit_type'];
    subscription = json['subscription'];
    successUrl = json['success_url'];
    totalDetails = json['total_details'] != null
        ? TotalDetails.fromJson(json['total_details'])
        : null;
    uiMode = json['ui_mode'];
    url = json['url'];
    walletOptions = json['wallet_options'];
  }
  String? id;
  String? object;
  AdaptivePricing? adaptivePricing;
  dynamic afterExpiration;
  dynamic allowPromotionCodes;
  num? amountSubtotal;
  num? amountTotal;
  AutomaticTax? automaticTax;
  dynamic billingAddressCollection;
  String? cancelUrl;
  String? clientReferenceId;
  dynamic clientSecret;
  CollectedInformation? collectedInformation;
  dynamic consent;
  dynamic consentCollection;
  num? created;
  String? currency;
  dynamic currencyConversion;
  List<dynamic>? customFields;
  CustomText? customText;
  dynamic customer;
  String? customerCreation;
  CustomerDetails? customerDetails;
  String? customerEmail;
  List<dynamic>? discounts;
  num? expiresAt;
  dynamic invoice;
  InvoiceCreation? invoiceCreation;
  bool? livemode;
  dynamic locale;
  Metadata? metadata;
  String? mode;
  dynamic paymentIntent;
  dynamic paymentLink;
  String? paymentMethodCollection;
  PaymentMethodConfigurationDetails? paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  String? paymentStatus;
  dynamic permissions;
  PhoneNumberCollection? phoneNumberCollection;
  dynamic recoveredFrom;
  dynamic savedPaymentMethodOptions;
  dynamic setupIntent;
  dynamic shippingAddressCollection;
  dynamic shippingCost;
  dynamic shippingDetails;
  List<dynamic>? shippingOptions;
  String? status;
  dynamic submitType;
  dynamic subscription;
  String? successUrl;
  TotalDetails? totalDetails;
  String? uiMode;
  String? url;
  dynamic walletOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    if (adaptivePricing != null) {
      map['adaptive_pricing'] = adaptivePricing?.toJson();
    }
    map['after_expiration'] = afterExpiration;
    map['allow_promotion_codes'] = allowPromotionCodes;
    map['amount_subtotal'] = amountSubtotal;
    map['amount_total'] = amountTotal;
    if (automaticTax != null) {
      map['automatic_tax'] = automaticTax?.toJson();
    }
    map['billing_address_collection'] = billingAddressCollection;
    map['cancel_url'] = cancelUrl;
    map['client_reference_id'] = clientReferenceId;
    map['client_secret'] = clientSecret;
    if (collectedInformation != null) {
      map['collected_information'] = collectedInformation?.toJson();
    }
    map['consent'] = consent;
    map['consent_collection'] = consentCollection;
    map['created'] = created;
    map['currency'] = currency;
    map['currency_conversion'] = currencyConversion;
    if (customFields != null) {
      map['custom_fields'] = customFields?.map((v) => v.toJson()).toList();
    }
    if (customText != null) {
      map['custom_text'] = customText?.toJson();
    }
    map['customer'] = customer;
    map['customer_creation'] = customerCreation;
    if (customerDetails != null) {
      map['customer_details'] = customerDetails?.toJson();
    }
    map['customer_email'] = customerEmail;
    if (discounts != null) {
      map['discounts'] = discounts?.map((v) => v.toJson()).toList();
    }
    map['expires_at'] = expiresAt;
    map['invoice'] = invoice;
    if (invoiceCreation != null) {
      map['invoice_creation'] = invoiceCreation?.toJson();
    }
    map['livemode'] = livemode;
    map['locale'] = locale;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    map['mode'] = mode;
    map['payment_intent'] = paymentIntent;
    map['payment_link'] = paymentLink;
    map['payment_method_collection'] = paymentMethodCollection;
    if (paymentMethodConfigurationDetails != null) {
      map['payment_method_configuration_details'] =
          paymentMethodConfigurationDetails?.toJson();
    }
    if (paymentMethodOptions != null) {
      map['payment_method_options'] = paymentMethodOptions?.toJson();
    }
    map['payment_method_types'] = paymentMethodTypes;
    map['payment_status'] = paymentStatus;
    map['permissions'] = permissions;
    if (phoneNumberCollection != null) {
      map['phone_number_collection'] = phoneNumberCollection?.toJson();
    }
    map['recovered_from'] = recoveredFrom;
    map['saved_payment_method_options'] = savedPaymentMethodOptions;
    map['setup_intent'] = setupIntent;
    map['shipping_address_collection'] = shippingAddressCollection;
    map['shipping_cost'] = shippingCost;
    map['shipping_details'] = shippingDetails;
    if (shippingOptions != null) {
      map['shipping_options'] =
          shippingOptions?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['submit_type'] = submitType;
    map['subscription'] = subscription;
    map['success_url'] = successUrl;
    if (totalDetails != null) {
      map['total_details'] = totalDetails?.toJson();
    }
    map['ui_mode'] = uiMode;
    map['url'] = url;
    map['wallet_options'] = walletOptions;
    return map;
  }
}
