init: .git/hooks/pre-commit

pre-commit: .git/hooks/pre-commit
	find . -type f | xargs chmod 644
	pre-commit run --all-files

.git/hooks/pre-commit:
	pre-commit install --install-hooks
