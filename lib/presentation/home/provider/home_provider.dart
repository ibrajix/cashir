import 'package:cashir/networking/services/api_service.dart';
import 'package:cashir/presentation/home/data/response/home_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = Provider<ApiService>((ref)=>ApiService());
final getDataProvider = FutureProvider.autoDispose<HomeResponse>((ref) async {
  final apiService = ref.watch(homeProvider);
  return apiService.getData();
});

final accountBalanceVisibilityProvider = StateProvider((ref) => true);
