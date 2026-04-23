# MySQL 8.4.8 LTS local bajo demanda

## Flujo recomendado

Primero entra al directorio de la entrega:

```bash
cd assignments/20260315
```

1. Levantar MySQL:

```bash
./scripts/mysql-up.sh
```

2. Crear la base `sis122-20260315` y cargar esquema + inserts:

```bash
./scripts/mysql-reset-and-load.sh
```

3. Verificar consultas:

```bash
./scripts/mysql-verify.sh
```

4. Abrir shell SQL:

```bash
./scripts/mysql-shell.sh
```

5. Parar el contenedor cuando termines:

```bash
./scripts/mysql-down.sh
```

6. Borrar todo, incluyendo datos:

```bash
./scripts/mysql-destroy.sh
```

## DataGrip

- Version fijada: `MySQL Community Server 8.4.8 LTS`
- Host: `127.0.0.1`
- Port: `3307`
- User: `sis122`
- Password: `sis122_local_dev`
- Database: `sis122-20260315`
- Authentication: `User & Password`
- SSL: `No`
- JDBC URL: `jdbc:mysql://127.0.0.1:3307/sis122-20260315?useSSL=false&allowPublicKeyRetrieval=true&connectTimeout=5000&socketTimeout=10000`
