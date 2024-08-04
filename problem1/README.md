Here's the content formatted as a `README.md` file:

```markdown
# Deployment Configuration Script

## Description
This script automates the post-deployment optimization and configuration of Docker containers labeled `com.a2odev.app=sigma`. It sets a memory limit of 64MB and a restart policy of "No more than 5 times after failure" on matching containers.

## Requirements
- Docker installed and running on Ubuntu 22.04
- Script file `script.sh`

## Instructions
1. **Ensure Docker is installed and running on your Ubuntu 22.04 server**.
2. **Save the script as `script.sh`**.
3. **Make the script executable**:
   ```sh
   chmod +x script.sh
   ```
4. **Run the script**:
   ```sh
   ./script.sh
   ```

## Verification
- The script will find all Docker containers labeled `com.a2odev.app=sigma`.
- It will set a memory limit of 64MB on matching containers.
- It will set a restart policy of “No more than 5 times after failure” on matching containers.

## Example
### Before running the script
```sh
docker ps --filter "label=com.a2odev.app=sigma" --format "{{.ID}}: {{.Names}}"
```

### Run the script
```sh
./script.sh
```

### After running the script
```sh
docker inspect <container_id> | grep -E 'Memory|RestartPolicy'
```

## Git Repository

1. **Create a new repository on GitHub, GitLab, or Bitbucket**.
2. **Add your files to the repository**:
   ```sh
   git init
   git add script.sh README.md
   git commit -m "Initial commit"
   git remote add origin <repository_url>
   git push -u origin master
   ```
