@freezed
class AuthState with _$AuthState {
    const factory AuthState({
        required bool hasConsent,
        required String consentUrl,
    }) = _AuthState;

    factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);
}
