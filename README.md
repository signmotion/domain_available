# Domain Available

![Cover - Domain Available](https://raw.githubusercontent.com/signmotion/domain_available/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/signmotion/id_gen/master/LICENSE)

Checks if the domain is available.

## How It Works

Use [Instant Domain Search Check](https://instantdomainsearch.com) for check domain name.

## Usage

### Check

```dart
final checked = await DomainAvailable('openai.com').firstRegisteredStatus();
print('The ${checked.domain} is ${checked.registeredStatus}.');
```

Output:

```text
> The openai.com is taken.
```

### Sanitize

```dart
print('https://www.happy.com/path_to/page'.sanitizeDomain);
```

Output:

```text
> happy.com
```

## Welcome

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/id_gen). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/id_gen).

## TODO

- All feautures for this package into README.
- Enhance a check with <https://lookup.icann.org>.
- ? A checker with [Domain DA - PA Check](https://rapidapi.com/Glavier/api/domain-da-pa-check').
