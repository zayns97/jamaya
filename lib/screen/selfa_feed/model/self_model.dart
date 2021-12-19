class Selfa {
  String selfa_amount;
  String selfa_description;
  int selfa_subscribers_count;
  String share_amount;
  String selfa_qr_code;
  String start_date;
  String end_date;
  bool is_private;
  String selfa_status;

  Selfa({
    required this.selfa_amount,
    required this.selfa_description,
    required this.selfa_subscribers_count,
    required this.share_amount,
    required this.selfa_qr_code,
    required this.start_date,
    required this.end_date,
    required this.is_private,
    required this.selfa_status,
  });
}

List<Selfa> selfat = [
  Selfa(
    selfa_amount: '3,000,000',
    selfa_description: 'هنا يوضع وصف عن السلفة وتفاصيلها',
    selfa_subscribers_count: 8,
    share_amount: '100,000',
    selfa_qr_code:
        'https://internationalbarcodes.com/wp-content/uploads/sites/95/2020/09/Int.com-Dynamic.jpg',
    start_date: '2021/10/01',
    end_date: '2022/10/01',
    is_private: false,
    selfa_status: 'نشطة',
  ),
  Selfa(
      selfa_amount: '2,000,000',
      selfa_description: 'هنا يوضع وصف عن السلفة وتفاصيلها',
      selfa_subscribers_count: 9,
      share_amount: '200,000',
      selfa_qr_code:
          'https://internationalbarcodes.com/wp-content/uploads/sites/95/2020/09/Int.com-Dynamic.jpg',
      start_date: '2021/09/01',
      end_date: '2022/07/01',
      is_private: true,
      selfa_status: 'غير مكتملة'),
  Selfa(
      selfa_amount: '2,000,000',
      selfa_description:
          ' هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص.',
      selfa_subscribers_count: 9,
      share_amount: '200,000',
      selfa_qr_code:
          'https://internationalbarcodes.com/wp-content/uploads/sites/95/2020/09/Int.com-Dynamic.jpg',
      start_date: '2021/09/01',
      end_date: '2022/07/01',
      is_private: true,
      selfa_status: 'غير مكتملة'),
  Selfa(
      selfa_amount: '2,000,000',
      selfa_description: 'هنا يوضع وصف عن السلفة وتفاصيلها',
      selfa_subscribers_count: 9,
      share_amount: '200,000',
      selfa_qr_code:
          'https://internationalbarcodes.com/wp-content/uploads/sites/95/2020/09/Int.com-Dynamic.jpg',
      start_date: '2021/09/01',
      end_date: '2022/07/01',
      is_private: true,
      selfa_status: 'غير مكتملة'),
  Selfa(
      selfa_amount: '2,000,000',
      selfa_description: 'هنا يوضع وصف عن السلفة وتفاصيلها',
      selfa_subscribers_count: 9,
      share_amount: '200,000',
      selfa_qr_code:
          'https://internationalbarcodes.com/wp-content/uploads/sites/95/2020/09/Int.com-Dynamic.jpg',
      start_date: '2021/09/01',
      end_date: '2022/07/01',
      is_private: true,
      selfa_status: 'غير مكتملة'),
  Selfa(
      selfa_amount: '2,000,000',
      selfa_description: 'هنا يوضع وصف عن السلفة وتفاصيلها',
      selfa_subscribers_count: 9,
      share_amount: '200,000',
      selfa_qr_code:
          'https://internationalbarcodes.com/wp-content/uploads/sites/95/2020/09/Int.com-Dynamic.jpg',
      start_date: '2021/09/01',
      end_date: '2022/07/01',
      is_private: true,
      selfa_status: 'غير مكتملة'),
];
