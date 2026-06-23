# 📱 Programmatic UITableView - Smartphone Catalog

A simple iOS application built entirely using **UIKit** and **programmatic UI** (no Storyboards). The app fetches smartphone data from a REST API and displays it in a custom `UITableView`.

## 🚀 Features

* Programmatic UI using UIKit
* Custom `UITableViewCell`
* REST API integration using `URLSession`
* JSON parsing into Swift models
* Asynchronous data fetching
* Auto Layout using NSLayoutConstraints
* Custom table view with dynamic content
* MVC architecture

## 📸 Demo

<img width="295" height="640" alt="Simulator Screen Recording - iPhone 17 Pro - 2026-06-23 at 11 07 33" src="https://github.com/user-attachments/assets/5bedd0f7-5de5-47b6-a774-361fcd00642d" />


---

## 🛠 Technologies Used

* Swift
* UIKit
* URLSession
* Auto Layout
* UITableView
* JSON Decoding
* MVC Architecture

---

## 📂 Project Structure

```
ProgrammaticTableview/
│
├── ViewController.swift
├── NetworkManager.swift
├── Models.swift
├── Assets.xcassets
└── AppDelegate.swift
```

---

## 📡 API Used

DummyJSON Smartphones API

```
https://dummyjson.com/products/category/smartphones
```

Each smartphone includes:

* Title
* Description
* Product ID
* Images
* Price
* Brand
* Category

---

## 📱 UI

The interface is created entirely in code.

Each table view cell displays:

* Smartphone Image (currently using a placeholder SF Symbol)
* Smartphone Title
* Product ID
* Description

---

## 🧠 What I Learned

This project helped me practice:

* Creating views programmatically
* Working with `UITableView`
* Building reusable custom cells
* Fetching data from APIs
* Handling asynchronous network calls
* Updating the UI on the main thread
* Using Auto Layout constraints in code
* Separating networking from UI using a `NetworkManager`

---

## ⚙️ How It Works

1. The app launches.
2. `ViewController` requests smartphone data from the API.
3. `NetworkManager` downloads and decodes the JSON response.
4. The decoded models are stored in an array.
5. The table view reloads on the main thread.
6. Each row displays smartphone information using a custom `MovieCell`.

---

## 🔮 Future Improvements

* Load actual product images instead of SF Symbols
* Add image caching
* Display price and brand
* Add search functionality
* Add pull-to-refresh
* Navigate to a detailed product screen
* Improve UI design and spacing
* Add loading indicators and error handling

---

## ▶️ Getting Started

1. Clone the repository

```bash
git clone https://github.com/yourusername/ProgrammaticTableview.git
```

2. Open the project in Xcode.

3. Run on an iOS Simulator or physical device.

No additional dependencies are required.

---

## 📚 Concepts Demonstrated

* Programmatic UIKit
* UITableViewDataSource
* UITableViewDelegate
* Custom UITableViewCell
* URLSession Networking
* JSON Parsing
* Auto Layout Constraints
* MVC Pattern
* Asynchronous Programming
* Main Thread UI Updates

---

## 👨‍💻 Author

**Sumedh Kulkarni**

Master's in Information Systems
Binghamton University

GitHub: https://github.com/yourusername

---

## ⭐ If you found this project useful

Feel free to star the repository and connect with me!
