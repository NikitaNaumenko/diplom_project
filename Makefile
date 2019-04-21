TAG := latest

app-stop:
	docker-compose stop
include frontend.mk
include make-compose.mk
include app-development.mk
include app-ansible.mk
include services/app/Makefile
