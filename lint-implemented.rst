
.. _lint-checks:

===================
Lint Code Reference
===================

.. _C0102:

-----
C0102
-----

message
-------

.. code:: 

    Black listed name "{:s}"


description
-----------

Used when the name is listed in the "bad-names" black list.

This message belongs to the basic checker.


explanation
-----------

cmake-lint can be customized to help enforce coding guidelines that discourage
or forbid use of certain names for variables, functions, etc.. These names are
specified with the bad-names option. This message is raised whenever a name is
in the list of names defined with the bad-names option.


.. _C0103:

-----
C0103
-----

message
-------

.. code:: 

    Invalid {:s} name "{:s}" doesn't match `{:s}`


description
-----------

Used when a name doesn't doesn't fit the naming convention associated to its
type (function, macro, variable, ...).

This message belongs to the basic checker.


explanation
-----------

The naming convention is defined with a regular expression, and the naming
convention is satisfied if the name matches the regular expression.


.. _C0111:

-----
C0111
-----

message
-------

.. code:: 

    Missing docstring on function or macro declaration


description
-----------

Used when a function or macro is defined without a documentation comment
immediately preceeding it.

This message belongs to the basic checker.


explanation
-----------

So, you've written a some fancy function that makes it "easier" to declare build
steps. Congratulations. You probably shouldn't have, but thats OK. Now that you
did, how should people use it? What arguments does it take? What are the
semantics of those arguements? You should include documentation in a comment
block prior to the function declaration with this information.


.. _C0112:

-----
C0112
-----

message
-------

.. code:: 

    Empty docstring on function or macro declaration


description
-----------

Used when a function or macro is preceeded by an empty comment string, rather
that one with useful documentation.

This message belongs to the basic checker.


explanation
-----------

Ok so you saw C0111 and figured you'd be clever right? Sorry, no dice. Please
include some useful documentation so that code readers know what your
function/macro does and how to use it.


.. _C0113:

-----
C0113
-----

message
-------

.. code:: 

    Missing {:s} in statement which allows it


.. _C0114:

-----
C0114
-----

message
-------

.. code:: 

    Form descriminator hidden behind variable dereference


description
-----------

Used when a keyword used to descriminate betwen different forms of a command is
hidden behind a variable dereference.

This message is implemented by individual command checkers.


explanation
-----------

Some cmake commands have very different behavior depending on the presence of
a particular keyword (see e.g. the `file` command). And because cmake is a
macro languge that keyword can actually be held inside a variable. Thus the
keyword might not actually be visible to cmake-lint (or humans). In general
there is no reason to do this and it really hurts readability since different
descriminator keywords yield essentially different commands.


.. _C0201:

-----
C0201
-----

message
-------

.. code:: 

    Consider replacing custom parser logic with cmake_parse_arguments


description
-----------

Used when custom parse logic is detected.


.. _C0202:

-----
C0202
-----

message
-------

.. code:: 

    Argument name {:s} differs from existing argument only in case


.. _C0301:

-----
C0301
-----

message
-------

.. code:: 

    Line too long ({:d}/{:d})


description
-----------

Used when a line is longer than the limit specified in the line-length
option.


explanation
-----------

It is a good idea to keep each line within a maximum length to keep it from
wrapping past the edge of an editing window. This improves readability and
tempers other developers' irritability!

The default value of the line-length option is 80, the customary width of a
terminal window.

Note that the line length and the limit are counted in characters, not in Bytes
needed to represent these characters.


.. _C0303:

-----
C0303
-----

message
-------

.. code:: 

    Trailing whitespace


description
-----------

Used when a line has one or more whitespace characters directly before the line
end character(s).

This message belongs to the basic checker.


explanation
-----------

Such trailing whitespace is visually indistinguishable and some editors will
trim them.


.. _C0304:

-----
C0304
-----

message
-------

.. code:: 

    Final newline missing


description
-----------

Used when a listfile has no line end character(s) on its last line.

This message belongs to the basic checker.


explanation
-----------

While cmake itself does not require line end character(s) on the last line,
is simply good practice to have it.


.. _C0305:

-----
C0305
-----

message
-------

.. code:: 

    {:s} newlines between statements


.. _C0306:

-----
C0306
-----

message
-------

.. code:: 

    Tab-policy violation. Found {:s} but should be {:s}


.. _C0307:

-----
C0307
-----

