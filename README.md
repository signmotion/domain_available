# Domain Available

![SDK version](https://badgen.net/pub/sdk-version/domain_available?style=for-the-badge)
![Supported platforms](https://badgen.net/pub/flutter-platform/domain_available?style=for-the-badge)
![Supported SDKs](https://badgen.net/pub/dart-platform/domain_available?style=for-the-badge)

![Cover - Domain Available](https://raw.githubusercontent.com/signmotion/domain_available/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/pub/v/domain_available.svg?logo=dart&logoColor=00b9fc&color=blue&style=for-the-badge)](https://pub.dartlang.org/packages/domain_available)
[![Code Size](https://img.shields.io/github/languages/code-size/signmotion/domain_available?logo=github&logoColor=white&style=for-the-badge)](https://github.com/signmotion/domain_available)
[![Publisher](https://img.shields.io/pub/publisher/domain_available?style=for-the-badge)](https://pub.dev/publishers/syrokomskyi.com)

[![Build Status](https://img.shields.io/github/actions/workflow/status/signmotion/domain_available/dart-ci.yml?logo=github-actions&logoColor=white&style=for-the-badge)](https://github.com/signmotion/domain_available/actions)
[![Pull Requests](https://img.shields.io/github/issues-pr/signmotion/domain_available?logo=github&logoColor=white&style=for-the-badge)](https://github.com/signmotion/domain_available/pulls)
[![Issues](https://img.shields.io/github/issues/signmotion/domain_available?logo=github&logoColor=white&style=for-the-badge)](https://github.com/signmotion/domain_available/issues)
[![Pub Score](https://img.shields.io/pub/points/domain_available?logo=dart&logoColor=00b9fc&style=for-the-badge)](https://pub.dev/packages/domain_available/score)

Checks if the domain is available. The easy-to-use and [well-tested](https://github.com/signmotion/domain_available/tree/master/test) package.
Feel free to use it in your awesome project.

[![CodeFactor](https://codefactor.io/repository/github/signmotion/domain_available/badge?style=for-the-badge)](https://codefactor.io/repository/github/signmotion/domain_available)

Share some ❤️ and star repo to support the project.

_If you write an article about **DomainAvailable** or any of [these](https://pub.dev/packages?q=publisher%3Asyrokomskyi.com&sort=updated) packages, let me know and I'll post the URL of the article in the **README**_ 🤝

## 🖥️ How It Works

Use [Instant Domain Search Check](https://instantdomainsearch.com) for check domain name.

## 🚀 Usage

### Check

```dart
final checked = await DomainAvailable('openai.com').firstRegisteredStatus();
print('The ${checked.domain} is ${checked.registeredStatus}.');
```

```text
> The openai.com is taken.
```

### Sanitize

```dart
print('https://www.happy.com/path_to/page'.sanitizeDomain);
```

```text
> happy.com
```

## ✨ What's New

Look at [changelog](https://pub.dev/packages/domain_available/changelog).

## 👋 Welcome

If you encounter any problems, feel free to [open an issue](https://github.com/signmotion/domain_available/issues). If you feel the package is missing a feature, please [raise a ticket](https://github.com/signmotion/domain_available/issues) on Github and I'll look into it. Requests and suggestions are warmly welcome. Danke!

Contributions are what make the open-source community such a great place to learn, create, take a new skills, and be inspired.

If this is your first contribution, I'll leave you with some of the best links I've found: they will help you get started or/and become even more efficient.

- [Guide to Making a First Contribution](https://github.com/firstcontributions/first-contributions). You will find the guide in your native language.
- [How to Contribute to Open Source](https://opensource.guide/how-to-contribute). Longread for deep diving for first-timers and for veterans.
- [Summer Guide from Google](https://youtu.be/qGTQ7dEZXZc).
- [CodeTriangle](https://codetriage.com). Free community tools for contributing to Open Source projects.

The package **DomainAvailable** is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/domain_available). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/domain_available).

And here is a curated list of how you can help:

- Documenting the undocumented. Whenever you come across a class, property, or method within our codebase that you're familiar with and notice it lacks documentation, kindly spare a couple of minutes to jot down some helpful notes for your fellow developers.
- Refining the code. While I'm aware it's primarily my responsibility to refactor the code, I wholeheartedly welcome any contributions you're willing to make in this area. Your insights and improvements are appreciated!
- Constructive code reviews. Should you discover a more efficient approach to achieve something, I'm all ears. Your suggestions for enhancement are invaluable.
- Sharing your examples. If you've experimented with our use cases or have crafted some examples of your own, feel free to add them to the `example` directory. Your practical insights can enrich our resource pool.
- Fix typos/grammar mistakes.
- Report bugs and scenarios that are difficult to implement.
- Implement new features by making a pull-request.

## ✅ TODO (perhaps)

Once you start using the **DomainAvailable**, it will become easy to choose the functionality to contribute. But if you already get everything you need from this package but have some free time, let me write here what I have planned:

- All feautures for this package into `README`.
- Enhance a check with <https://lookup.icann.org>.
- ? A checker with [Domain DA - PA Check](https://rapidapi.com/Glavier/api/domain-da-pa-check').

It's just a habit of mine: writing down ideas that come to mind while working on a project. I confess that I rarely return to these notes. But now, hopefully, even if you don't have an idea yet, the above notes will help you choose the suitable "feature" and become a contributor to the open-source community.

Created [with ❤️](https://syrokomskyi.com)
