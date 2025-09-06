// the reason of creation this controller was that how exceptions would effect to simple classes
// cause I was learning about bloc and it's bloc-observer - in new versions of bloc you do not catch
// exceptions I will throw both in nearest zone and bloc-observer
import 'package:logger/logger.dart';

class ExceptionHandlingController {
  ExceptionHandlingController({required String textForParsing, required Logger logger})
      : _textForParsing = textForParsing,
        _logger = logger;

  final String _textForParsing;
  final Logger _logger;

  void pars() {
    try {
      final parseValue = int.parse(_textForParsing);

      _logger.d(parseValue);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
