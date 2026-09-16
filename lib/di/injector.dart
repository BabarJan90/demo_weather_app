import 'package:data/src/di/data_module.module.dart';
import 'package:domain/di/domain_module.module.dart';
import 'package:injectable/injectable.dart';
import 'package:kernel/kernel.dart';

import 'injector.config.dart';

@InjectableInit(
  includeMicroPackages: false,
  externalPackageModulesBefore: [
    ExternalModule(KernelPackageModule),
    ExternalModule(DataPackageModule),
    ExternalModule(DomainPackageModule),
  ],
)
Future<void> injectDependencies() async => getIt.init();
