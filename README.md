# Documentation System for Voluntary Fire Brigade

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone the repository
2. Inside the repository, run `docker-compose up`

This will start the following services:

- Frontend (Vue.js)
- Backend (FastAPI)
- Database (MySQL)
- PHPMyAdmin

The Database will be initialized with some dummy data.

## Services

- Frontend: `http://localhost`
- Backend Swagger UI: `http://localhost:8000/docs`
- Backend Redoc: `http://localhost:8000/redoc`
- PHPMyAdmin: `http://localhost:8080`

### Users

#### Frontend

- Admin: `admin` / `root`
- Respiratory Protection User: `resprot` / `resprot`
- Readonly User: `readonly` / `readonly`

#### DB

- Root: `root` / `feuerwehr`
- User: `fw_admin` / `fw_password`