TARGET = bin/embase
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

run: clean default
	./$(TARGET) -f ./mynewdb.db -n
	./$(TARGET) -f ./mynewdb.db -a "Timmy H., 123 Sheshire Ln., 120"
	./$(TARGET) -f ./mynewdb.db -l
	./$(TARGET) -f ./mynewdb.db -u "Timmy H., 150"
	./$(TARGET) -f ./mynewdb.db -l
	./$(TARGET) -f ./mynewdb.db -a "Heino H., 123 Dutch Ln., 120"
	./$(TARGET) -f ./mynewdb.db -l
	./$(TARGET) -f ./mynewdb.db -r "Heino H."
	./$(TARGET) -f ./mynewdb.db -l

default: $(TARGET)

clean:
	rm -f obj/*.o
	rm -f bin/*
	rm -f *.db

$(TARGET): $(OBJ)
	gcc -o $@ $?

obj/%.o : src/%.c
	gcc -c $< -o $@ -Iinclude


