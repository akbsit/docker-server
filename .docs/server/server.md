# Server

### Start

#### Parameter list

 Name | Type | Description
:-------|:-------|:-------
local-env | string | environment `local`

```bash
make local-start <local-env=local>
```

### Stop

```bash
make local-stop
```

### Restart

#### Parameter list

 Name | Type | Description
:-------|:-------|:-------
local-env | string | environment `local`

```bash
make local-restart <local-env=local>
```

### Rebuild

#### Parameter list

 Name | Type | Description
:-------|:-------|:-------
local-env | string | environment `local`

```bash
make local-rebuild <local-env=local>
```

### Open console workspace

```bash
make docker-bash
```

### View container statuses

```bash
make docker-status
```
