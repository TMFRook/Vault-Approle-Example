export VAULT_ADDR='http://127.0.0.1:8200'

vault unwrap ""
vault write auth/approle/login role_id="" secret_id=""
# vault token lookup s.wZnkQ4ekLHlg4dD1NAmJqRXk
VAULT_TOKEN="" vault kv get secret/paolo
