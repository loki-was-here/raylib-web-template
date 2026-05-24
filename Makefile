CC = emcc
SRC = main.c
OUT = out/index.html
EMSDK_PATH = ~/tooling/emsdk

CFLAGS = -Wall \
         -I./raylib/include \
         -DPLATFORM_WEB

LDFLAGS = -L./raylib/lib \
          -lraylib \
          -s USE_GLFW=3 \
          -s ASYNCIFY=1 \
          -s INITIAL_MEMORY=67108864 \
          --shell-file minshell.html

all: $(OUT)

$(OUT): $(SRC) | out
	@command -v emcc > /dev/null 2>&1 \
	|| { cd $(EMSDK_PATH) \
	     && ./emsdk activate latest > /dev/null \
	     && . ./emsdk_env.sh > /dev/null \
	     && cd - > /dev/null; } \
	&& $(CC) $(SRC) -o $(OUT) $(CFLAGS) $(LDFLAGS) \
	&& echo "Successfully compiled!"

out:
	mkdir -p out

clean:
	rm -f out/*
