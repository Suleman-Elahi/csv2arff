all: clean test

dev:
	pip install -r requirements.txt -r requirements-dev.txt

# auto correct indentation issues
fix:
	autopep8 csv2arff --recursive --in-place
	autopep8 tests --recursive --in-place

lint:
	flake8 csv2arff/csv2arff.py setup.py tests/test_csv2arff.py

test:
	pytest --pep8 --cov -s

clean:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	find . -name '*~' -exec rm --force  {} +

.PHONY: clean test
