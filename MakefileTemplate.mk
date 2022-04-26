# Makefile template

include $(PROJ_ROOT)/IncludePre.mk

# 서브 디렉토리 목록입니다. 
SUB_DIRS = # 

# 링킹할 때 사용되는 링커 이름입니다.
LIB_NAME = # Example

# 공유 라이브러리 여부를 나타냅니다. (IS_SHARED = 1 이면 공유 라이브러리)
IS_SHARED = # 1
# 공유 라이브러리 버전입니다. \
	soname은 lib$(LIB_NAME).so.$(MAJOR_VERSION) 으로 지정됩니다. \
	실제이름은 lib$(LIB_NAME).so.$(MAJOR_VERSION).$(MINOR_VERSION) 으로 지정됩니다.
MAJOR_VERSION = # 1
MINOR_VERSION = # 0

# 라이브러리 소스 파일들의 목록입니다.
LIB_SRCS = # LibSource1.c LibSource2.c ...

# 라이브러리를 사용하는 실행 파일들의 소스 파일 목록입니다.
TARGET_SRCS = # TargetBin1.c TargetBin2.c ...

# 의존성 규칙에 포함시킬 라이브러리 목록입니다.
DEPEND_LIBS = # -lLibrary1 -lLibrary2

# 외부 시스템 라이브러리 목록입니다.
LIBS += # -lExtLibrary1 -lExtLibrary2

include $(PROJ_ROOT)/IncludePost.mk