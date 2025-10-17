# Copyright Spack Project Developers. See COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

# ----------------------------------------------------------------------------
# If you submit this package back to Spack as a pull request,
# please first remove this boilerplate and all FIXME comments.
#
# This is a template package file for Spack.  We've put "FIXME"
# next to all the things you'll want to change. Once you've handled
# them, you can save this file and test your package like this:
#
#     spack install ftorch
#
# You can edit this file again by typing:
#
#     spack edit ftorch
#
# See the Spack documentation for more information on packaging.
# ----------------------------------------------------------------------------

from spack_repo.builtin.build_systems.cmake import CMakePackage

from spack.package import *


class Ftorch(CMakePackage):
    """A library for directly calling PyTorch ML models from Fortran."""

    homepage = "https://cambridge-iccs.github.io/FTorch/"
    git = "https://github.com/Cambridge-ICCS/FTorch.git"
    url = "https://github.com/Cambridge-ICCS/FTorch/archive/refs/tags/v1.0.0.tar.gz"

    # FIXME: Add a list of GitHub accounts to
    # notify when the package is updated.
    # maintainers("github_user1", "github_user2")

    license("MIT", checked_by="jfdev001")

    version("main", branch="main")
    version(
        "1.0.0",
        sha256="c4b6741e582623b7ecaecd59d02f779e8a6f6017f8068c85da8a034f468df375")

    # NOTE: purify, trilinos, mpileaks tutorial
    variant("test", default=False, description="Build tests")

    # Generic language dependencies
    depends_on("c", type="build")
    depends_on("cxx", type="build")
    depends_on("fortran", type="build")

    # TODO: Compiler dependencies (GNU and Intel supported currently)
    # NOTE: check: wrf, arbor, py_scipy,

    # TODO: External dependencies (pfunit only in type test...)
    # depends_on("pfunit", when="+test")

    # TODO: Torch dependencies... pin version as well here??
    # NOTE: on specifying build options for this? cuda, etc...
    depends_on("py-torch ~cuda ~openmp ~mpi %gcc@13",
               type=("build", "run"))

    # TODO: depends on py-torchvision iff type is test ...

    # TODO: OpenMP dependencies

    # TODO: MPI dependencies -- only true if testing

    # TODO: CUDA dependencies ^^ see Torch

    def cmake_args(self):
        # FIXME: Add arguments other than
        # FIXME: CMAKE_INSTALL_PREFIX and CMAKE_BUILD_TYPE
        # FIXME: If not needed delete this function
        args = []
        return args
