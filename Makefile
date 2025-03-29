.PHONY: install uninstall reinstall publish test clean

install:
	pip install -e .

uninstall:
	pip uninstall -y jobinfo
	pipx uninstall jobinfo

reinstall: uninstall install

publish:
	python3 -m build
	twine upload dist/*

test:
	pytest tests/

clean:
	rm -fr build/ dist/ ./src/*.egg-info/ *.egg-info/ egg-info/ __pycache__/ .pytest_cache/
	find . -type d -name '__pycache__' -exec rm -fr {} +
