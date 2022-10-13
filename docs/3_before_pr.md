# 🚀  Before PR

_Made with love by the_ **Monkslab** ❤️

## Get MAIN code, and align

- [x] 1. run all the test: flutter test --coverage and remove unnecessary files with: lcov --remove coverage/lcov.info '**/*.g.dart' '**/*.freezed.dart' -o coverage/lcov.info
- [x] 2. test required platforms (iOS, android, web, windows, mac)
- [x] 3. solve conflicts - relay on team mates when necessary
- [x] 6. format: flutter format .
- [x] 7. flutter analyze .
    _if you find problems..._
  - [x] a. solve conflicts with dart fix --apply (dart fix --dry-run if you want to see a list of possible conflicts to solve, first)
  - [x] b. solve manually
  - [x] c. check with flutter analyze to wrap up
- [x] 8. leave the project with 0 problems
- [x] 9. commit your code so it's pristine before merge with parent branch
- [x] 10. do git pull source branch
- [x] 11. merge into your branch
- [x] 12. repeat from step 1 until code is cuter than eating pancakes on a rainy day

## Updates

- [x] 1. upgrade with [Semantic Versioning](https://semver.org/) in pubspec.yaml
  - **major** _version when you make incompatible API changes_
  - **minor** _version when you add functionality in a backwards compatible manner_
  - **patch** _version when you make backwards compatible bug fixes_
  - non-negative integers, and MUST NOT contain leading zeroes
  - each element MUST increase numerically. For instance: 1.9.0 -> 1.10.0 -> 1.11.0
  - **!** check with teammates if any doubt
- [x] 2. based on [Changelog](https://keepachangelog.com/en/1.0.0/), update the [changelog.md](./changelog.md) file
- [x] 3. update [test coverage and tech debt](./tech_debt.md)
- [x] 4. update **fakes** if anything new was made in the interfaces
- [x] 5. update **screenshots** in [readme](../README.md)
- [x] 6. update **tests** if there was a refactor

## Final Stage

- [x] 1. take the screen record you did, save it with the name of the feature and the version (for ex: url_shortener_0.1.0), and add it to [project readme](../README.md) _if adds something new and useful_
- [x] 2. auto-review PR locally
- [x] 3. use [Conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
    1. header based on branch.
    2. naming
        - appends a **! after the type/scope**, introduces a **breaking API** change => **major** in semantic versioning.
        - use **# automated reference** to epic tickets
        - final **form**: type-of-branch(name-of-branch-#number-of-epic)exclamation-if-braking-change: #number-of-ticket responde-to-this-commit-will-add...
        - **example**: feat/(multiple-bill-payments-#123)!: #789 add form validations
- [x] 4. This code is 🥷  level. **PUSH**
