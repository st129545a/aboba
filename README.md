# Домашние задания по C++

[![C++ Homework CI](https://github.com/st129545a/aboba/actions/workflows/ci.yml/badge.svg)](https://github.com/ВАШ_ЛОГИН/ВАШ_РЕПОЗИТОРИЙ/actions/workflows/ci.yml)
[![Лицензия MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![C++ Стандарт](https://img.shields.io/badge/C%2B%2B-11-blue.svg)](https://en.cppreference.com/w/cpp/11)
[![clang-format](https://img.shields.io/badge/code%20style-clang--format-lightgrey.svg)](https://clang.llvm.org/docs/ClangFormat.html)
[![Sanitizers](https://img.shields.io/badge/sanitizers-ASan%2FUBSan-green.svg)](https://github.com/google/sanitizers)


### Анализаторы кода, используемые в проекте:

| Анализатор | Тип | Что проверяет |
|------------|-----|---------------|
| **GitHub Actions CI** | Непрерывная интеграция | Сборка, тесты, запуск |
| **clang-format** | Форматирование кода | Стиль кодирования, отступы |
| **cppcheck** | Статический анализ | Ошибки, утечки памяти, UB |
| **AddressSanitizer** | Динамический анализ | Утечки памяти, buffer overflow |
| **UndefinedBehaviorSanitizer** | Динамический анализ | Неопределённое поведение |


##  Описание проекта

Репозиторий содержит домашние задания по программированию на C++. Каждая домашняя работа находится в отдельной директории (`hw1/`, `hw2/`, ...). Проект использует современные практики разработки: непрерывную интеграцию (CI), статический анализ кода, санитайзеры для обнаружения ошибок.


##  Пример использования

### Сборка и запуск конкретной домашней работы

```bash
# Перейти в папку с домашней работой
cd hw1

# Собрать программу
make

# Запустить программу
./main
