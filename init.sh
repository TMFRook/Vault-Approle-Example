# in another window: vault server -dev
export VAULT_ADDR='http://127.0.0.1:8200'
vault auth enable approle
vault write auth/approle/role/paolo-role
vault write auth/approle/role/paolo-role secret_id_ttl=10m token_num_uses=10
vault write -f auth/approle/role/paolo-role/secret-id
vault read auth/approle/role/paolo-role/secret-id
ROLE_ID=$(vault read -format json auth/approle/role/paolo-role/role-id  | jq '.data.role_id')
vault write auth/approle/login role_id="f0173029-d359-58e0-62c8-3a305a698b4e" \\n  secret_id="c02fe8da-6317-62f0-f9b2-12a50e55e21f"
pbpaste | tee apps-policy.hcl
vault policy write apps apps-policy.hcl
vault secrets enable -path=secret kv-v2
vault kv put secret/dev username="webapp" password="my-long-password"
vault token create -policy=apps -wrap-ttl=1h
