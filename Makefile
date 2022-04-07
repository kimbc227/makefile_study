CC = gcc
TARGET = MyClient
SRCS = MySocket.c MyMutex.c MySemaphore.c MyThread.c MyClient.c 
OBJS = $(SRCS:%.c=%.o)

LIBS = -lpthread
 
.SUFFIXES : .c .o

all : $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(LIBS)

clean:
	rm -f $(OBJS) $(TARGET) 

depend:
	gccmakedep $(SRCS)

#MySocket.o : MySocket.c MySocket.h
#MyClient.o : MyClient.c MySocket.h
