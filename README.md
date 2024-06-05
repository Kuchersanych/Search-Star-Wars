# Проект сканера

Проект сканера документов "Scan My".

### Требования

Версия flutter >= 3.3.2

### Инициализация

При инициализации проекта нужно:

1. Найти по поиску flutter_template и в нужных местах заменить на название вашего проекта.
2. Проинициализировать FirebaseCrashlytics(найти можно через TODO(init-project)).

### Структура

- assets
    - fonts
    - icons_png
    - icons_svg
    - images
        - 2.0x
        - 3.0x
        - 4.0x
    - splash_screen
- lib
    - id
    - domain
        - config
            - environment
        - entity
        - repositories
        - services
    - generated
    - l10n
    - library
        - adaptive
        - db
        - flutter_storages
    - ui
        - app
        - common
        - navigation
        - pages
        - resources
        - theme
    - utils
        - extensions

#### assets

Содержит необходимые ресурсы(картинки, шрифты, иконки, splash_screen).

##### Иконки

##### Splash-screen

#### lib - кодовая часть проекта, в ней есть такие директории как:


- id - контейнеры внедрения зависимостей.
- domain - содержит:
    - config - конфигурация приложения.
        - environment - Конфигурация среды.
    - entity - бизнес модели данных.
    - repositories -
    - services - бизнес логика.
- generated - автоматически сгенерированные dart файлы локализации.
- l10n - arb файлы локализации.
- library
    - adaptive - библиотека адаптации размеров UI.
    - db - содержит DB, secure_storage, shared_preferences.
        - flutter_storages - реализация secure_storage, shared_preferences.
- ui
    - app - корневой виджет проекта.
    - common - переиспользуемые виджеты.
    - navigation - навигация приложения.
    - pages - экраны, содержит экраны:
        - dashboard_page - экран навигационного бара(навигация по вкладкам).
        - example
            - widgets - виджеты относящиеся к экрану.
            - pages - экраны, которые взаимодействуют только с экраном [page].
            - vm - WidgetModel.
            - [page] - экран (UI представление) текущей фичи.
    - resources - сожержит пути до assets(icons, images, fonts).
    - theme - сожержит набор файлов для реализации темы проекта.
- utils - утилиты
    - extensions - расширения


#### Темы

#### Локализация

Для внедрения лолкализации используется [плагин](https://plugins.jetbrains.com/plugin/13666-flutter-intl).

При неправильной генерации файлов (если генерит не null-safety):

```
flutter pub global deactivate intl_utils
flutter pub global activate intl_utils 2.6.1
flutter pub global run intl_utils:generate
```

### Аналитика
AppMetrica

##### Подключены:

### Архитектура
MVVM

### DI