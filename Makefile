CC = gcc
TARGET = MyClient
SRCS = MySocket.c MyClient.c
OBJS = $(SRCS:%.c=%.o)
 
.SUFFIXES : .c .o

all : $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) -o $(TARGET) $(OBJS)

clean:
	rm -f $(OBJS) $(TARGET)

depend:
	gccmakedep $(SRCS)

MySocket.o : MySocket.c MySocket.h
MyClient.o : MyClient.c MySocket.h
# DO NOT DELETE
MySocket.o: MySocket.c /usr/include/stdc-predef.h MySocket.h
MyClient.o: MyClient.c /usr/include/stdc-predef.h MySocket.h
