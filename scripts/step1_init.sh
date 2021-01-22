# in another window: vault server -dev
export VAULT_ADDR='http://127.0.0.1:8200'

vault auth enable approle

vault policy write apps apps-policy.hcl

vault write auth/approle/role/paolo-role \
  secret_id_ttl=10m \
  token_num_uses=10 \
  secret_id_num_uses=5 \
  token_policies=apps

# Put application secrets
# vault secrets enable -path=secret/ kv-v2
vault kv put secret/paolo Hello=World
vault kv get secret/paolo
