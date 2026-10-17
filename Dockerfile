# Garage (https://garagehq.deuxfleurs.fr) with our garage.toml baked in.
#
# Garage's own config format requires a TOML file (default /etc/garage.toml);
# it does not support configuring most settings via environment variables.
# The homelab's Portainer deployer only ships a stack's docker-compose.yaml
# content (no sibling files), so a bind-mounted config file wouldn't be
# available on the Portainer host. Baking the config into the image avoids
# that problem entirely.
#
# Secrets (rpc_secret, admin_token) are intentionally NOT baked in here -
# they're supplied at container runtime via the GARAGE_RPC_SECRET and
# GARAGE_ADMIN_TOKEN environment variables, which Garage natively supports.
FROM dxflrs/garage:v2.4.1

COPY garage.toml /etc/garage.toml
