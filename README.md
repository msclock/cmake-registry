# A cmake registry

This is a cmake modules registry based on vcpkg and accepts cmake module registration. Once a cmake module repository is registered, it will automatically detect and make a pr to update by renovate.

## Usage

Just register the cmake registry to the vcpkg configuration.

```json
{
  "registries": [
    {
      "kind": "git",
      "baseline": "b58077c46126bee7c5cd54c26a4b974055c21d2b",
      "repository": "https://github.com/msclock/cmake-registry",
      "packages": [
        "cmake-modules",
        "vcpkg-cmake-module"
      ]
    }
  ]
}
```
Add the modules to vcpkg configuration dependencies.

```json
{
  "dependencies": [
    "cmake-modules"
  ],
  "overrides": [
    {
      "name": "cmake-modules",
      "version": "1.3.0"
    }
  ]
}
```

There is a real [example](https://github.com/msclock/cpp-scaffold) can refer.
