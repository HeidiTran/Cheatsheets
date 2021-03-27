## **I. Environment**
- List all existing virtual enviroment
```bash
conda env list
```

- Create a virtual enviroment
```bash
conda create -n your-env-name

# -n, --name: name of the environment
```

- Activate a virtual enviroment
```bash
conda activate your-env-name
```

- Deactive the current active environment
```bash
conda deactivate
```

- Delete an environment
```bash
conda env remove -n your-env-name

# -n, --name: name of the environment
```

- Export an environment
```bash
conda env export > environment.yml

# this will exports a list of dependencies to the file `environment.yml`
```

- Import an environment
```bash
conda env create -f environemnt.yml

# `environment.yml` is the file contains all the dependencies for the environment
```

## **II. Packages**
- List all packages in an environment
```bash
conda list -n your-env-name
```

- Install a package
```bash
conda install <package name>
```

- Update a package
```bash
conda update <package name>
```