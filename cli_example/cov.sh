set -ex
lcov --directory . --capture --output-file app.info
genhtml app.info -o html

