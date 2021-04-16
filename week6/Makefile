CC=gcc
CFLAGS=-o
TARGETS=sudoku_validator
all: $(TARGETS)
.PHONY: all
%:
	$(CC) -g -o $@ $@.c -lpthread
       
clean:
	rm $(TARGETS)



/*
posiz 적용시킨 게 pthread.
join? 기다림

create: 인자 4개

총 27개 쓰레드 만들고
pthread+t 에서 성공적으로 만들어졌는지 확인