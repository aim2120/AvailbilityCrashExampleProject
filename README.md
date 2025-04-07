# Availability Crash Example

This project demonstrates differences in crash behavior when using `objc_enumerateClasses` vs. `objc_getClassList` to find classes exposed to the ObjC runtime, where some of those classes are marked with `@available` annotations.

## Reproduction Steps

1. Generate the project with `tuist generate`.
2. Run the app on a PHYSICAL device running an iOS version <18.
3. Observe that the code crashes on `objc_getClassList`.
4. Comment out the calls to `countClasses_getClassList`.
5. Observe that a crash does not occur when only `objc_enumerateClasses` is used.

## Notes

* The crash occurs specifically due to the inclusion of an iOS 18+ API within the classes with `@availabile` annotations.
* This example includes classes that are defined both at the project level and internally within a package dependency.
