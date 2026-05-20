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
ls:$(build);ls -l $(build)/*
$(build):$(src);cmake -B $(build) -DLLAMA_BUILD_EXAMPLES=ON -DCMAKE_BUILD_TYPE=Debug $(src)&&wc b/*/Makefile b/Makefile
patch:$(src); cd $(src) &&git checkout -- .&& patch < ../diff/CMakeLists.txt && patch < ../diff/tests/CMakeLists.txt
clean:$(src);rm -rf $(build)
$(src):;git clone --depth 1 https://github.com/ggml-org/llama.cpp.git&&ls $(src)&&make patch
