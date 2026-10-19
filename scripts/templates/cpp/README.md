# __NAME__

Isolated C++ sandbox. Configure an out-of-tree build directory so objects stay out of `src/`.

```powershell
cmake -S . -B build
cmake --build build
```

The binary is `build/__NAME__` with Makefiles or Ninja, and `build/Debug/__NAME__.exe` with the Visual Studio generator.

Open this folder in the dev container when you want a fixed GCC instead of the host compiler. The image is `mcr.microsoft.com/devcontainers/cpp:debian-12`.
