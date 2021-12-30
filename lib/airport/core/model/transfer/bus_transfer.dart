import '../../IAirport.dart';
import '../roady_way_model.dart';

class BusTransfer implements ITransfer {
  @override

  ///  User car transfer total cost [double]
  double calculate() {
    return (cost * duration) + (model.distance * model.wayCost);
  }

  @override

  ///  Car transfer money [double]
  double cost = 10;

  @override

  ///  Car transfer operation time [double]

  double duration = 3;

  @override

  ///  Car while going way property [RoadWayModel]

  RoadWayModel model = RoadWayModel(distance: 50, wayCost: 0.5);

  @override

  ///  Information to user about [BusTransfer]

  void sendMessage({required String user}) {
    print('$user going $this and total cost: $calculate()');
  }
}
