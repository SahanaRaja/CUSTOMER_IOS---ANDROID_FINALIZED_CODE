// ignore_for_file: non_constant_identifier_names

class AssetsTable {
  final String BM_BASE64_ID;
  // final String BM_FLAG_STATUS;
  final String BM_ICON_NAME;
  final String BM_BASE64_IMAGE_STRING;

  AssetsTable({
    required this.BM_BASE64_ID,
    // required this.BM_FLAG_STATUS,
    required this.BM_ICON_NAME,
    required this.BM_BASE64_IMAGE_STRING,
  });

  Map<String, dynamic> toMap() {
    return {
      'BM_BASE64_ID': BM_BASE64_ID,
      // 'BM_FLAG_STATUS': BM_FLAG_STATUS,
      'BM_ICON_NAME': BM_ICON_NAME,
      'BM_BASE64_IMAGE_STRING': BM_BASE64_IMAGE_STRING,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'AssetsTable{BM_BASE64_ID: $BM_BASE64_ID,  BM_ICON_NAME: $BM_ICON_NAME, BM_BASE64_IMAGE_STRING: $BM_BASE64_IMAGE_STRING}';
  }
}
