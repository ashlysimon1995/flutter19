import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/role_model.dart';
import '/core/app_export.dart';
part 'role_event.dart';
part 'role_state.dart';

/// A bloc that manages the state of a Role according to the event that is dispatched to it.
class RoleBloc extends Bloc<RoleEvent, RoleState> {
  RoleBloc(RoleState initialState) : super(initialState) {
    on<RoleInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RoleInitialEvent event,
    Emitter<RoleState> emit,
  ) async {}
}
