cmakelang/lint/test/expect_lint.cmake
=====================================
cmakelang/lint/test/expect_lint.cmake:01: [C0301] Line too long (92/80)
cmakelang/lint/test/expect_lint.cmake:03: [C0303] Trailing whitespace
cmakelang/lint/test/expect_lint.cmake:05: [C0327] Wrong line ending (windows)
cmakelang/lint/test/expect_lint.cmake:08,00: [C0111] Missing docstring on function or macro declaration
cmakelang/lint/test/expect_lint.cmake:08,00: [C0305] too many newlines between statements
cmakelang/lint/test/expect_lint.cmake:08,09: [C0103] Invalid function name "BAD_FUNCTION_NAME" doesn't match `[0-9a-z_]+`
cmakelang/lint/test/expect_lint.cmake:13,00: [C0112] Empty docstring on function or macro declaration
cmakelang/lint/test/expect_lint.cmake:13,06: [C0103] Invalid macro name "bad_macro_name" doesn't match `[0-9A-Z_]+`
cmakelang/lint/test/expect_lint.cmake:20,12: [C0103] Invalid argument name "LOOPVAR2" doesn't match `[a-z][a-z0-9_]+`
cmakelang/lint/test/expect_lint.cmake:24,10: [C0103] Invalid argument name "LOOPVAR3" doesn't match `[a-z][a-z0-9_]+`
cmakelang/lint/test/expect_lint.cmake:30,00: [C0306] Tab-policy violation. Found tab but should be space
cmakelang/lint/test/expect_lint.cmake:34,01: [C0307] Bad indentation:
 message
  ^----BodyNode: 1:0->IfBlockNode: 33:0->BodyNode: 33:8->StatementNode: 34:1->FunctionNameNode: 34:1

cmakelang/lint/test/expect_lint.cmake:38,03: [C0307] Bad indentation:
   message
  ^----BodyNode: 1:0->IfBlockNode: 37:0->BodyNode: 37:8->StatementNode: 38:3->FunctionNameNode: 38:3

cmakelang/lint/test/expect_lint.cmake:43,04: [C0103] Invalid CACHE variable name "gtest_force_shared_crt" doesn't match `[A-Z][0-9A-Z_]+`
cmakelang/lint/test/expect_lint.cmake:46,27: [E1120] Missing required positional argument
cmakelang/lint/test/expect_lint.cmake:46,33: [E1120] Missing required positional argument
cmakelang/lint/test/expect_lint.cmake:48,46: [E1122] Duplicate keyword argument VERSION
cmakelang/lint/test/expect_lint.cmake:59,00: [C0305] too many newlines between statements
cmakelang/lint/test/expect_lint.cmake:59,19: [E1120] Missing required positional argument
cmakelang/lint/test/expect_lint.cmake:63,02: [C0114] Form descriminator hidden behind variable dereference
cmakelang/lint/test/expect_lint.cmake:68,02: [E1126] Invalid form descriminator
cmakelang/lint/test/expect_lint.cmake:72,19: [E1125] Missing required keyword argument COMMAND
cmakelang/lint/test/expect_lint.cmake:74,05: [E1120] Missing required positional argument
cmakelang/lint/test/expect_lint.cmake:77,05: [C0114] Form descriminator hidden behind variable dereference
cmakelang/lint/test/expect_lint.cmake:79,05: [E1126] Invalid form descriminator
cmakelang/lint/test/expect_lint.cmake:81,00: [E0103] break outside of loop
cmakelang/lint/test/expect_lint.cmake:81,00: [W0101] Unreachable code
cmakelang/lint/test/expect_lint.cmake:83,00: [E0103] continue outside of loop
cmakelang/lint/test/expect_lint.cmake:83,00: [W0101] Unreachable code
cmakelang/lint/test/expect_lint.cmake:87,02: [C0201] Consider replacing custom parser logic with cmake_parse_arguments
cmakelang/lint/test/expect_lint.cmake:98,18: [C0321] Multiple statements on a single line
cmakelang/lint/test/expect_lint.cmake:103,00: [C0305] too many newlines between statements
cmakelang/lint/test/expect_lint.cmake:106,13: [E0109] Invalid argument name "arg-name" in function/macro definition
cmakelang/lint/test/expect_lint.cmake:111,17: [E0108] Duplicate argument name arg in function/macro definition
cmakelang/lint/test/expect_lint.cmake:116,17: [C0202] Argument name ARG differs from existing argument only in case
cmakelang/lint/test/expect_lint.cmake:120,00: [W0101] Unreachable code
cmakelang/lint/test/expect_lint.cmake:125,00: [R0913] Too many named arguments 6/5
cmakelang/lint/test/expect_lint.cmake:126: [R0911] Too many return statements 17/6
cmakelang/lint/test/expect_lint.cmake:126: [R0912] Too many branches 17/12
cmakelang/lint/test/expect_lint.cmake:126: [R0915] Too many statements 65/50
cmakelang/lint/test/expect_lint.cmake:157,04: [C0103] Invalid CACHE variable name "MyGlobalVar" doesn't match `[A-Z][0-9A-Z_]+`
cmakelang/lint/test/expect_lint.cmake:160,04: [C0103] Invalid INTERNAL variable name "MY_INTERNAL_VAR" doesn't match `_[A-Z][0-9A-Z_]+`
cmakelang/lint/test/expect_lint.cmake:163,04: [C0103] Invalid directory variable name "_INVALID_PRIVATE_NAME" doesn't match `[A-Z][0-9A-Z_]+|_[0-9a-z_]+`
cmakelang/lint/test/expect_lint.cmake:164,04: [C0103] Invalid directory variable name "invalid_public_name" doesn't match `[A-Z][0-9A-Z_]+|_[0-9a-z_]+`
cmakelang/lint/test/expect_lint.cmake:166,06: [C0103] Invalid local variable name "INVALID_LOCAL_NAME" doesn't match `[a-z][a-z0-9_]+`
cmakelang/lint/test/expect_lint.cmake:169,04: [W0105] Assignment to variable 'CMAKE_Cxx_STANDARD' which matches a built-in except for case
cmakelang/lint/test/expect_lint.cmake:171,12: [W0105] Assignment to variable 'CMAKE_Cxx_STANDARD' which matches a built-in except for case
cmakelang/lint/test/expect_lint.cmake:173,08: [W0105] Reference to variable 'CMAKE_Cxx_STANDARD' which matches a built-in except for case
cmakelang/lint/test/expect_lint.cmake:175,08: [W0106] String looks like a variable reference missing an open tag '$CMAKE_INSTALL_PREFIX'
cmakelang/lint/test/expect_lint.cmake:176,08: [W0106] String looks like a variable reference missing an open tag '{CMAKE_INSTALL_PREFIX'
cmakelang/lint/test/expect_lint.cmake:177,08: [W0106] String looks like a variable reference missing an open tag '{CMAKE_INSTALL_PREFIX'
cmakelang/lint/test/expect_lint.cmake:179: [C0304] Final newline missing

Summary
=======
files scanned: 1
found lint:
  Convention: 27
       Error: 12
    Refactor: 4
     Warning: 9

