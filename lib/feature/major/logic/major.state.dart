part of 'major.cubit.dart';

class MajorState {
  final List<MajorModel> majors;
  final String? error;

  MajorState({this.majors = const [], this.error});

  factory MajorState.initial() => MajorState();

  MajorState fetchMajors(List<MajorModel> majors) =>
      MajorState(majors: majors);

  MajorState addMajor(MajorModel major) =>
      MajorState(majors: [...majors, major]);

  MajorState updateMajor(MajorModel major) {
    majors[majors.indexOf(major)] = major;
    return MajorState(majors: majors);
  }

  MajorState deleteMajor(MajorModel major) {
    majors.remove(major);
    return MajorState(majors: majors);
  }

  MajorState setError(String error) =>
      MajorState(error: error, majors: majors);

  void onError(Function(String) onError) {
    if (error != null) onError(error!);
  }
}
