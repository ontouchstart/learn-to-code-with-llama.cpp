src=llama.cpp
build=b
make=make -C $(build)
default:;cat -n Makefile
help:$(build);$(make) help
all:$(build);$(make) all&&make ls
build/common:$(build);$(make) clean&&make -C $(build)/common&&make ls
build/examples:$(build);$(make) clean&&make -C $(build)/examples&&make ls
build/ggml:$(build);$(make) clean&&make -C $(build)/ggml&&make ls
build/pocs:$(build);$(make) clean&&make -C $(build)/pocs&&make ls
build/src::$(build);$(make) clean&&make -C $(build)/src&&make ls
build/tests:$(build);$(make) clean&&make -C $(build)/tests&&make -C $(build)/tests test&&make ls
build/tools:$(build);$(make) clean&&make -C $(build)/tools&&make ls
llama-common:$(build);$(make) llama-common
llama-common-base:$(build);$(make) llama-common-base
llama:$(build);$(make) llama&&make ls
ggml-metal:$(build);$(make)ggml-metal&&make ls
ggml-base:$(build);$(make) ggml-metal&&make ls
check:$(build);$(make) cmake_check_build_system
ls:$(build);ls -l $(build)/bin
$(build):$(src);cd $(src) && cmake -B ../$(build) -D LLAMA_BUILD_EXAMPLES=ON
patch-tests:$(src); cd $(src) && patch < ../tests.diff
clean:$(src);rm -rf $(build)
$(src):;git clone --depth 1 https://github.com/ggml-org/llama.cpp.git&&ls $(src)&&make patch-tests
