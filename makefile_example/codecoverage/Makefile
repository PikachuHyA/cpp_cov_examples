all:

report: /usr/bin/lcov
	lcov --directory .. --capture --output-file app.info
	genhtml app.info -o html

clean:
	rm -rf html *.info

.PHONY: report