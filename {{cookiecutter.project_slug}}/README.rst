{{ '=' * cookiecutter.project_name | length }}
{{ cookiecutter.project_name }}
{{ '=' * cookiecutter.project_name | length }}

{{ cookiecutter.description }}

This project is a template from ``gh:eyeware/cookiecutter-cpp`` cookiecutter. For improvements and changes, please contact the coockiecuter author.

.. sectnum::
.. contents:: Table of Contents

-------------------------
Setup Project Environment
-------------------------


Operating System Packages
=========================

Linux Ubuntu/Debian:
--------------------

Add to `scripts/provision_ubunto.sh` required packages to be installed in the operating system.

Windows:
--------

TODO:

Cross Platform Environment and Dependencies (Miniconda_)
--------------------------------------------------------

Add to ``conda_env.yaml`` conda packages that are required for the build environment or library dependencies.

You need to have conda installed in your development environment.

code::

 make install_env
 conda activate {{ cookiecutter.project_slug }}


Cross Platform C/C++ Environment and Dependencies (Conan_)
----------------------------------------------------------

---------------------
TDD Development Cycle
---------------------

TDD Flow Diagram::

              +------------------------------------------+
              |                                          |
  +-----------v-----------+                              |
  |                       |                              |
  | 1. New Feature        |                              |
  |                       |                              |
  +-----------+-----------+                              |
              |                                          |
  +-----------v-----------+                              |
  |                       |                              |
  | 2. Write Failing Test |                              |
  |                       |                              |
  +-----------+-----------+                              |
              |                                          |
  +-----------v-----------+                              |
  |                       |                              |
  |   3. Implement Code   +---------------+              |
  |                       |               |              |
  +-----------------------+    +----------v-----------+  |
                               |                      |  |
              +---------------->   4. Execute Test    |  |
              |                |                      |  |
  +-----------+-----------+    +----------+-----------+  |
  |                       |               |              |
  |     5. Fix Code/      |               |              |
  |       Refactor        |               |              |
  |                       |               |              |
  +-----------^-----------+               |              |
              |                 No        v       Yes    |
              +--------------------+ Test Passed? +------+



Publish Code
============

Before publishing code you should check the formatting and make sure all tests are passing.
There are pre-commit hooks for git installed in the git repository to enforce these topics locally.

Code Checks
-----------

- **formating** - `LLVM Code Style`_
- **lint** - TODO: clang linter or cpplint
- **test code coverage** - TODO: underway lcov gcov
- **test reports** - TODO: 

.. _`LLVM Code Style`: https://llvm.org/docs/CodingStandards.html


Versioning
----------


This project uses the following versioning scheme ``<major>.<minor>.<patch>[-<release>]``. The release part identifies the development stage. Release part is one of {prod, alpha, beta}, being prod optional.

Example:

- ``1.0,0`` - Production
- ``1.0.0-alpha`` - Development, Ready for Quality Assurance Tests (QA). TODO: To Be Decided...

To increase the release version perform::

  bumpversion minor
  bumpversion major
  bumpversion patch
  bumpversion release

to reset the release, bump the patch part ??

----------
References
----------

.. _Miniconda: https://conda.io/miniconda.html
.. _`Anaconda Package Repository`: https://anaconda.org/anaconda/repo
.. _Conan: https://conan.io/
.. _`Conan Package Repository`: https://bintray.com/conan/conan-center

1. Miniconda_
2. `Anaconda Package Repository`_
3. Conan_
4. `Conan Package Repository`_
