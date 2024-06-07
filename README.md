# Проект сканера

Проект тестового задания "Search Star Warriors".

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
        - 2.0x
        - 3.0x
        - 4.0x
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
        - status_bar_manager
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
    - entity - бизнес модели данных.
    - repositories -репозитории.
    - services - бизнес логика.
- generated - автоматически сгенерированные dart файлы локализации.
- l10n - arb файлы локализации.
- library
    - adaptive - библиотека адаптации размеров UI.
    - db - содержит DB.
        - status_bar_manager - менеджер управления состоянием нативных элементов.
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

### Архитектура
MVVM

### DI
DIContainer