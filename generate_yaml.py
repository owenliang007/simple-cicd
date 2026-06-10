from jinja2 import Environment, FileSystemLoader
import os

env = Environment(
    loader=FileSystemLoader("templates"),
    trim_blocks=True,
    lstrip_blocks=True
)

template = env.get_template("config.yaml.j2")

output = template.render(
    tenant_name="DEV_Tenant",
    vrf_name="PROD_VRF",
    bd_name="WEB_BD"
)

os.makedirs("data", exist_ok=True)

with open("data/tenant.yaml", "w") as f:
    f.write(output)

print("tenant.yaml generated")
