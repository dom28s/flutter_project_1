// class shoe {
//   String name, shoeType, description, pic, itemType;
//   double price;

//   shoe(
//       {required this.name,
//       required this.description,
//       required this.price,
//       required this.shoeType,
//       required this.pic,
//       required this.itemType});
// }

// List<shoe> shoeList = [
//   shoe(
//       name: 'Air Jordan 1 Low',
//       description:
//           "Air Jordan 1 Low ได้แรงบันดาลใจจากรุ่นออริจินัลที่เปิดตัวในปี 1985 ด้วยลุคคลาสสิกสะอาดตาอย่างที่คุ้นเคย แต่ยังสดใหม่เสมอ รองเท้าคู่นี้มาในดีไซน์อันเป็นเอกลักษณ์ที่จับคู่กับทุกชุดได้อย่างลงตัว จึงมั่นใจได้ว่าคุณจะเป๊ะปังอยู่เสมอ",
//       price: 4300,
//       shoeType: 'รองเท้าผู้ชาย',
//       pic:
//           'https://static.nike.com/a/images/q_auto:eco/t_product_v1/f_auto/dpr_1.3/h_467,c_limit/4693a962-0ea1-4677-b5fd-eeed550ab4d3/%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%97%E0%B9%89%E0%B8%B2%E0%B8%9C%E0%B8%B9%E0%B9%89-air-jordan-1-low-zTWr01.png',
//       itemType: "รองเท้า"),
//   shoe(
//     name: 'Nike Dunk Low',
//     description: 'description',
//     price: 3700,
//     shoeType: 'รองเท้าผู้หญิง',
//     pic:
//         'https://static.nike.com/a/images/q_auto:eco/t_product_v1/f_auto/dpr_1.3/h_467,c_limit/bded6725-dc92-4e77-881f-d784ffde77e2/%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%97%E0%B9%89%E0%B8%B2%E0%B8%9C%E0%B8%B9%E0%B9%89-dunk-low-wbxcmN.png',
//     itemType: "รองเท้า",
//   ),
//   shoe(
//     name: 'Nike Dunk Low Retro',
//     description: 'description',
//     price: 3700,
//     shoeType: 'รองเท้าผู้ชาย',
//     pic:
//         'https://static.nike.com/a/images/q_auto:eco/t_product_v1/f_auto/dpr_1.3/h_467,c_limit/a3e7dead-1ad2-4c40-996d-93ebc9df0fca/%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%97%E0%B9%89%E0%B8%B2%E0%B8%9C%E0%B8%B9%E0%B9%89-dunk-low-retro-66RGqF.png',
//     itemType: "รองเท้า",
//   ),
//   shoe(
//     name: 'Nike Air Force 1 Low EVO',
//     description: 'description',
//     price: 5400,
//     shoeType: 'รองเท้าผู้ชาย',
//     pic:
//         'https://static.nike.com/a/images/q_auto:eco/t_product_v1/f_auto/dpr_1.3/h_467,c_limit/842700c8-51c8-4a4a-86fe-9f1ecb7b0984/%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%97%E0%B9%89%E0%B8%B2%E0%B8%9C%E0%B8%B9%E0%B9%89-air-force-1-low-evo-QcbnHZ.png',
//     itemType: "รองเท้า",
//   ),
// ];

// class shoe {
//   String name, shoeType, description, pic, itemType;
//   double price;

//   shoe({
//     required this.name,
//     required this.description,
//     required this.itemType,
//     required this.pic,
//     required this.price,
//     required this.shoeType,
//   });

//   factory shoe.fromFirestore(Map<String, dynamic> data) {
//     return shoe(
//       name: data['name'],
//       description: data['description'],
//       itemType: data['itemType'],
//       pic: data['pic'],
//       price: data['price'],
//       shoeType: data['shoeType'],
//     );
//   }
// }

// class Shoe {
//   String name;
//   String shoeType;
//   String description;
//   String pic;
//   String type;
//   double price;

//   Shoe({
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.shoeType,
//     required this.pic,
//     required this.type,
//   });

//   factory Shoe.fromFirestore(Map<String, dynamic> data) {
//     return Shoe(
//       name: data['name'],
//       description: data['description'],
//       price: data['price'].toDouble(),
//       shoeType: data['itemType'],
//       pic: data['pic'],
//       type: data['type'],
//     );
//   }
// }

class allitem {
  String name;
  String itemType;
  String type;
  double price;
  String description;
  String pic;
  String gender;

  allitem(
      {required this.name,
      required this.description,
      required this.itemType,
      required this.pic,
      required this.price,
      required this.type,
      required this.gender});

  factory allitem.fromFirestore(Map<String, dynamic> data) {
    return allitem(
        name: data['name'],
        description: data['description'],
        itemType: data['itemType'],
        pic: data['pic'],
        price: data['price'].toDouble(),
        type: data['type'],
        gender: data['gender']);
  }
}

class massage {
  String maasage;
  double timestamp;

  massage({
    required this.maasage,
    required this.timestamp,
  });

  factory massage.fromeFirestore(Map<String, dynamic> data) {
    return massage(
        maasage:
            data['maasage'] ?? 'Default massage', // Default message if null
        timestamp: (data['timestamp'] != null)
            ? data['timestamp'].toDouble()
            : DateTime.now()
                .millisecondsSinceEpoch
                .toDouble() // Default timestamp if null
        );
  }
}
