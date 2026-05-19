src=llama.cpp
build=$(src)/build
make=make -C $(build)
default:;cat -n Makefile
help:$(build);$(make) help
all:$(build);$(make) all&&make ls
build-tests:$(build);make -C llama.cpp/build/tests&&make ls
test:build-tests;-$(make) llama-eval-callback test
test/alloc:$(build);$(make) test-alloc&&$(build)/bin/test-alloc
llama-common:$(build);$(make) llama-common
llama-common-base:$(build);$(make) llama-common-base
llama:$(build);$(make) llama&&make ls
ggml-metal:$(build);$(make)ggml-metal&&make ls
ggml-base:$(build);$(make) ggml-metal&&make ls
check:$(build);$(make) cmake_check_build_system
ls:$(build);ls -l $(build)/bin
$(build):$(src);cd $(src) && cmake -B build -D LLAMA_BUILD_EXAMPLES=ON
clean:$(src);rm -rf $(build)
$(src):;git clone --depth 1 https://github.com/ggml-org/llama.cpp.git&&ls $(src)
