# 🎇 LucraPhotos

Simple album / photo grid → viewer application that loads and displays data from imgur.

## ℹ️ Information

- Time spent: **~3 hours**
- Built with: **Xcode 16.1 (16B40)**
- Minimum deployment target: **iOS 18**
- Architecture: **DI, MVVM, & Services**

## 🔨 Build & Run

1. Open `LucraPhotos.xcodeproj`
2. Wait for package dependencies to resolve & install
3. Build & run 🎉

## 📝 Project Details

I pretty much approach all projects the same - setting up a strong architecture that can scale as the project grows.
While it might be overkill for a simple application like this, I wanted to demonstrate how important I think a strong foundation
is. The minimum deplyment target is iOS 18 because I wanted to use the new zoom transitions 😎 - otherwise it could be lowered.

I used a mix of packages that I personally maintain, as well as extremely common community-led ones. The main ones are:

- [Espresso](https://github.com/mitchtreece/espresso) **(maintained by me)** - Helper library that I use in all my projects.
- [Spider](https://github.com/mitchtreece/spider) **(maintained by me)** - Simple networking library without al the bloat of things like `AlamoFire`.
- [Swinject](https://github.com/Swinject/Swinject) - My preferred dependency injection framework, works great for SwiftUI or UIKit.
- [Nuke](https://github.com/kean/Nuke) - Image loading library used for `AsyncImage` caching.
- [LazyPager](https://github.com/gh123man/SwiftUI-LazyPager) - Simple image preview / viewer library

## 🧠 Final Thoughts

I hope you enjoyed looking through the project, and getting to know my coding-style. If you have any questions, need clarity on aspects of the project, or just want to chat - feel free to reach out 😎
