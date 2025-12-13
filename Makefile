# Универсальный Makefile для C++ домашних работ
# Автоматически находит все .cpp файлы в подпапках

# Компилятор
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -Wpedantic

# Поиск всех папок с домашками (hw1, hw2, ...)
HOMEWORK_DIRS = $(wildcard hw*)

# Цель по умолчанию - показать помощь
.PHONY: help all clean test

help:
	@echo "=== Доступные команды ==="
	@echo "make all     - Собрать все домашние работы"
	@echo "make hw1     - Собрать только hw1"
	@echo "make clean   - Удалить все скомпилированные файлы"
	@echo "make test    - Запустить все программы"
	@echo "make list    - Показать все найденные домашние работы"
	@echo ""
	@echo "Найдены домашние работы: $(HOMEWORK_DIRS)"

# Показать все домашние работы
list:
	@echo "Найдены домашние работы:"
	@for dir in $(HOMEWORK_DIRS); do \
		echo "  $$dir"; \
	done

# Собрать все домашние работы
all: $(HOMEWORK_DIRS)

# Правило для каждой домашней работы
$(HOMEWORK_DIRS):
	@echo "=== Сборка $$@ ==="
	@if [ -f $$@/Makefile ]; then \
		$(MAKE) -C $$@; \
	elif [ -f $$@/main.cpp ]; then \
		$(CXX) $(CXXFLAGS) -o $$@/main $$@/main.cpp && echo "✓ $$@/main создан"; \
	else \
		echo "✗ В $$@ нет main.cpp или Makefile"; \
	fi

# Запуск всех программ
test: all
	@echo "=== Запуск программ ==="
	@for dir in $(HOMEWORK_DIRS); do \
		if [ -f $$dir/main ] && [ -x $$dir/main ]; then \
			echo "--- Запуск $$dir/main ---"; \
			cd $$dir && ./main && cd ..; \
			echo ""; \
		fi; \
	done

# Очистка
clean:
	@echo "Очистка..."
	@for dir in $(HOMEWORK_DIRS); do \
		if [ -f $$dir/main ]; then \
			rm -f $$dir/main; \
			echo "✓ Удален $$dir/main"; \
		fi; \
		if [ -f $$dir/Makefile ]; then \
			$(MAKE) -C $$dir clean; \
		fi; \
	done
	@find . -name "*.o" -delete
	@find . -name "*.out" -delete
	@echo "Готово!"
