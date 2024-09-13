import 'package:admin_app/core/di/container.dart';
import 'package:admin_app/feature/domain/data/model/domain.model.dart';
import 'package:admin_app/feature/domain/data/repo/domain.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'domain.state.dart';

class DomainCubit extends Cubit<DomainState> {
  final _domainRepo = locator<DomainRepo>();

  DomainCubit() : super(DomainState.initial());

  Future<void> getDomains() async {
    final result = await _domainRepo.getDomains();
    result.when(
      success: (domains) => emit(state.fetchDomains(domains)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> addDomain(String name) async {
    final result = await _domainRepo.createDomain(name: name);
    result.when(
      success: (domain) => emit(state.addDomain(domain)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> updateDomain(DomainModel domain, String name) async {
    final result =
        await _domainRepo.updateDomain(domain.id!, name: name);
    result.when(
      success: (domain) => emit(state.updateDomain(domain)),
      error: (error) => emit(state.setError(error.message)),
    );
  }

  Future<void> deleteDomain(DomainModel domain) async {
    final result = await _domainRepo.deleteDomain(domain.id!);
    result.when(
      success: (_) => emit(state.deleteDomain(domain)),
      error: (error) => emit(state.setError(error.message)),
    );
  }
}
