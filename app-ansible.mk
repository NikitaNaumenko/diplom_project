development-setup-env:
	ansible-playbook ansible/development.yml -i ansible/development -vv

development-ansible-vaults-encrypt:
	ansible-vault encrypt ansible/development/group_vars/all/vault.yml || true

development-ansible-vaults-decrypt:
	ansible-vault decrypt ansible/development/group_vars/all/vault.yml

development-ansible-vaults-edit:
	ansible-vault edit ansible/development/group_vars/all/vault.yml

ansible-vaults-encrypt:
	ansible-vault encrypt ansible/production/group_vars/all/vault.yml

ansible-vaults-decrypt:
	ansible-vault decrypt ansible/production/group_vars/all/vault.yml

ansible-vaults-edit:
	ansible-vault edit ansible/production/group_vars/all/vault.yml

