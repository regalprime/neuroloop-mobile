import 'package:neuroloop/main/app/bootstrap.dart';

import 'app/flavor.dart';

Future<void> main() {
  return bootstrap(
    flavor: Flavor.dev,
  );
}
