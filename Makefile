COMPILER=gcc
FLAGS=-Iinclude `gnustep-config --objc-flags` -lgnustep-base -lobjc
SRC=src
OUT=tree

all:
	@$(COMPILER) -o $(OUT) $(SRC)/*.m $(FLAGS)
run:
	@./$(OUT)
