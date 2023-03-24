// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$LoginService extends LoginService {
  _$LoginService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LoginService;

  @override
  Future<Response<LoginResponse>> login({required Map<String, dynamic> body}) {
    final Uri $url = Uri.parse('/api/members/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<UnitBoughtModel>> getUnit() {
    final Uri $url = Uri.parse('/api/members/unit');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UnitBoughtModel, UnitBoughtModel>($request);
  }

  @override
  Future<Response<BankAccountModel>> getBankAccount() {
    final Uri $url = Uri.parse('/api/members/bankaccount');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BankAccountModel, BankAccountModel>($request);
  }

  @override
  Future<Response<BuyModel>> uploadPhoto(
    double unit,
    int payment,
    String? ref,
    Multipart? imagePath,
    double amount,
  ) {
    final Uri $url = Uri.parse('/api/members/buy');
    final List<PartValue> $parts = <PartValue>[
      PartValue<double>(
        'units',
        unit,
      ),
      PartValue<int>(
        'payment_mode',
        payment,
      ),
      PartValue<String?>(
        'reference_no',
        ref,
      ),
      PartValue<double>(
        'amount',
        amount,
      ),
      PartValueFile<Multipart?>(
        'receipt',
        imagePath,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<BuyModel, BuyModel>($request);
  }
}
