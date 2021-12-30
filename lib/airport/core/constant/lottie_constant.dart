import 'application_constant.dart';

enum LottieItems { CAR, AIRPLANE, BUS, BCYLE, DONE, AIRPORT }

extension LottieItemsExtension on LottieItems {
  String get _path {
    switch (this) {
      case LottieItems.CAR:
        return 'car';
      case LottieItems.AIRPLANE:
        return 'airplane';

      case LottieItems.BCYLE:
        return 'bicyle';

      case LottieItems.BUS:
        return 'bus';

      case LottieItems.AIRPORT:
        return 'airport';

      case LottieItems.DONE:
        return 'done';

      default:
        throw Exception('$this not found');
    }
  }

  String get path => '${ApplicationConstant.LOTTIE_ROOT_PATH}$_path.json';
}
