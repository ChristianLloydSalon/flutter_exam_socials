import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constant/app_assets.dart';
import '../../domain/model/company.dart';

part 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit() : super(const CompaniesState());

  void pageChanged(int page) {
    emit(state.copyWith(page: page));
  }
}
