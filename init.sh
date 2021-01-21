vault status
export VAULT_ADDR='http://127.0.0.1:8200'
vault status
vault list auth/approle/role
vault read  auth/approle/role/my-role
hgrep vault | grep role
vault auth enable approle
vault write auth/approle/role/paolo-role
vault write auth/approle/role/paolo-role secret_id_ttl=10m token_num_uses=10
vault get auth/approle/role/paolo-role
vault read auth/approle/role/paolo-role
vault list auth/approle/role
vault write -f auth/approle/role/my-role/secret-id
vault write -f auth/approle/role/paolo-role/secret-id
vault read auth/approle/role/paolo-role/secret-id
vault write auth/approle/login role_id="" \\n  secret_id="c02fe8da-6317-62f0-f9b2-12a50e55e21f"
vault read auth/approle/role/my-role/role-id
vault read auth/approle/role/paolo-role/role-id
vault write auth/approle/login role_id="f0173029-d359-58e0-62c8-3a305a698b4e" \\n  secret_id="c02fe8da-6317-62f0-f9b2-12a50e55e21f"
pbpaste | tee apps-policy.hcl
vault policy write apps apps-policy.hcl
vault secrets enable -path=secret kv-v2
vault kv put secret/dev username="webapp" password="my-long-password"
vault token create -policy=apps -wrap-ttl=1h
