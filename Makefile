TAG := latest

app-stop:
	docker-compose stop
include frontend.mk
include app-development.mk
include app-ansible.mk
include services/app/Makefile
