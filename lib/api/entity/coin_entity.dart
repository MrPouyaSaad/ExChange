// ignore_for_file: public_member_api_docs, sort_constructors_first
class CoinList {
  final String name;
  final String smb;
  final String imageUrl;
  final String price;
  final String marketCap;

  CoinList({
    required this.name,
    required this.smb,
    required this.imageUrl,
    required this.price,
    required this.marketCap,
  });

  factory CoinList.fromJson(Map<String, dynamic> json) {
    return CoinList(
      name: json['CoinInfo']['FullName'],
      smb: json['CoinInfo']['Name'],
      imageUrl: json['CoinInfo']['ImageUrl'],
      price: (json['DISPLAY']['USD']['PRICE']),
      marketCap: (json['DISPLAY']['USD']['MKTCAP']),
    );
  }
}
