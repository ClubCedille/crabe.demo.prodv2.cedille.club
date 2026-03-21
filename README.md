# C.R.A.B.E. Website

The C.R.A.B.E. website represents the bicycle club at École de technologie supérieure. It uses the Grav CMS to manage content and pages. This also replaces the Wordpress system that was used for the old C.R.A.B.E. site.

## Getting Started
### Prequisites
If you will run the application using the Grav files already on your computer:
* PHP (>= 7.3.6)
* Web Server

If you will use Docker:
* Docker Desktop

See the [Grav Docs](https://learn.getgrav.org/17/basics/requirements) for more information about setting up Grav and a web server (depends on your machine).

### Run Application

#### With Docker
Build the Docker image using the following command:
```
docker-compose up --build
```

Recreate the following configuration files in the content folder as these are symbolic links on GitHub:
* git-sync.yaml
* security.yaml

Access the site at `localhost:8080`.

The CMS can be accessed at `localhost:8080/admin`. When prompted to login, use `admin` as the username and `admin123` as the password.

#### Without Docker
Generally speaking, the web server needs to be started to be able to access the website at `localhost:8000`.

The CMS can be accessed at `localhost:8000/admin`.

## Development
When working on the project, it is recommended that you create a new branch. Once the changes are ready to be deployed, merge to the `main` branch.

Then, visit the site console (`crabe.etsmtl.ca/admin` and perform a manual Git sync).

## Acknowledgements
Developer:
* Benjamin Mah - C.R.A.B.E. Captain - [GitHub](https://github.com/benjaminm278)

DevOps Specialists:
* Julien Giguère - Cédille Co-captain - [GitHub](https://github.com/JulienGiguere)
* Alexandre Baudouin Vegas - Cédille Captain - [GitHub](https://github.com/alexvegas22)
* Jonathan Lopez - Former Cédille Captain - [GitHub](https://github.com/SonOfLope)