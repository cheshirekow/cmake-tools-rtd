cmake_lint/test/expect_lint.cmake
=================================
cmake_lint/test/expect_lint.cmake:01: [C0301] Line too long (92/80)
cmake_lint/test/expect_lint.cmake:03: [C0303] Trailing whitespace
cmake_lint/test/expect_lint.cmake:05: [C0327] Wrong line ending (windows)
cmake_lint/test/expect_lint.cmake:08,00: [C0111] Missing docstring on function or macro declaration
cmake_lint/test/expect_lint.cmake:08,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:08,09: [C0103] Invalid function name "BAD_FUNCTION_NAME" doesn't match `[0-9a-z_]+`
cmake_lint/test/expect_lint.cmake:13,00: [C0112] Empty docstring on function or macro declaration
cmake_lint/test/expect_lint.cmake:13,06: [C0103] Invalid macro name "bad_macro_name" doesn't match `[0-9A-Z_]+`
cmake_lint/test/expect_lint.cmake:24,10: [C0103] Invalid argument name "LOOPVAR3" doesn't match `[a-z][a-z0-9_]+`
cmake_lint/test/expect_lint.cmake:30,27: [E1120] Missing required positional argument
cmake_lint/test/expect_lint.cmake:30,33: [E1120] Missing required positional argument
cmake_lint/test/expect_lint.cmake:32,46: [E1122] Duplicate keyword argument VERSION
cmake_lint/test/expect_lint.cmake:34,19: [E1120] Missing required positional argument
cmake_lint/test/expect_lint.cmake:38,02: [C0114] Form descriminator hidden behind variable dereference
cmake_lint/test/expect_lint.cmake:43,02: [E1126] Invalid form descriminator
cmake_lint/test/expect_lint.cmake:47,19: [E1125] Missing required keyword argument COMMAND
cmake_lint/test/expect_lint.cmake:49,05: [E1120] Missing required positional argument
cmake_lint/test/expect_lint.cmake:52,05: [C0114] Form descriminator hidden behind variable dereference
cmake_lint/test/expect_lint.cmake:54,05: [E1126] Invalid form descriminator
cmake_lint/test/expect_lint.cmake:56,00: [E0103] break outside of loop
cmake_lint/test/expect_lint.cmake:56,00: [W0101] Unreachable code
cmake_lint/test/expect_lint.cmake:58,00: [E0103] continue outside of loop
cmake_lint/test/expect_lint.cmake:58,00: [W0101] Unreachable code
cmake_lint/test/expect_lint.cmake:62,02: [C0201] Consider replacing custom parser logic with cmake_parse_arguments
cmake_lint/test/expect_lint.cmake:73,18: [C0321] Multiple statements on a single line
cmake_lint/test/expect_lint.cmake:78,00: [C0305] too many newlines between statements
cmake_lint/test/expect_lint.cmake:81,13: [E0109] Invalid argument name "arg-name" in function/macro definition
cmake_lint/test/expect_lint.cmake:86,17: [E0108] Duplicate argument name arg in function/macro definition
cmake_lint/test/expect_lint.cmake:91,17: [C0202] Argument name ARG differs from existing argument only in case
cmake_lint/test/expect_lint.cmake:95,00: [W0101] Unreachable code
cmake_lint/test/expect_lint.cmake:100,00: [R0913] Too many named arguments 6/5
cmake_lint/test/expect_lint.cmake:101: [R0911] Too many return statements 17/6
cmake_lint/test/expect_lint.cmake:101: [R0912] Too many branches 17/12
cmake_lint/test/expect_lint.cmake:101: [R0915] Too many statements 65/50
cmake_lint/test/expect_lint.cmake:132,04: [C0103] Invalid CACHE variable name "MyGlobalVar" doesn't match `[A-Z][0-9A-Z_]+`
cmake_lint/test/expect_lint.cmake:135,04: [C0103] Invalid INTERNAL variable name "MY_INTERNAL_VAR" doesn't match `_[A-Z][0-9A-Z_]+`
cmake_lint/test/expect_lint.cmake:138,04: [C0103] Invalid directory variable name "_INVALID_PRIVATE_NAME" doesn't match `[A-Z][0-9A-Z_]+|_[0-9a-z_]+`
cmake_lint/test/expect_lint.cmake:139,04: [C0103] Invalid directory variable name "invalid_public_name" doesn't match `[A-Z][0-9A-Z_]+|_[0-9a-z_]+`
cmake_lint/test/expect_lint.cmake:141,06: [C0103] Invalid local variable name "INVALID_LOCAL_NAME" doesn't match `[a-z][a-z0-9_]+`
cmake_lint/test/expect_lint.cmake:144,04: [W0105] Assignment to variable 'CMAKE_Cxx_STANDARD' which matches a built-in except for case
cmake_lint/test/expect_lint.cmake:146,12: [W0105] Assignment to variable 'CMAKE_Cxx_STANDARD' which matches a built-in except for case
cmake_lint/test/expect_lint.cmake:148,08: [W0105] Reference to variable 'CMAKE_Cxx_STANDARD' which matches a built-in except for case
cmake_lint/test/expect_lint.cmake:150,08: [W0106] String looks like a variable reference missing an open tag '$CMAKE_INSTALL_PREFIX'
cmake_lint/test/expect_lint.cmake:151,08: [W0106] String looks like a variable reference missing an open tag '{CMAKE_INSTALL_PREFIX'
cmake_lint/test/expect_lint.cmake:152,08: [W0106] String looks like a variable reference missing an open tag '{CMAKE_INSTALL_PREFIX'
cmake_lint/test/expect_lint.cmake:154: [C0304] Final newline missing

Summary
=======
files scanned: 1
found lint:
  Convention: 21
       Error: 12
    Refactor: 4
     Warning: 9

