{{ cookiecutter.project_name }}
{{ '=' * cookiecutter.project_name | length }}
{{ cookiecutter.description }}

h2. Required environment tools a provided in scripts/provision_ubunto.sh and conda_env.yaml

You need to have conda installed in you development environment.

```
make install_env
conda activate {{ cookiecutter.project_slug }}
make test
```

h2. Versioning

The versioning scheme follow <major>.<minor>.<patch>[-<release>]

release is one of {prod, alpha, beta}, being prod optional.

So 1.0.0 is a prod (production) release

To increase the release version perform:

bumpversion minor
bumpversion major
bumpversion patch
bumpversion release

to reset the release, bump the patch ??


