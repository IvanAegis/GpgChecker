# This Makefile will build the MinGW Win32 application.

HEADERS = include/resource.h
OBJS =	obj/resource.o obj/GpgChecker.o
INCLUDE_DIRS = -I.\include

WARNS = -Wall -Werror -Wextra

CC = gcc
LDFLAGS = -s -lcomctl32 -lodbc32 -lcomdlg32 -Wl,--subsystem,windows
RC = windres

all: GpgChecker.exe

GpgChecker.exe: ${OBJS}
	${CC} -o "$@" ${OBJS} ${LDFLAGS}
	
obj:
	mkdir obj

clean:
	del obj\*.o "GpgChecker.exe"

obj/%.o: src/%.c ${HEADERS} obj
	${CC} ${CFLAGS} ${INCLUDE_DIRS} -c $< -o $@

obj/resource.o: res/GpgChecker.rc res/GpgChecker.manifest res/Application.ico include/resource.h
	${RC} -I.\include -I.\res -i $< -o $@