part of 'domain.cubit.dart';

class DomainState {
  final List<DomainModel> domains;
  final String? error;

  DomainState({this.domains = const [], this.error});

  factory DomainState.initial() => DomainState();

  DomainState fetchDomains(List<DomainModel> domains) =>
      DomainState(domains: domains);

  DomainState addDomain(DomainModel domain) =>
      DomainState(domains: [...domains, domain]);

  DomainState updateDomain(DomainModel domain) {
    domains[domains.indexOf(domain)] = domain;
    return DomainState(domains: domains);
  }

  DomainState deleteDomain(DomainModel domain) {
    domains.remove(domain);
    return DomainState(domains: domains);
  }

  DomainState setError(String error) =>
      DomainState(error: error, domains: domains);

  void onError(Function(String) onError) {
    if (error != null) onError(error!);
  }
}
