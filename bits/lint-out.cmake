cmake_lint/test/expect_lint.cmake
=================================
cmake_lint/test/expect_lint.cmake:00: [C0301] Line too long (92/80)
cmake_lint/test/expect_lint.cmake:02: [C0303] Trailing whitespace
cmake_lint/test/expect_lint.cmake:04: [C0327] Wrong line ending (windows)
cmake_lint/test/expect_lint.cmake:08,00: [C0111] Missing docstring on function or macro declaration
cmake_lint/test/expect_lint.cmake:08,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:08,09: [C0103] Invalid function name "BAD_FUNCTION_NAME"
cmake_lint/test/expect_lint.cmake:13,00: [C0112] Empty docstring on function or macro declaration
cmake_lint/test/expect_lint.cmake:13,06: [C0103] Invalid function name "bad_macro_name"
cmake_lint/test/expect_lint.cmake:17,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:24,10: [C0103] Invalid loopvar name "LOOPVAR3"
cmake_lint/test/expect_lint.cmake:30,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:30,27: [E1120] Missing required positional argument
cmake_lint/test/expect_lint.cmake:30,33: [E1120] Missing required positional argument
cmake_lint/test/expect_lint.cmake:32,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:32,46: [E1122] Duplicate keyword argument VERSION
cmake_lint/test/expect_lint.cmake:34,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:34,19: [E1120] Missing required positional argument
cmake_lint/test/expect_lint.cmake:36,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:38,02: [C0114] Form descriminator hidden behind variable dereference
cmake_lint/test/expect_lint.cmake:42,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:43,02: [E1126] Invalid form descriminator
cmake_lint/test/expect_lint.cmake:47,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:47,19: [C0113] Missing COMMENT in statement which allows it
cmake_lint/test/expect_lint.cmake:47,19: [E1125] Missing required keyword argument COMMAND
cmake_lint/test/expect_lint.cmake:49,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:49,18: [C0113] Missing COMMAND in statement which allows it
cmake_lint/test/expect_lint.cmake:49,18: [C0113] Missing COMMENT in statement which allows it
cmake_lint/test/expect_lint.cmake:51,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:51,05: [E1120] Missing required positional argument
cmake_lint/test/expect_lint.cmake:53,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:54,05: [C0114] Form descriminator hidden behind variable dereference
cmake_lint/test/expect_lint.cmake:56,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:56,05: [E1126] Invalid form descriminator
cmake_lint/test/expect_lint.cmake:58,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:58,00: [E0103] break outside of loop
cmake_lint/test/expect_lint.cmake:58,00: [W0101] Unreachable code
cmake_lint/test/expect_lint.cmake:60,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:60,00: [E0103] continue outside of loop
cmake_lint/test/expect_lint.cmake:60,00: [W0101] Unreachable code
cmake_lint/test/expect_lint.cmake:64,02: [C0201] Consider replacing custom parser logic with cmake_parse_arguments
cmake_lint/test/expect_lint.cmake:75,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:75,18: [C0321] Multiple statements on a single line
cmake_lint/test/expect_lint.cmake:77,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:80,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:83,13: [E0109] Invalid argument name "arg-name" in function/macro definition
cmake_lint/test/expect_lint.cmake:88,17: [E0108] Duplicate argument name arg in function/macro definition
cmake_lint/test/expect_lint.cmake:93,17: [C0202] Argument name ARG differs from existing argument only in case
cmake_lint/test/expect_lint.cmake:97,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:97,00: [W0101] Unreachable code
cmake_lint/test/expect_lint.cmake:102,00: [R0911] Too many return statements 17/6
cmake_lint/test/expect_lint.cmake:102,00: [R0912] Too many branches 17/12
cmake_lint/test/expect_lint.cmake:102,00: [R0913] Too many named arguments 6/5
cmake_lint/test/expect_lint.cmake:102,00: [R0915] Too many statements 65/50
cmake_lint/test/expect_lint.cmake:134,04: [C0103] Invalid CACHE variable name "MyGlobalVar"
cmake_lint/test/expect_lint.cmake:137,04: [C0103] Invalid INTERNAL variable name "MY_INTERNAL_VAR"
cmake_lint/test/expect_lint.cmake:140,04: [C0103] Invalid directory variable name "_INVALID_PRIVATE_NAME"
cmake_lint/test/expect_lint.cmake:141,04: [C0103] Invalid directory variable name "invalid_public_name"
cmake_lint/test/expect_lint.cmake:143,06: [C0103] Invalid local variable name "INVALID_LOCAL_NAME"
cmake_lint/test/expect_lint.cmake:146,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:146,04: [W0105] Assignment to variable 'CMAKE_Cxx_STANDARD' which matches a built-in except for case
cmake_lint/test/expect_lint.cmake:148,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:148,12: [W0105] Assignment to variable 'CMAKE_Cxx_STANDARD' which matches a built-in except for case
cmake_lint/test/expect_lint.cmake:150,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:150,08: [W0105] Assignment to variable 'CMAKE_Cxx_STANDARD' which matches a built-in except for case
cmake_lint/test/expect_lint.cmake:152: [C0304] Final newline missing

Summary
=======
files scanned: 1
found lint:
  Convention: 43
       Error: 12
    Refactor: 4
     Warning: 6

