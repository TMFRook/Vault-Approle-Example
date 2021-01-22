vault unwrap "s.5Vgnk9UnoPgnAG3M7HuKv6gU"
vault write auth/approle/login role_id="fca5a97b-69ee-8c9a-4814-9c8547056e9a" secret_id="20d15017-a980-f753-ce99-c82de60118b9"
# vault token lookup s.wZnkQ4ekLHlg4dD1NAmJqRXk
VAULT_TOKEN="s.wZnkQ4ekLHlg4dD1NAmJqRXk" vault kv get secret/paolo
