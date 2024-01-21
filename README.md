# Domain Available

![Cover - Domain Available](https://raw.githubusercontent.com/signmotion/domain_available/master/images/cover.webp)

Checks if the domain is available.

## How It Works

Use [Instant Domain Search Check](https://instantdomainsearch.com) for check domain name.

## Examples

### Check

```dart
final checked = await DomainAvailable('openai.com').firstRegisteredStatus();
print('The ${checked.domain} is ${checked.registeredStatus}.');
```

Output:

```sh
> The openai.com is taken.
```

### Sanitize

```dart
print('https://www.happy.com/path_to/page'.sanitizeDomain);
```

Output:

```sh
> happy.com
```

## License

[MIT](LICENSE)

## TODO

- All feautures for this package into README.
- Enhance a check with <https://lookup.icann.org>.
- ? A checker with [Domain DA - PA Check](https://rapidapi.com/Glavier/api/domain-da-pa-check').
