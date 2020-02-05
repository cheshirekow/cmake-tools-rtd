.. _configopts:

============================================
Various configuration options and parameters
============================================

----------------------------------
Options affecting listfile parsing
----------------------------------

.. _additional_commands:

additional_commands
===================

Specify structure for custom cmake functions

default value:
--------------

.. code::

  { 'foo': { 'flags': ['BAR', 'BAZ'],
             'kwargs': {'DEPENDS': '*', 'HEADERS': '*', 'SOURCES': '*'}}}

detailed description:
---------------------

Use this variable to specify how to parse custom cmake functions.
See :ref:`additional-cmd`.

config-file entry:
------------------

.. code:: 

  # ----------------------------------
  # Options affecting listfile parsing
  # ----------------------------------
  with section("parse"):
  
    # Specify structure for custom cmake functions
    additional_commands = { 'foo': { 'flags': ['BAR', 'BAZ'],
               'kwargs': {'DEPENDS': '*', 'HEADERS': '*', 'SOURCES': '*'}}}
  
  

.. _vartags:

vartags
=======

Specify variable tags.

default value:
--------------

.. code::

  []

detailed description:
---------------------

Specify a mapping of variable patterns (python regular expression) to a list
of tags. Any time a a variable matching this pattern is encountered the tags
can be used to affect the parsing/formatting. For example:

.. code::

   vartags = [
     (".*_COMMAND", ["cmdline"])
   ]

Specifies that any variable ending in ``_COMMAND`` be tagged as ``cmdline``.
This will affect the formatting by preventing the arguments from being
vertically wrapped.

Note: this particular rule is builtin so you do not need to include this in
your configuration. Use the configuration variable to add new rules.

command-line option:
--------------------

.. code:: 

     --vartags [VARTAGS [VARTAGS ...]]
                           Specify variable tags.
   

config-file entry:
------------------

.. code:: 

  # ----------------------------------
  # Options affecting listfile parsing
  # ----------------------------------
  with section("parse"):
  
    # Specify variable tags.
    vartags = []
  
  

.. _proptags:

proptags
========

Specify property tags.

default value:
--------------

.. code::

  []

detailed description:
---------------------

Specify a mapping of property patterns (python regular expression) to a list
of tags. Any time a a property matching this pattern is encountered the tags
can be used to affect the parsing/formatting. For example:

.. code::

   proptags = [
     (".*_DIRECTORIES", ["file-list"])
   ]

Specifies that any property ending in ``_DIRECTORIES`` be tagged as
``file-list``. In the future this may affect formatting by allowing arguments
to be sorted (but currently has no effect).

Note: this particular rule is builtin so you do not need to include this in
your configuration. Use the configuration variable to add new rules.

command-line option:
--------------------

.. code:: 

     --proptags [PROPTAGS [PROPTAGS ...]]
                           Specify property tags.
   

config-file entry:
------------------

.. code:: 

  # ----------------------------------
  # Options affecting listfile parsing
  # ----------------------------------
  with section("parse"):
  
    # Specify property tags.
    proptags = []
  
  

-----------------------------
Options affecting formatting.
-----------------------------

.. _line_width:

line_width
==========

How wide to allow formatted cmake files

default value:
--------------

.. code::

  80

detailed description:
---------------------

``line_width`` specifies the number of columns that ``cmake-format`` should
fit commands into. This is the number of columns at which arguments will be
wrapped.

.. code::

  # line_width = 80 (default)
  add_library(libname STATIC sourcefile_one.cc sourcefile_two.cc
                             sourcefile_three.cc sourcefile_four.cc)

  # line_width = 100
  add_library(libname STATIC sourcefile_one.cc sourcefile_two.cc sourcefile_three.cc
                             sourcefile_four.cc)

command-line option:
--------------------

.. code:: 

     --line-width LINE_WIDTH
                           How wide to allow formatted cmake files
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # How wide to allow formatted cmake files
    line_width = 80
  
  

.. _tab_size:

tab_size
========

How many spaces to tab for indent

default value:
--------------

.. code::

  2

detailed description:
---------------------

``tab_size`` indicates how many spaces should be used to indent nested
"scopes". For example:

.. code::

  # tab_size = 2 (default)
  if(this_condition_is_true)
    message("Hello World")
  endif()

  # tab_size = 4
  if(this_condition_is_true)
      message("Hello World")
  endif()

command-line option:
--------------------

.. code:: 

     --tab-size TAB_SIZE  How many spaces to tab for indent
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # How many spaces to tab for indent
    tab_size = 2
  
  

.. _max_subgroups_hwrap:

max_subgroups_hwrap
===================

If an argument group contains more than this many sub-groups (parg or kwarg groups) then force it to a vertical layout.

default value:
--------------

.. code::

  2

detailed description:
---------------------

