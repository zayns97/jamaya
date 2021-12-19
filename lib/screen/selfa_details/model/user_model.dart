class User {
  String user_name;
  int share_amount;
  bool is_reserved;
  bool is_for_sell;

  User({
    required this.user_name,
    required this.is_reserved,
    required this.is_for_sell,
    required this.share_amount,
  });
}

List<User> users = [
  User(
    user_name: 'احمد محمد محمود',
    share_amount: 2,
    is_reserved: true,
    is_for_sell: false,
  ),
  User(
    user_name: 'احمد محمد محمود',
    share_amount: 2,
    is_reserved: true,
    is_for_sell: false,
  ),
  User(
    user_name: 'منتظر سمير علي',
    share_amount: 1,
    is_reserved: true,
    is_for_sell: true,
  ),
  User(
    user_name: 'منتظر سمير علي',
    share_amount: 1,
    is_reserved: true,
    is_for_sell: true,
  ),
  User(
    user_name: 'عبد الله عثمان نعمان',
    share_amount: 2,
    is_reserved: false,
    is_for_sell: false,
  ),
];
