# Bazel Code Coverage Example

- Run

```
bazel coverage ... --combined_report=lcov
```

- Generate HTML

```
genhtml -o genhtml bazel-out/_coverage/_coverage_report.dat
```