A "subgroup" in this context is either a positional or keyword argument group
within the current depth of the statement parse tree. If the number of
"subgroups" at this depth is greater than ``max_subgroups_hwrap`` then
hwrap-formatting is inadmissable and a vertical layout will be selected.

The default value for this parameter is `2`.

Consider the following two examples:

.. code:: cmake

  # This statement has two argument groups, so hwrap is admissible
  add_custom_target(target1 ALL COMMAND echo "hello world")

  # This statement has three argument groups, so the statement will format
  # vertically
  add_custom_target(
     target2 ALL
     COMMAND echo "hello world"
     COMMAND echo "hello again")

In the first statement, there are two argument groups. We can see them with
``--dump parse``

.. code::

  └─ BODY: 1:0
    └─ STATEMENT: 1:0
        ├─ FUNNAME: 1:0
        ├─ LPAREN: 1:17
        ├─ ARGGROUP: 1:18
        │   ├─ PARGGROUP: 1:18  <-- group 1
        │   │   ├─ ARGUMENT: 1:18
        │   │   └─ FLAG: 1:26
        │   └─ KWARGGROUP: 1:30  <-- group 2
        │       ├─ KEYWORD: 1:30
        │       └─ ARGGROUP: 1:38
        │           └─ PARGGROUP: 1:38
        │               ├─ ARGUMENT: 1:38
        │               └─ ARGUMENT: 1:43
        └─ RPAREN: 1:56

The second statement has three argument groups:

.. code::

  └─ BODY: 1:0
      └─ STATEMENT: 1:0
          ├─ FUNNAME: 1:0
          ├─ LPAREN: 1:17
          ├─ ARGGROUP: 2:5
          │   ├─ PARGGROUP: 2:5  <-- group 1
          │   │   ├─ ARGUMENT: 2:5
          │   │   └─ FLAG: 2:13
          │   ├─ KWARGGROUP: 3:5  <-- group 2
          │   │   ├─ KEYWORD: 3:5
          │   │   └─ ARGGROUP: 3:13
          │   │       └─ PARGGROUP: 3:13
          │   │           ├─ ARGUMENT: 3:13
          │   │           ├─ ARGUMENT: 3:18
          │   └─ KWARGGROUP: 4:5  <-- group 3
          │       ├─ KEYWORD: 4:5
          │       └─ ARGGROUP: 4:13
          │           └─ PARGGROUP: 4:13
          │               ├─ ARGUMENT: 4:13
          │               └─ ARGUMENT: 4:18
          └─ RPAREN: 4:31

command-line option:
--------------------

