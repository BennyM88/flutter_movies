import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview/network_configuration/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShouldWatchCubit extends Cubit<Result<bool>> {
  ShouldWatchCubit() : super(const Result.initial());

  void shouldWatch(int revenue, int budget) {
    bool isSundayToday = DateTime.now().weekday == 7;
    bool isProfitBigEnough = (revenue - budget > 1000000);
    bool shouldWatchMovie = isProfitBigEnough && isSundayToday;
    emit(Result.success(shouldWatchMovie));
  }
}
