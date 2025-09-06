import 'package:logger/logger.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/data/exception_handling_repository.dart';

// the reason of creation this controller was that how exceptions would effect to simple classes
// cause I was learning about bloc and it's bloc-observer - in new versions of bloc you do not catch
// exceptions I will throw both in nearest zone and bloc-observer
class ExceptionHandlingController {
  ExceptionHandlingController({
    required IExceptionHandlingRepository exceptionHandlingRepository,
    required String textForParsing,
    required Logger logger,
  }) : _exceptionHandlingRepository = exceptionHandlingRepository,
       _textForParsing = textForParsing,
       _logger = logger;

  final IExceptionHandlingRepository _exceptionHandlingRepository;
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

  // it will throw an error to the zone cause it's the repository
  void handleException() async {
    await _exceptionHandlingRepository.test();
  }
}