.. code:: 

     --max-subgroups-hwrap MAX_SUBGROUPS_HWRAP
                           If an argument group contains more than this many sub-
                           groups (parg or kwarg groups) then force it to a
                           vertical layout.
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If an argument group contains more than this many sub-groups (parg or kwarg
    # groups) then force it to a vertical layout.
    max_subgroups_hwrap = 2
  
  

.. _max_pargs_hwrap:

max_pargs_hwrap
===============

If a positional argument group contains more than this many arguments, then force it to a vertical layout.

default value:
--------------

.. code::

  6

detailed description:
---------------------

This configuration parameter is relavent only to positional argument groups.
A positional argument group is a list of "plain" arguments. If the number of
arguments in the group is greater than this number, then then hwrap-formatting
is inadmissable and a vertical layout will be selected.

The default value for this parameter is 6

Consider the following two examples:

.. code::

  # This statement has six arguments in the second group and so hwrap is
  # admissible
  set(sources filename_one.cc filename_two.cc filename_three.cc
              filename_four.cc filename_five.cc filename_six.cc)

  # This statement has seven arguments in the second group and so hwrap is
  # inadmissible
  set(sources
      filename_one.cc
      filename_two.cc
      filename_three.cc
      filename_four.cc
      filename_five.cc
      filename_six.cc
      filename_seven.cc)

command-line option:
--------------------

.. code:: 

     --max-pargs-hwrap MAX_PARGS_HWRAP
                           If a positional argument group contains more than this
                           many arguments, then force it to a vertical layout.
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If a positional argument group contains more than this many arguments, then
    # force it to a vertical layout.
    max_pargs_hwrap = 6
  
  

.. _max_rows_cmdline:

max_rows_cmdline
================

If a cmdline positional group consumes more than this many lines without nesting, then invalidate the layout (and nest)

default value:
--------------

.. code::

  2

detailed description:
---------------------

``max_pargs_hwrap`` does not apply to positional argument groups for shell
commands. These are never columnized and always hwrapped. However, if the
wrapped format exceeds this many lines, then the group will also be nested.

command-line option:
--------------------

.. code:: 

     --max-rows-cmdline MAX_ROWS_CMDLINE
                           If a cmdline positional group consumes more than this
                           many lines without nesting, then invalidate the layout
                           (and nest)
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If a cmdline positional group consumes more than this many lines without
    # nesting, then invalidate the layout (and nest)
    max_rows_cmdline = 2
  
  

.. _separate_ctrl_name_with_space:

separate_ctrl_name_with_space
=============================

If true, separate flow control names from their parentheses with a space

default value:
--------------

.. code::

  False

command-line option:
--------------------

.. code:: 

     --separate-ctrl-name-with-space [SEPARATE_CTRL_NAME_WITH_SPACE]
                           If true, separate flow control names from their
                           parentheses with a space
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If true, separate flow control names from their parentheses with a space
    separate_ctrl_name_with_space = False
  
  

.. _separate_fn_name_with_space:

separate_fn_name_with_space
===========================

If true, separate function names from parentheses with a space

default value:
--------------

.. code::

  False

command-line option:
--------------------

.. code:: 

     --separate-fn-name-with-space [SEPARATE_FN_NAME_WITH_SPACE]
                           If true, separate function names from parentheses with
                           a space
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If true, separate function names from parentheses with a space
    separate_fn_name_with_space = False
  
  

.. _dangle_parens:

dangle_parens
=============

If a statement is wrapped to more than one line, than dangle the closing parenthesis on its own line.

default value:
--------------

.. code::

  False

detailed description:
---------------------

If a statement is wrapped to more than one line, than dangle the closing
parenthesis on its own line. For example:

.. code::

  # dangle_parens = False (default)
  set(sources filename_one.cc filename_two.cc filename_three.cc
              filename_four.cc filename_five.cc filename_six.cc)

  # dangle_parens = True
  set(sources filename_one.cc filename_two.cc filename_three.cc
            filename_four.cc filename_five.cc filename_six.cc
  )  # <-- this is a dangling parenthesis

The default is ``false``.

command-line option:
--------------------

.. code:: 

     --dangle-parens [DANGLE_PARENS]
                           If a statement is wrapped to more than one line, than
                           dangle the closing parenthesis on its own line.
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If a statement is wrapped to more than one line, than dangle the closing
    # parenthesis on its own line.
    dangle_parens = False
  
  

.. _dangle_align:

dangle_align
============

If the trailing parenthesis must be 'dangled' on its on line, then align it to this reference: `prefix`: the start of the statement,  `prefix-indent`: the start of the statement, plus one indentation  level, `child`: align to the column of the arguments

default value:
--------------

.. code::

  'prefix'

detailed description:
---------------------

If the trailing parenthesis must be 'dangled' on it's on line, then align it
to this reference. Options are:

* ``prefix``: the start of the statement,
* ``prefix-indent``: the start of the statement, plus one indentation  level
* ``child``: align to the column of the arguments

For example:

.. code::

  # dangle_align = "prefix"
  set(sources filename_one.cc filename_two.cc filename_three.cc
           filename_four.cc filename_five.cc filename_six.cc
  )  # <-- aligned to the statement

  # dangle_align = "prefix-indent"
  set(sources filename_one.cc filename_two.cc filename_three.cc
           filename_four.cc filename_five.cc filename_six.cc
    )  # <-- plus one indentation level

  # dangle_align = "child"
  set(sources filename_one.cc filename_two.cc filename_three.cc
           filename_four.cc filename_five.cc filename_six.cc
      )  # <-- aligned to "sources"

command-line option:
--------------------

.. code:: 

     --dangle-align {prefix,prefix-indent,child,off}
                           If the trailing parenthesis must be 'dangled' on its
                           on line, then align it to this reference: `prefix`:
                           the start of the statement, `prefix-indent`: the start
                           of the statement, plus one indentation level, `child`:
                           align to the column of the arguments
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If the trailing parenthesis must be 'dangled' on its on line, then align it
    # to this reference: `prefix`: the start of the statement,  `prefix-indent`:
    # the start of the statement, plus one indentation  level, `child`: align to
    # the column of the arguments
    dangle_align = 'prefix'
  
  

.. _min_prefix_chars:

min_prefix_chars
================

If the statement spelling length (including space and parenthesis) is smaller than this amount, then force reject nested layouts.

default value:
--------------

.. code::

  4

detailed description:
---------------------

This value only comes into play when considering whether or not to nest
arguments below their parent. If the number of characters in the parent is
less than this value, we will not nest. In the example below, we'll set
``line_width=40`` for illustration:

.. code::

  # min_prefix_chars = 4 (default)
  message(
    "With the default value, this "
    "string is allowed to nest beneath "
    "the statement")

  # min_prefix_chars = 8
  message("With the default value, this "
          "string is allowed to nest beneath "
          "the statement")

command-line option:
--------------------

.. code:: 

     --min-prefix-chars MIN_PREFIX_CHARS
                           If the statement spelling length (including space and
                           parenthesis) is smaller than this amount, then force
                           reject nested layouts.
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If the statement spelling length (including space and parenthesis) is
    # smaller than this amount, then force reject nested layouts.
    min_prefix_chars = 4
  
  

.. _max_prefix_chars:

max_prefix_chars
================

If the statement spelling length (including space and parenthesis) is larger than the tab width by more than this amount, then force reject un-nested layouts.

default value:
--------------

.. code::

  10

command-line option:
--------------------

.. code:: 

     --max-prefix-chars MAX_PREFIX_CHARS
                           If the statement spelling length (including space and
                           parenthesis) is larger than the tab width by more than
                           this amount, then force reject un-nested layouts.
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If the statement spelling length (including space and parenthesis) is larger
    # than the tab width by more than this amount, then force reject un-nested
    # layouts.
    max_prefix_chars = 10
  
  

.. _max_lines_hwrap:

max_lines_hwrap
===============

If a candidate layout is wrapped horizontally but it exceeds this many lines, then reject the layout.

default value:
--------------

.. code::

  2

detailed description:
---------------------

Usually the layout algorithm will prefer to do a simple "word-wrap" of
positional arguments, if it can. However if such a simple word-wrap would
exceed this many lines, then that layout is rejected, and further passes are
tried. The default value is ``max_lines_hwrap=2`` so, for example:

.. code::

  message("This message can easily be wrapped" "to two lines so there is no"
          "problem with using" "horizontal wrapping")
  message(
    "However this message cannot be wrapped to two lines because the "
    "arguments are too long. It would require at least three lines."
    "As a result, a simple word-wrap is rejected"
    "And each argument"
    "gets its own line")

command-line option:
--------------------

.. code:: 

     --max-lines-hwrap MAX_LINES_HWRAP
                           If a candidate layout is wrapped horizontally but it
                           exceeds this many lines, then reject the layout.
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If a candidate layout is wrapped horizontally but it exceeds this many
    # lines, then reject the layout.
    max_lines_hwrap = 2
  
  

.. _line_ending:

line_ending
===========

What style line endings to use in the output.

default value:
--------------

.. code::

  'unix'

detailed description:
---------------------

This is a string indicating which style of line ending ``cmake-format`` should
use when writing out the formatted file. If ``line_ending="unix"`` (default)
then the output will contain a single newline character (``\n``) at the end of
each line. If ``line_ending="windows"`` then the output will contain a
carriage-return and newline pair (``\r\n``). If ``line_ending="auto"`` then
``cmake-format`` will observe the first line-ending of the input file and will
use style that all lines in the output.

command-line option:
--------------------

.. code:: 

     --line-ending {windows,unix,auto}
                           What style line endings to use in the output.
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # What style line endings to use in the output.
    line_ending = 'unix'
  
  

.. _command_case:

command_case
============

Format command names consistently as 'lower' or 'upper' case

default value:
--------------

.. code::

  'canonical'

detailed description:
---------------------

``cmake`` ignores case in command names. Very old projects tend to use
uppercase for command names, while modern projects tend to use lowercase.
There are three options for this variable:

* ``upper``: format commands as uppercase
* ``lower``: format commands as lowercase
* ``canonical``: format standard commands as they are formatted in the
  ``cmake`` documentation.

``canonical`` is generally the same as ``lower`` except that some third-party
find modules that have moved into the distribution (e.g.
``ExternalProject_Add``).

command-line option:
--------------------

.. code:: 

     --command-case {lower,upper,canonical,unchanged}
                           Format command names consistently as 'lower' or
                           'upper' case
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # Format command names consistently as 'lower' or 'upper' case
    command_case = 'canonical'
  
  

.. _keyword_case:

keyword_case
============

Format keywords consistently as 'lower' or 'upper' case

default value:
--------------

.. code::

  'unchanged'

detailed description:
---------------------

``cmake`` ignores the case of sentinal words (keywords) in argument lists.
Generally projects tend to prefer uppercase (``keyword_case="upper"``) which is
the default. Alternatively, this may also be set to ``lower`` to format
keywords as lowercase.

command-line option:
--------------------

.. code:: 

     --keyword-case {lower,upper,unchanged}
                           Format keywords consistently as 'lower' or 'upper'
                           case
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # Format keywords consistently as 'lower' or 'upper' case
    keyword_case = 'unchanged'
  
  

.. _always_wrap:

always_wrap
===========

A list of command names which should always be wrapped

default value:
--------------

.. code::

  []

command-line option:
--------------------

.. code:: 

     --always-wrap [ALWAYS_WRAP [ALWAYS_WRAP ...]]
                           A list of command names which should always be wrapped
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # A list of command names which should always be wrapped
    always_wrap = []
  
  

.. _enable_sort:

enable_sort
===========

If true, the argument lists which are known to be sortable will be sorted lexicographicall

default value:
--------------

.. code::

  True

command-line option:
--------------------

.. code:: 

     --enable-sort [ENABLE_SORT]
                           If true, the argument lists which are known to be
                           sortable will be sorted lexicographicall
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If true, the argument lists which are known to be sortable will be sorted
    # lexicographicall
    enable_sort = True
  
  

.. _autosort:

autosort
========

If true, the parsers may infer whether or not an argument list is sortable (without annotation).

default value:
--------------

.. code::

  False

command-line option:
--------------------

.. code:: 

     --autosort [AUTOSORT]
                           If true, the parsers may infer whether or not an
                           argument list is sortable (without annotation).
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # If true, the parsers may infer whether or not an argument list is sortable
    # (without annotation).
    autosort = False
  
  

.. _require_valid_layout:

require_valid_layout
====================

By default, if cmake-format cannot successfully fit everything into the desired linewidth it will apply the last, most agressive attempt that it made. If this flag is True, however, cmake-format will print error, exit with non-zero status code, and write-out nothing

default value:
--------------

.. code::

  False

detailed description:
---------------------

By default, if cmake-format cannot successfully fit everything into the
desired linewidth it will apply the last, most agressive attempt that it made.
If this flag is True, however, cmake-format will print error, exit with non-
zero status code, and write-out nothing

command-line option:
--------------------

.. code:: 

     --require-valid-layout [REQUIRE_VALID_LAYOUT]
                           By default, if cmake-format cannot successfully fit
                           everything into the desired linewidth it will apply
                           the last, most agressive attempt that it made. If this
                           flag is True, however, cmake-format will print error,
                           exit with non-zero status code, and write-out nothing
   

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # By default, if cmake-format cannot successfully fit everything into the
    # desired linewidth it will apply the last, most agressive attempt that it
    # made. If this flag is True, however, cmake-format will print error, exit
    # with non-zero status code, and write-out nothing
    require_valid_layout = False
  
  

.. _layout_passes:

layout_passes
=============

A dictionary mapping layout nodes to a list of wrap decisions. See the documentation for more information.

default value:
--------------

.. code::

  {}

detailed description:
---------------------

See the :ref:`Formatting Algorithm <formatting-algorithm>` section for more
information on how `cmake-format` uses multiple passes to converge on the
final layout of the listfile source code. This option can be used to override
the default behavior. The format of this option is a dictionary, where the keys
are the names of the different layout node classes:

* StatementNode
* ArgGroupNode
* KWargGroupNode
* PargGroupNode
* ParenGroupNode

The dictionary values are a list of pairs (2-tuples) in the form of
:code:`(passno, wrap-decision)`. Where :code:`passno` is the pass number at
which  the wrap-decision becomes active, and :code:`wrap-decision` is a boolean
:code:`(true/false)`. For each layout pass, the decision of whether or not the
node should wrap (either nested, or vertical) is looked-up from this map.

config-file entry:
------------------

.. code:: 

  # -----------------------------
  # Options affecting formatting.
  # -----------------------------
  with section("format"):
  
    # A dictionary mapping layout nodes to a list of wrap decisions. See the
    # documentation for more information.
    layout_passes = {}
  
  

------------------------------------------------
Options affecting comment reflow and formatting.
------------------------------------------------

.. _bullet_char:

bullet_char
===========

What character to use for bulleted lists

default value:
--------------

.. code::

  '*'

command-line option:
--------------------

.. code:: 

     --bullet-char BULLET_CHAR
                           What character to use for bulleted lists
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # What character to use for bulleted lists
    bullet_char = '*'
  
  

.. _enum_char:

enum_char
=========

What character to use as punctuation after numerals in an enumerated list

default value:
--------------

.. code::

  '.'

command-line option:
--------------------

.. code:: 

     --enum-char ENUM_CHAR
                           What character to use as punctuation after numerals in
                           an enumerated list
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # What character to use as punctuation after numerals in an enumerated list
    enum_char = '.'
  
  

.. _first_comment_is_literal:

first_comment_is_literal
========================

If comment markup is enabled, don't reflow the first comment block in each listfile. Use this to preserve formatting of your copyright/license statements.

default value:
--------------

.. code::

  False

command-line option:
--------------------

.. code:: 

     --first-comment-is-literal [FIRST_COMMENT_IS_LITERAL]
                           If comment markup is enabled, don't reflow the first
                           comment block in each listfile. Use this to preserve
                           formatting of your copyright/license statements.
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # If comment markup is enabled, don't reflow the first comment block in each
    # listfile. Use this to preserve formatting of your copyright/license
    # statements.
    first_comment_is_literal = False
  
  

.. _literal_comment_pattern:

literal_comment_pattern
=======================

If comment markup is enabled, don't reflow any comment block which matches this (regex) pattern. Default is `None` (disabled).

default value:
--------------

.. code::

  None

command-line option:
--------------------

.. code:: 

     --literal-comment-pattern LITERAL_COMMENT_PATTERN
                           If comment markup is enabled, don't reflow any comment
                           block which matches this (regex) pattern. Default is
                           `None` (disabled).
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # If comment markup is enabled, don't reflow any comment block which matches
    # this (regex) pattern. Default is `None` (disabled).
    literal_comment_pattern = None
  
  

.. _fence_pattern:

fence_pattern
=============

Regular expression to match preformat fences in comments default= ``r'^\s*([`~]{3}[`~]*)(.*)$'``

default value:
--------------

.. code::

  '^\\s*([`~]{3}[`~]*)(.*)$'

command-line option:
--------------------

.. code:: 

     --fence-pattern FENCE_PATTERN
                           Regular expression to match preformat fences in
                           comments default= ``r'^\s*([`~]{3}[`~]*)(.*)$'``
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # Regular expression to match preformat fences in comments default=
    # ``r'^\s*([`~]{3}[`~]*)(.*)$'``
    fence_pattern = '^\\s*([`~]{3}[`~]*)(.*)$'
  
  

.. _ruler_pattern:

ruler_pattern
=============

Regular expression to match rulers in comments default= ``r'^\s*[^\w\s]{3}.*[^\w\s]{3}$'``

default value:
--------------

.. code::

  '^\\s*[^\\w\\s]{3}.*[^\\w\\s]{3}$'

command-line option:
--------------------

.. code:: 

     --ruler-pattern RULER_PATTERN
                           Regular expression to match rulers in comments
                           default= ``r'^\s*[^\w\s]{3}.*[^\w\s]{3}$'``
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # Regular expression to match rulers in comments default=
    # ``r'^\s*[^\w\s]{3}.*[^\w\s]{3}$'``
    ruler_pattern = '^\\s*[^\\w\\s]{3}.*[^\\w\\s]{3}$'
  
  

.. _explicit_trailing_pattern:

explicit_trailing_pattern
=========================

If a comment line matches starts with this pattern then it is explicitly a trailing comment for the preceeding argument. Default is '#<'

default value:
--------------

.. code::

  '#<'

command-line option:
--------------------

.. code:: 

     --explicit-trailing-pattern EXPLICIT_TRAILING_PATTERN
                           If a comment line matches starts with this pattern
                           then it is explicitly a trailing comment for the
                           preceeding argument. Default is '#<'
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # If a comment line matches starts with this pattern then it is explicitly a
    # trailing comment for the preceeding argument. Default is '#<'
    explicit_trailing_pattern = '#<'
  
  

.. _hashruler_min_length:

hashruler_min_length
====================

If a comment line starts with at least this many consecutive hash characters, then don't lstrip() them off. This allows for lazy hash rulers where the first hash char is not separated by space

default value:
--------------

.. code::

  10

command-line option:
--------------------

.. code:: 

     --hashruler-min-length HASHRULER_MIN_LENGTH
                           If a comment line starts with at least this many
                           consecutive hash characters, then don't lstrip() them
                           off. This allows for lazy hash rulers where the first
                           hash char is not separated by space
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # If a comment line starts with at least this many consecutive hash
    # characters, then don't lstrip() them off. This allows for lazy hash rulers
    # where the first hash char is not separated by space
    hashruler_min_length = 10
  
  

.. _canonicalize_hashrulers:

canonicalize_hashrulers
=======================

If true, then insert a space between the first hash char and remaining hash chars in a hash ruler, and normalize its length to fill the column

default value:
--------------

.. code::

  True

command-line option:
--------------------

.. code:: 

     --canonicalize-hashrulers [CANONICALIZE_HASHRULERS]
                           If true, then insert a space between the first hash
                           char and remaining hash chars in a hash ruler, and
                           normalize its length to fill the column
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # If true, then insert a space between the first hash char and remaining hash
    # chars in a hash ruler, and normalize its length to fill the column
    canonicalize_hashrulers = True
  
  

.. _enable_markup:

enable_markup
=============

enable comment markup parsing and reflow

default value:
--------------

.. code::

  True

command-line option:
--------------------

.. code:: 

     --enable-markup [ENABLE_MARKUP]
                           enable comment markup parsing and reflow
   

config-file entry:
------------------

.. code:: 

  # ------------------------------------------------
  # Options affecting comment reflow and formatting.
  # ------------------------------------------------
  with section("markup"):
  
    # enable comment markup parsing and reflow
    enable_markup = True
  
  

----------------------------
Options affecting the linter
----------------------------

.. _disabled_codes:

disabled_codes
==============

a list of lint codes to disable

default value:
--------------

.. code::

  []

command-line option:
--------------------

.. code:: 

     --disabled-codes [DISABLED_CODES [DISABLED_CODES ...]]
                           a list of lint codes to disable
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # a list of lint codes to disable
    disabled_codes = []
  
  

.. _function_pattern:

function_pattern
================

regular expression pattern describing valid function names

default value:
--------------

.. code::

  '[0-9a-z_]+'

command-line option:
--------------------

.. code:: 

     --function-pattern FUNCTION_PATTERN
                           regular expression pattern describing valid function
                           names
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # regular expression pattern describing valid function names
    function_pattern = '[0-9a-z_]+'
  
  

.. _macro_pattern:

macro_pattern
=============

regular expression pattern describing valid macro names

default value:
--------------

.. code::

  '[0-9A-Z_]+'

command-line option:
--------------------

.. code:: 

     --macro-pattern MACRO_PATTERN
                           regular expression pattern describing valid macro
                           names
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # regular expression pattern describing valid macro names
    macro_pattern = '[0-9A-Z_]+'
  
  

.. _global_var_pattern:

global_var_pattern
==================

regular expression pattern describing valid names for variables with global scope

default value:
--------------

.. code::

  '[0-9A-Z][0-9A-Z_]+'

command-line option:
--------------------

.. code:: 

     --global-var-pattern GLOBAL_VAR_PATTERN
                           regular expression pattern describing valid names for
                           variables with global scope
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # regular expression pattern describing valid names for variables with global
    # scope
    global_var_pattern = '[0-9A-Z][0-9A-Z_]+'
  
  

.. _internal_var_pattern:

internal_var_pattern
====================

regular expression pattern describing valid names for variables with global scope (but internal semantic)

default value:
--------------

.. code::

  '_[0-9A-Z][0-9A-Z_]+'

command-line option:
--------------------

.. code:: 

     --internal-var-pattern INTERNAL_VAR_PATTERN
                           regular expression pattern describing valid names for
                           variables with global scope (but internal semantic)
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # regular expression pattern describing valid names for variables with global
    # scope (but internal semantic)
    internal_var_pattern = '_[0-9A-Z][0-9A-Z_]+'
  
  

.. _local_var_pattern:

local_var_pattern
=================

regular expression pattern describing valid names for variables with local scope

default value:
--------------

.. code::

  '[0-9a-z_]+'

command-line option:
--------------------

.. code:: 

     --local-var-pattern LOCAL_VAR_PATTERN
                           regular expression pattern describing valid names for
                           variables with local scope
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # regular expression pattern describing valid names for variables with local
    # scope
    local_var_pattern = '[0-9a-z_]+'
  
  

.. _private_var_pattern:

private_var_pattern
===================

regular expression pattern describing valid names for privatedirectory variables

default value:
--------------

.. code::

  '_[0-9a-z_]+'

command-line option:
--------------------

.. code:: 

     --private-var-pattern PRIVATE_VAR_PATTERN
                           regular expression pattern describing valid names for
                           privatedirectory variables
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # regular expression pattern describing valid names for privatedirectory
    # variables
    private_var_pattern = '_[0-9a-z_]+'
  
  

.. _public_var_pattern:

public_var_pattern
==================

regular expression pattern describing valid names for publicdirectory variables

default value:
--------------

.. code::

  '[0-9A-Z][0-9A-Z_]+'

command-line option:
--------------------

.. code:: 

     --public-var-pattern PUBLIC_VAR_PATTERN
                           regular expression pattern describing valid names for
                           publicdirectory variables
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # regular expression pattern describing valid names for publicdirectory
    # variables
    public_var_pattern = '[0-9A-Z][0-9A-Z_]+'
  
  

.. _keyword_pattern:

keyword_pattern
===============

regular expression pattern describing valid names for keywords used in functions or macros

default value:
--------------

.. code::

  '[0-9A-Z_]+'

command-line option:
--------------------

.. code:: 

     --keyword-pattern KEYWORD_PATTERN
                           regular expression pattern describing valid names for
                           keywords used in functions or macros
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # regular expression pattern describing valid names for keywords used in
    # functions or macros
    keyword_pattern = '[0-9A-Z_]+'
  
  

.. _max_conditionals_custom_parser:

max_conditionals_custom_parser
==============================

In the heuristic for C0201, how many conditionals to match within a loop in before considering the loop a parser.

default value:
--------------

.. code::

  2

command-line option:
--------------------

.. code:: 

     --max-conditionals-custom-parser MAX_CONDITIONALS_CUSTOM_PARSER
                           In the heuristic for C0201, how many conditionals to
                           match within a loop in before considering the loop a
                           parser.
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # In the heuristic for C0201, how many conditionals to match within a loop in
    # before considering the loop a parser.
    max_conditionals_custom_parser = 2
  
  

.. _min_statement_spacing:

min_statement_spacing
=====================

Require at least this many newlines between statements

default value:
--------------

.. code::

  1

command-line option:
--------------------

.. code:: 

     --min-statement-spacing MIN_STATEMENT_SPACING
                           Require at least this many newlines between statements
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # Require at least this many newlines between statements
    min_statement_spacing = 1
  
  

.. _max_statement_spacing:

max_statement_spacing
=====================

Require no more than this many newlines between statements

default value:
--------------

.. code::

  1

command-line option:
--------------------

.. code:: 

     --max-statement-spacing MAX_STATEMENT_SPACING
                           Require no more than this many newlines between
                           statements
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
  
    # Require no more than this many newlines between statements
    max_statement_spacing = 1
  
  

.. _max_returns:

max_returns
===========

default value:
--------------

.. code::

  6

command-line option:
--------------------

.. code:: 

     --max-returns MAX_RETURNS
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
    max_returns = 6
  
  

.. _max_branches:

max_branches
============

default value:
--------------

.. code::

  12

command-line option:
--------------------

.. code:: 

     --max-branches MAX_BRANCHES
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
    max_branches = 12
  
  

.. _max_arguments:

max_arguments
=============

default value:
--------------

.. code::

  5

command-line option:
--------------------

.. code:: 

     --max-arguments MAX_ARGUMENTS
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
    max_arguments = 5
  
  

.. _max_localvars:

max_localvars
=============

default value:
--------------

.. code::

  15

command-line option:
--------------------

.. code:: 

     --max-localvars MAX_LOCALVARS
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
    max_localvars = 15
  
  

.. _max_statements:

max_statements
==============

default value:
--------------

.. code::

  50

command-line option:
--------------------

.. code:: 

     --max-statements MAX_STATEMENTS
   

config-file entry:
------------------

.. code:: 

  # ----------------------------
  # Options affecting the linter
  # ----------------------------
  with section("lint"):
    max_statements = 50
  
  

-------------------------------
Options affecting file encoding
-------------------------------

.. _emit_byteorder_mark:

emit_byteorder_mark
===================

If true, emit the unicode byte-order mark (BOM) at the start of the file

default value:
--------------

.. code::

  False

detailed description:
---------------------

If ``true`` (the default is ``false``) then output the unicode byte-order at
the start of the document.

command-line option:
--------------------

.. code:: 

     --emit-byteorder-mark [EMIT_BYTEORDER_MARK]
                           If true, emit the unicode byte-order mark (BOM) at the
                           start of the file
   

config-file entry:
------------------

.. code:: 

  # -------------------------------
  # Options affecting file encoding
  # -------------------------------
  with section("encode"):
  
    # If true, emit the unicode byte-order mark (BOM) at the start of the file
    emit_byteorder_mark = False
  
  

.. _input_encoding:

input_encoding
==============

Specify the encoding of the input file. Defaults to utf-8

default value:
--------------

.. code::

  'utf-8'

detailed description:
---------------------

Specify the input encoding of the file. The format of this string is `anything
understood`__ by the ``encoding=`` keyword of the python ``open()`` function.
The default is ``utf-8``.

.. __: https://docs.python.org/3/library/codecs.html#standard-encodings

command-line option:
--------------------

.. code:: 

     --input-encoding INPUT_ENCODING
                           Specify the encoding of the input file. Defaults to
                           utf-8
   

config-file entry:
------------------

.. code:: 

  # -------------------------------
  # Options affecting file encoding
  # -------------------------------
  with section("encode"):
  
    # Specify the encoding of the input file. Defaults to utf-8
    input_encoding = 'utf-8'
  
  

.. _output_encoding:

output_encoding
===============

Specify the encoding of the output file. Defaults to utf-8. Note that cmake only claims to support utf-8 so be careful when using anything else

default value:
--------------

.. code::

  'utf-8'

detailed description:
---------------------

Specify the output encoding of the file. The format of this string is `anything
understood`__ by the ``encoding=`` keyword of the python ``open()`` function.
The default is ``utf-8``.

.. __: https://docs.python.org/3/library/codecs.html#standard-encodings

command-line option:
--------------------

.. code:: 

     --output-encoding OUTPUT_ENCODING
                           Specify the encoding of the output file. Defaults to
                           utf-8. Note that cmake only claims to support utf-8 so
                           be careful when using anything else
   

config-file entry:
------------------

.. code:: 

  # -------------------------------
  # Options affecting file encoding
  # -------------------------------
  with section("encode"):
  
    # Specify the encoding of the output file. Defaults to utf-8. Note that cmake
    # only claims to support utf-8 so be careful when using anything else
    output_encoding = 'utf-8'
  
  

-------------------------------------
Miscellaneous configurations options.
-------------------------------------

.. _per_command:

per_command
===========

A dictionary containing any per-command configuration overrides. Currently only `command_case` is supported.

default value:
--------------

.. code::

  {}

config-file entry:
------------------

.. code:: 

  # -------------------------------------
  # Miscellaneous configurations options.
  # -------------------------------------
  with section("misc"):
  
    # A dictionary containing any per-command configuration overrides. Currently
    # only `command_case` is supported.
    per_command = {}
  
  