message
-------

.. code:: 

    Bad indentation:
    {:s}{:s}
    {:s}^----{}



.. _C0321:

-----
C0321
-----

message
-------

.. code:: 

    Multiple statements on a single line


.. _C0327:

-----
C0327
-----

message
-------

.. code:: 

    Wrong line ending ({:s})


description
-----------

Used when a line ends with the wrong line ending character. e.g. A line ends
with "\r\n" when configured for "\n".

This message belongs to the basic checker.


explanation
-----------

While cmake itself does not enforce a particular line ending, it is good
practice for a project to be consist with their line endings.


.. _E0011:

-----
E0011
-----

message
-------

.. code:: 

    Unrecognized file option {:s}


description
-----------

Used when an unrecognized pragma is encountered.


explanation
-----------

cmake-lint allows for some inline comments to supress warnings (among other
things). This lint is emitted if a bad option key is provided in such a pragma


.. _E0012:

-----
E0012
-----

message
-------

.. code:: 

    Bad option value {:s}


description
-----------

Used when a cmake-lint pragma is encountered which attempts to alter some option
in an invalid way.

This message belongs to the basic checker.


explanation
-----------

cmake-lint allows for some inline comments to supress warnings (among other
things). This lint is emitted if a bad option is provided to one of these
pragmas.


.. _E0103:

-----
E0103
-----

message
-------

.. code:: 

    {:s} outside of loop


description
-----------

Used when a break() or continue() statement is used outside a loop.

This message belongs to the basic checker.


.. _E0108:

-----
E0108
-----

message
-------

.. code:: 

    Duplicate argument name {:s} in function/macro definition


.. _E0109:

-----
E0109
-----

message
-------

.. code:: 

    Invalid argument name {:s} in function/macro definition


.. _E1120:

-----
E1120
-----

message
-------

.. code:: 

    Missing required positional argument


description
-----------

Used when a positional argument group expecting an exact number of arguments
is closed (by a parenthesis) before that number of arguments is found.

This message belongs to the basic checker.


.. _E1121:

-----
E1121
-----

message
-------

.. code:: 

    Too many positional arguments


description
-----------

Used when a positional argument is found when no argument group is expected.

This message is implemented by individual command checkers


.. _E1122:

-----
E1122
-----

message
-------

.. code:: 

    Duplicate keyword argument {:s}


description
-----------


Used when a keyword shows up more than once within an argument group. In
general, only COMMAND is allowed more than once.


.. _E1125:

-----
E1125
-----

message
-------

.. code:: 

    Missing required keyword argument {:s}


.. _E1126:

-----
E1126
-----

message
-------

.. code:: 

    Invalid form descriminator


description
-----------


Used when a keyword used to descriminate between different command forms is
ommitted.


.. _R0911:

-----
R0911
-----

message
-------

.. code:: 

    Too many return statements {:d}/{:d}


.. _R0912:

-----
R0912
-----

message
-------

.. code:: 

    Too many branches {:d}/{:d}


.. _R0913:

-----
R0913
-----

message
-------

.. code:: 

    Too many named arguments {:d}/{:d}


.. _R0914:

-----
R0914
-----

message
-------

.. code:: 

    Too many local variables {:d}/{:d}


.. _R0915:

-----
R0915
-----

message
-------

.. code:: 

    Too many statements {:d}/{:d}


.. _W0101:

-----
W0101
-----

message
-------

.. code:: 

    Unreachable code


.. _W0104:

-----
W0104
-----

message
-------

.. code:: 

    Use of deprecated command {:s}


.. _W0105:

-----
W0105
-----

message
-------

.. code:: 

    {:s} variable '{:s}' which matches a built-in except for case


description
-----------


This warning means that you are using a variable such as,
for example, `cmake_cxx_standard` which matches a builtin variable
(`CMAKE_CXX_STANDARD`) except for the case. If this was intentional, then it's
bad practice as it causes confusion (there are two variables in the namespace
with identical name except for case), though it was probably not intentional
and you probably aren't assigning to the correct variable.

This warning may be emitted for assignment (e.g. `set()` or `list()`) as
well as for variable expansion in an argument (e.g. `"${CMAKE_Cxx_STANDARD}"`).


.. _W0106:

-----
W0106
-----

message
-------

.. code:: 

    String looks like a variable reference missing an {:s} tag '{:s}'


