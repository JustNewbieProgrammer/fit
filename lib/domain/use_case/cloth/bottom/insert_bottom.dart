import 'package:fit/domain/repository/cloth/bottom_repository.dart';

import '../../../model/cloth/bottom.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertBottom{
  final BottomRepository bottomRepository;

  InsertBottom(this.bottomRepository);

  Future<void> call(Bottom bottom) async {
    await bottomRepository.insertBottom(bottom);
  }
}