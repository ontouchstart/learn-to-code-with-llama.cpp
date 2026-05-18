src=llama.cpp
build=$(src)/build
make=make -C $(build)
default:;cat -n Makefile
help:$(build);$(make) help
all:$(build);$(make) all&&make ls
test:$(build);$(make) test
llama:$(build);$(make) llama&&make ls
ggml-metal:$(build);$(make)ggml-metal&&make ls
ggml-base:$(build);$(make) ggml-metal&&make ls
check:$(build);$(make) cmake_check_build_system
ls:$(build);ls -l $(build)/bin
clean:$(build);$(make) clean&&make ls
$(build):$(src);cd $(src) && cmake -B build
$(src):;git clone --depth 1 https://github.com/ggml-org/llama.cpp.git&&ls $(src)
