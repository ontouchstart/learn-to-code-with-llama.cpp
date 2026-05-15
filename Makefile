test:llama.cpp/build/bin;make -C llama.cpp/build test
llama.cpp/build/bin:llama.cpp/build;make -C llama.cpp/build
llama.cpp/build:llama.cpp;cd llama.cpp && cmake -B build
llama.cpp:;git clone https://github.com/ggml-org/llama.cpp.git
clean:;rm -rf llama.cpp
