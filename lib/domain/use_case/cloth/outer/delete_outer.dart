import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteOuter {
  final OuterRepository outerRepository;

  DeleteOuter(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.deleteOuter(outer);
  }
}