# ShopHub - Flutter E-Commerce App

ShopHub is a modern, clean, and responsive **Flutter e-commerce application** built with **MVVM architecture**. The app demonstrates a functional shopping cart, product browsing, category filtering, and dynamic UI updates using **Provider** for state management.

---

## 🛠 Features

- Browse products by category or search by name.
- Add products to cart and update quantity.
- Remove products from cart.
- Cart summary with subtotal, shipping, and total calculation.
- MVVM architecture for scalable and maintainable code.
- Responsive UI compatible with mobile devices.

---

## 📂 Project Structure

```
lib/
├── core/
│   ├── provider/           # Models and state management (ProductsProvider, Product model)
│   └── app_theme.dart      # App color theme
├── features/
│   ├── cart/
│   │   ├── logic/          # Price calculations
│   │   └── presentation/   # UI widgets & screens (CartFullScreen, CartEmptyScreen)
│   └── home/
│       ├── presentation/   # Home screen UI
│       └── logic/          # Home screen logic
```

---

## 👥 Team Contributions

| Team Member      | Contribution                                                                 |
|-----------------|----------------------------------------------------------------------------|
| Aya Mohamed      | Provider & Cart Full Screen logic, Product models, MVVM architecture       |
| Menna Elbanna    | Cart Empty Screen UI, Drawer                                               |
| Mariel & Robert  | Cart Full Screen UI                                                         |
| Jana Hagras      | Home Screen UI                                                              |
| Fatma Abdelsalam             | Home Screen Logic                                                           |

---

## 🚀  Demo Of Our Application


**Demo:** [Watch Demo](https://drive.google.com/file/d/1QdGvvTdk0mGdzdIsoXgHTrQKNfumFVra/view?usp=sharing)

---

## 💻 Getting Started

1. Clone the repository:

```bash
git clone https://github.com/your-username/shophub.git
```

2. Navigate to the project directory:

```bash
cd shophub
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```



---

## ⚡ Architecture

The app follows **MVVM (Model-View-ViewModel)** architecture:

- **Model:** Product model, cart item data
- **View:** Screens and UI widgets
- **ViewModel / Provider:** Handles business logic, state management, and communicates between View and Model

---
