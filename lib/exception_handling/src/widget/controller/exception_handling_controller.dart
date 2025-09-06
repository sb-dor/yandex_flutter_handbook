import 'package:logger/logger.dart';
import 'package:yandex_flutter_handbook/exception_handling/common/reusable_global_functions.dart';
import 'package:yandex_flutter_handbook/exception_handling/src/data/exception_handling_repository.dart';

// the reason of creation this controller was that how exceptions would effect to simple classes
// cause I was learning about bloc and it's bloc-observer - in new versions of bloc you do not catch
// exceptions I will throw both in nearest zone and bloc-observer
class ExceptionHandlingController {
  ExceptionHandlingController({
    required IExceptionHandlingRepository exceptionHandlingRepository,
    required ReusableGlobalFunctions reusableGlobalFunctions,
    required String textForParsing,
    required Logger logger,
  }) : _exceptionHandlingRepository = exceptionHandlingRepository,
       _reusableGlobalFunctions = reusableGlobalFunctions,
       _textForParsing = textForParsing,
       _logger = logger;

  final IExceptionHandlingRepository _exceptionHandlingRepository;
  final ReusableGlobalFunctions _reusableGlobalFunctions;
  final String _textForParsing;
  final Logger _logger;

  // it will throw an error to the Flutter.error cause it's the widgets related error
  // and it's synchronous
  void pars() {
    try {
      final parseValue = int.parse(_textForParsing);

      _logger.d(parseValue);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  // it will throw an error to the Flutter.error cause it's the widgets related error
  // and it's synchronous
  void partFromSingleTon() {
    _reusableGlobalFunctions.numParse();
  }

  void partFromSingleTonFuture() async {
    await Future.delayed(const Duration(seconds: 1));
    _reusableGlobalFunctions.numParse();
  }

  // it will throw an error to the zone cause it's the asynchronous
  void partFromRepo() async {
    await _exceptionHandlingRepository.parsedNum();
  }

  // it will throw an error to the zone cause it's the asynchronous
  void handleException() async {
    await _exceptionHandlingRepository.test();
  }
}
