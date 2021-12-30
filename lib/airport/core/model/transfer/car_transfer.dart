import '../../IAirport.dart';
import '../roady_way_model.dart';

class CarTransfer implements ITransfer {
  @override

  ///  User car transfer total cost [double]
  double calculate() {
    return (cost * duration) + (model.distance * model.wayCost);
  }

  @override

  ///  Car transfer money [double]
  double cost = 50;

  @override

  ///  Car transfer operation time [double]

  double duration = 1;

  @override

  ///  Car while going way property [RoadWayModel]

  RoadWayModel model = RoadWayModel(distance: 50, wayCost: 1.2);

  @override

  ///  Information to user about [CarTransfer]

  void sendMessage({required String user}) {
    print('$user going $CarTransfer and total cost: $calculate()');
  }
}
