import 'model/roady_way_model.dart';

abstract class ITransfer {
  final double cost;
  final double duration;
  final RoadWayModel model;

  ITransfer(this.cost, this.duration, this.model);
  double calculate();
  void sendMessage({required String user});
}
