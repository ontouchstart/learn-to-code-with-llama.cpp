help:llama.cpp/build;make -C llama.cpp/build help
check:llama.cpp/build;make -C llama.cpp/build cmake_check_build_system
llama.cpp/build:llama.cpp;cd llama.cpp && cmake -B build
llama.cpp:;git clone --depth 1 https://github.com/ggml-org/llama.cpp.git
clean:;rm -rf llama.cpp
