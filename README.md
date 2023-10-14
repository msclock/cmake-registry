# A cmake registry

This is a cmake modules registry based on vcpkg and accepts cmake module registration.

## Usage

Just register the cmake registry to the vcpkg configuration.

```json
{
  "registries": [
    {
      "kind": "git",
      "baseline": "8c971ad168027d4c3acbd2b3a2752b80e0859fef",
      "repository": "https://github.com/msclock/cmake-registry",
      "packages": [
        "cmake-modules",
        "vcpkg-cmake-module"
      ]
    }
  ]
}
```
Add the modules to vcpkg dependencies.

```json
{
  "dependencies": [
    "cmake-modules"
  ]
}
```

There is a real [example](https://github.com/msclock/cpp-scaffold) can refer.
