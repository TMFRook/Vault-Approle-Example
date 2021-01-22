export VAULT_ADDR='http://127.0.0.1:8200'

vault read auth/approle/role/paolo-role/role-id

vault write -f \
  --wrap-ttl=60m auth/approle/role/paolo-role/secret-id
