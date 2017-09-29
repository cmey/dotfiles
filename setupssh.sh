# based off of https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t rsa -b 4096 -C "cmeyer@butterflynetinc.com"
cat <<EOT >> ~/.ssh/config
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
EOT
ssh-add -K ~/.ssh/id_rsa

