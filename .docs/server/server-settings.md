# Server settings

### View

#### Parameter list

 Name | Type | Description
:-------|:-------|:-------
path | string | Path to the config file

```bash
ansible-vault view --vault-id password <path>
```

#### Example

```bash
ansible-vault view --vault-id password ansible/vars/global/vault.yml
```

### Decrypt

#### Parameter list

 Name | Type | Description
:-------|:-------|:-------
path | string | Path to the config file

```bash
ansible-vault decrypt --vault-id password <path>
```

#### Example

```bash
ansible-vault decrypt --vault-id password ansible/vars/global/vault.yml
```

### Encrypt

#### Parameter list

 Name | Type | Description
:-------|:-------|:-------
path | string | Path to the config file

```bash
ansible-vault encrypt --vault-id password <path>
```

#### Example

```bash
ansible-vault encrypt --vault-id password ansible/vars/global/vault.yml
```
