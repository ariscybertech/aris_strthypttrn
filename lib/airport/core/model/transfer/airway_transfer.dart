import '../../IAirport.dart';
import '../roady_way_model.dart';

class AirwayTransfer implements ITransfer {
  @override

  ///  User car transfer total cost [double]
  double calculate() {
    return (cost * duration) + (model.distance * model.wayCost);
  }

  @override

  ///  Car transfer money [double]
  double cost = 3;

  @override

  ///  Car transfer operation time [double]

  double duration = 10;

  @override

  ///  Car while going way property [RoadWayModel]

  RoadWayModel model = RoadWayModel(distance: 100, wayCost: 0.1);

  @override

  ///  Information to user about [BusTransfer]

  void sendMessage({required String user}) {
    print('$user going $this and total cost: $calculate()');
  }
}
