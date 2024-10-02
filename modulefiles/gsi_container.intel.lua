help([[
]])

prepend_path("MODULEPATH", "/opt/spack-stack/spack-stack-1.8.0/envs/unified-env/install/modulefiles/Core")

local stack_intel_ver=os.getenv("stack_intel_ver") or "2021.5.0"
local stack_impi_ver=os.getenv("stack_impi_ver") or "2021.5.0"
local cmake_ver=os.getenv("cmake_ver") or "3.23.1"
local prod_util_ver=os.getenv("prod_util_ver") or "2.1.1"

load(pathJoin("stack-intel", stack_intel_ver))
load(pathJoin("stack-intel-oneapi-mpi", stack_impi_ver))
--load(pathJoin("python", python_ver))
load(pathJoin("cmake", cmake_ver))

load("gsi_common")
load(pathJoin("prod_util", prod_util_ver))

pushenv("CFLAGS", "-march=ivybridge")
pushenv("FFLAGS", "-march=ivybridge")

setenv("CC","mpiicc")
setenv("CXX","mpiicpc")
setenv("FC","mpiifort")
setenv("F90","mpiifort")
setenv("F77","mpiifort")
--pushenv("GSI_BINARY_SOURCE_DIR", "/data/prod/glopara/fix/gsi/20240208")

whatis("Description: GSI environment on S4 with Intel Compilers")
