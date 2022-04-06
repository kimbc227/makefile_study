CC = gcc
OBJS = MySocket.o MyClient.o
TARGET = MyClient
 
.SUFFIXES : .c .o

all : $(TARGET)

$(TARGET) : $(OBJS)
		  $(CC) -o $(TARGET) $(OBJS)

clean:
		rm -f $(OBJS) $(TARGET)

MySocket.o : MySocket.c MySocket.h
MyClient.o : MyClient.c MySocket.h
# DO NOT DELETE
MySocket.o: MySocket.c MySocket.h
MyClient.o: MyClient.c MySocket.h
