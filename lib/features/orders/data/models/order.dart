import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/orders/data/models/order_cost.dart';
import 'package:medlife_v2/utils/data/models/user.dart';

class Order {
  final String id;
  final String status;
  final DateTime dateTime;
  final OrderCost orderCost;
  final List<CartMedicalEquipment> cartMedicalEquipments;
  final User buyer;
  final String paymentMethod;

  Order({
    required this.id,
    required this.status,
    required this.dateTime,
    required this.orderCost,
    required this.cartMedicalEquipments,
    required this.buyer,
    required this.paymentMethod,
  });

  Order.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          status: json['status'] as String,
          dateTime: (json['dateTime'] as Timestamp).toDate(),
          orderCost:
              OrderCost.fromJson(json['orderCost'] as Map<String, dynamic>),
          cartMedicalEquipments: (json['cartMedicalEquipments'] as List)
              .map(
                (json) =>
                    CartMedicalEquipment.fromJson(json as Map<String, dynamic>),
              )
              .toList(),
          buyer: User.fromJson(json['buyer'] as Map<String, dynamic>),
          paymentMethod: json['paymentMethod'] as String,
        );
}
