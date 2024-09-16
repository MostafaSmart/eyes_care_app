

class AppPrint {
  static void _printRed(String text) {
    // ignore: avoid_print
    print('\x1B[31m$text\x1B[0m');
  }

  static void _printGreen(String text) {
    // ignore: avoid_print
    print('\x1B[32m$text\x1B[0m');
  }
    static void _printGreenObj(Object obj) {
    // ignore: avoid_print
    print('\x1B[32m$obj\x1B[0m');
  }

  static void _printYellow(String text) {
    // ignore: avoid_print
    print('\x1B[33m$text\x1B[0m');
  }

  static void _printWhite(String text) {
    // ignore: avoid_print
    print('\x1B[37m$text\x1B[0m');
  }


  static void _printMagenta(String text) {
    // ignore: avoid_print
    print('\x1B[35m$text\x1B[0m');
  }

  static void printWarning(String text) {
    _printYellow(text);
  }

  static void printError(String text) {
    _printRed(text);
  }

  static void printInfo(String text) {
    _printGreen(text);
  }
  static void printData(String text) {
    _printWhite(text);
  }

  static void printSuccess(String text) {
    _printMagenta(text);
  }
  static void printObj(Object obj) {
    _printGreenObj(obj);
  }
}
