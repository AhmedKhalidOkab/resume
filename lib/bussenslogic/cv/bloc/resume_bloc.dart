import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'resume_event.dart';
part 'resume_state.dart';

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  ResumeBloc() : super(ResumeInitial()) {
    on<ResumeEvent>((event, emit) {});
  }
}
