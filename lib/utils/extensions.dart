extension StringExtensions on String {
  // String get png => "assets/images/$this.png";
  // String get svg => "assets/images/$this.svg";
  // String get jpg => "assets/images/$this.jpg";
  // String get json => "assets/images/$this.json";
  String get capitalize => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : this;
  String get allInCaps => toUpperCase();
  String get titleCase => split(' ').map((str) => str.capitalize).join(' ');
  int get toHexColor => int.parse("FF" + this.toUpperCase().replaceAll("#", ""), radix: 16);
}