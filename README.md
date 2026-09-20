# C.R.A.B.E. Website

The C.R.A.B.E. website represents the bicycle student club at École de technologie supérieure. It uses the Grav CMS to manage content and pages. This also replaces the Wordpress system that was used for the old C.R.A.B.E. site.

## Getting Started
### Prerequisites
* Visual Studio Code
* Git Bash

If you use Grav:
* PHP (>= 7.3.6)

If you use Docker:
* Docker Desktop

See the [Grav Docs](https://learn.getgrav.org/17/basics/requirements) for more information about setting up Grav and a web server (depends on your machine).

## Run Application

### Grav
From the root of the project, run the command to run the built-in PHP server:
```
bin/grav server
```

Access the website at `localhost:8000`.

The admin panel can be accessed at `localhost:8000/admin`.

### Docker
Build the Docker image using the following command:
```
docker-compose up --build
```

Recreate the following configuration files in the content folder as these are symbolic links on GitHub:
* git-sync.yaml
* security.yaml

Access the site at `localhost:8080`.

The CMS can be accessed at `localhost:8080/admin`. When prompted to login, use `admin` as the username and `admin123` as the password.

## Development
When working on the project, it is recommended that you create a new branch using the following command:

```
git checkout -b "name_of_branch"
```

Files should be added by specifying the path of the folder or file. Here is an example of how to push multiple files and folders:

```
git add themes README.md pages/05.equipe/team.md
git commit -m "your message here"
git push
```

> [!WARNING]  
> There are two symlink files that should not be pushed to GitHub under config: `plugins/git-sync.yaml` and `security.yaml`. Pushing updates of these files to GitHub will break the site when merged with main, as these files are pointers to its data (which we don't currently have). If these files change, contact Cédille to apply the corrections.

Once the changes are ready to be deployed to the website, create a pull request on GitHub.

## Deployment

Once the changes have been merged to main, navigate to the site console (`crabe.etsmtl.ca/admin`) and perform a manual Git sync.

## Acknowledgements
Developer:
* Benjamin Mah - C.R.A.B.E. President - [GitHub](https://github.com/benjaminm278)

DevOps Specialists:
* Julien Giguère - Cédille Co-president - [GitHub](https://github.com/JulienGiguere)
* Alexandre Baudouin Vegas - Cédille President - [GitHub](https://github.com/alexvegas22)
* Jonathan Lopez - Former Cédille President - [GitHub](https://github.com/SonOfLope)
