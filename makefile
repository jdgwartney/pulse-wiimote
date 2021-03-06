TARGET=tspwiimote
VERSION=0.1.0
TAR_FILE=dist/$(TARGET)-$(VERSION).tar.gz

install: build
	pip install $(TAR_FILE)

build: doc
	python setup.py sdist

doc:
	pandoc -f markdown -t plain README.md > README.txt

rebuild: clean install

upload: doc
	python setup.py sdist upload
	
clean:
	/bin/rm -rf build dist site MANIFEST README.txt
	pip freeze | grep "$(TARGET)==$(VERSION)" && pip uninstall -y $(TARGET)
