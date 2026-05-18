help:llama.cpp/build;make -C llama.cpp/build help
ggml-metal:llama.cpp/build;make -C llama.cpp/build ggml-metal
check:llama.cpp/build;make -C llama.cpp/build cmake_check_build_system
ls:llama.cpp/build;ls -l llama.cpp/build/bin
clean-build:llama.cpp/build;make -C llama.cpp/build clean&&make ls
llama.cpp/build:llama.cpp;cd llama.cpp && cmake -B build
llama.cpp:;git clone --depth 1 https://github.com/ggml-org/llama.cpp.git
clean:;rm -rf llama.cpp
