DEPEND_FILE = depend_file

CC = gcc
AR = ar
RANLIB = ranlib

ifeq ($(RELEASE), 1)
DBG_FLAGS = -O2 -DNDEBUG
else
DBG_FLAGS = -g -O0 -DDEBUG
endif

LIB_NAME = MyProtocol
LIB_FULL_NAME = lib$(LIB_NAME).a

LIB_SRCS = MySocket.c MyMutex.c MySemaphore.c MyThread.c MyProtocol.c
LIB_OBJS = $(LIB_SRCS:%.c=%.o)

LIBS = -lpthread
LIBS += -l$(LIB_NAME)
LIB_DIRS = -L.

TARGET_SRCS = MyClient.c TestConnection.c TestDataChange.c TestDrinking.c
TARGET_OBJS = $(TARGET_SRCS:%.c=%.o)
TARGET_NAMES = $(TARGET_SRCS:%.c=%)

.SUFFIXES : .c .o

all : $(LIB_FULL_NAME) $(TARGET_NAMES)

$(LIB_FULL_NAME) : $(LIB_OBJS)
				 $(AR) rcv $@ $(LIB_OBJS)
				 $(RANLIB) $@

.c.o:
		@echo "================================================"
		@echo "= Compiling $@ "
		@echo "================================================"
		$(CC) $(CFLAGS) $(DBG_FLAGS) -c $< -o $@

.SECONDEXPANSION:
$(TARGET_NAMES): $$@.o
				 $(CC) -o $@ $< $(LIB_DIRS) $(LIBS)

depend :
	   $(CC) -MM $(LIB_SRCS) $(TARGET_SRCS) > $(DEPEND_FILE)

clean :
	  rm -f $(LIB_FULL_NAME) $(LIB_OBJS) $(TARGET_NAMES) $(TARGET_OBJS)

ifneq ($(MAKECMDGOALS), clean)
ifneq ($(MAKECMDGOALS), depend)
ifneq ($(strip $(LIB_SRCS) $(TARGET_SRCS)),)
-include $(DEPEND_FILE)
endif
endif
endif
