local-env = local

local-start:
	ansible-playbook --vault-id password ansible/playbooks/init-env.yml -i ansible/$(local-env)-hosts.yml
	docker-compose up -d
	make docker-status

local-stop:
	docker-compose stop
	make docker-status

local-restart:
	make local-stop
	make local-start
	make docker-status

local-rebuild-soft:
	make local-stop
	ansible-playbook --vault-id password ansible/playbooks/init-env.yml -i ansible/$(local-env)-hosts.yml
	docker-compose up -d --force-recreate --build
	make docker-status

local-rebuild-force:
	rm -rfv temp/services
	make local-rebuild-soft

docker-bash:
	docker-compose exec workspace bash

docker-status:
	docker ps
	docker-compose ps