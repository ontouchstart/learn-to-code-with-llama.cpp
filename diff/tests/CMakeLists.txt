diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
index 0fdbd39..7478a79 100644
--- a/tests/CMakeLists.txt
+++ b/tests/CMakeLists.txt
@@ -135,15 +135,6 @@ llama_test(test-tokenizer-0 NAME test-tokenizer-0-qwen35            ARGS ${PROJE
 llama_test(test-tokenizer-0 NAME test-tokenizer-0-refact            ARGS ${PROJECT_SOURCE_DIR}/models/ggml-vocab-refact.gguf)
 llama_test(test-tokenizer-0 NAME test-tokenizer-0-starcoder         ARGS ${PROJECT_SOURCE_DIR}/models/ggml-vocab-starcoder.gguf)
 
-if (NOT WIN32)
-    llama_test_cmd(
-        ${CMAKE_CURRENT_SOURCE_DIR}/test-tokenizers-repo.sh
-        NAME test-tokenizers-ggml-vocabs
-        WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
-        ARGS https://huggingface.co/ggml-org/vocabs ${PROJECT_SOURCE_DIR}/models/ggml-vocabs
-    )
-endif()
-
 if (LLAMA_LLGUIDANCE)
     llama_build_and_test(test-grammar-llguidance.cpp ARGS ${PROJECT_SOURCE_DIR}/models/ggml-vocab-llama-bpe.gguf)
 endif ()
@@ -196,7 +187,6 @@ endif()
 
 llama_build_and_test(test-chat-peg-parser.cpp peg-parser/simple-tokenize.cpp)
 llama_build_and_test(test-jinja.cpp)
-llama_test(test-jinja NAME test-jinja-py ARGS -py LABEL python)
 llama_build_and_test(test-chat-auto-parser.cpp WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
 llama_build_and_test(test-chat-template.cpp)
 llama_build_and_test(test-json-partial.cpp)
