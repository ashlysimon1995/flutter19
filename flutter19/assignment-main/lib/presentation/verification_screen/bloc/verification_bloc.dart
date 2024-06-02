import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:assignment/presentation/verification_screen/models/verification_model.dart';
part 'verification_event.dart';
part 'verification_state.dart';

/// A bloc that manages the state of a Verification according to the event that is dispatched to it.
class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc(VerificationState initialState) : super(initialState) {
    on<VerificationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    VerificationInitialEvent event,
    Emitter<VerificationState> emit,
  ) async {
    emit(state.copyWith(emailController: TextEditingController()));
  }
}
