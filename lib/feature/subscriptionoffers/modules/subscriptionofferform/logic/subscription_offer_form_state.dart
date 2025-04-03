part of 'subscription_offer_form_cubit.dart';

enum _SubscriptionOfferFormStatus {
  initial,
  loading,
  loaded,
  error,
}

class SubscriptionOfferFormState<T extends SubscriptionOfferDto> {
  final _SubscriptionOfferFormStatus _status;

  SubscriptionOfferFormState({
    _SubscriptionOfferFormStatus? status,
  }) : _status = status ?? _SubscriptionOfferFormStatus.initial;

  factory SubscriptionOfferFormState.initial() =>
      SubscriptionOfferFormState();

  bool get isLoading =>
      _status == _SubscriptionOfferFormStatus.loading;
  bool get isLoaded => _status == _SubscriptionOfferFormStatus.loaded;

  SubscriptionOfferFormState<T> _loadign() {
    return _copyWith(status: _SubscriptionOfferFormStatus.loading);
  }

  SubscriptionOfferFormState<T> _loaded(
          SubscriptionOfferModel offer) =>
      _LoadedState(offer, this);

  SubscriptionOfferFormState<T> _error(String message) =>
      _copyWith(status: _SubscriptionOfferFormStatus.error);

  SubscriptionOfferFormState<T> _copyWith({
    _SubscriptionOfferFormStatus? status,
  }) {
    return SubscriptionOfferFormState(
      status: status ?? _status,
    );
  }

  void onLoadOffer(
      void Function(SubscriptionOfferModel offer) callback) {}
}

class _LoadedState<T extends SubscriptionOfferDto>
    extends SubscriptionOfferFormState<T> {
  final SubscriptionOfferModel _offer;

  _LoadedState(this._offer, SubscriptionOfferFormState<T> state)
      : super(status: state._status);

  @override
  void onLoadOffer(
      void Function(SubscriptionOfferModel offer) callback) {
    callback(_offer);
  }
}
