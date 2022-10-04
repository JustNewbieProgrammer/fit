import 'package:fit/domain/model/cloth/bottom.dart';
import 'package:fit/domain/repository/cloth/bottom_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateBottom {
  final BottomRepository bottomRepository;

  UpdateBottom(this.bottomRepository);

  Future<void> call(Bottom bottom) async {
    await bottomRepository.updateBottom(bottom);
  }
}
