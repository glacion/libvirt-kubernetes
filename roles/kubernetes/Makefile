test:
	../../.venv/bin/molecule converge
	../../.venv/bin/molecule idempotence
	../../.venv/bin/molecule --debug verify

ci:
	../../.venv/bin/molecule test
