FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9-slim AS builder

WORKDIR /app

COPY requirements.txt ./
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r requirements.txt

COPY ./app ./app

# Segunda etapa: Definición de un entorno de desarrollo
FROM builder as dev-envs

RUN --mount=type=secret,id=apt_sources,target=/etc/apt/sources.list
RUN --mount=type=secret,id=apt_preferences,target=/etc/apt/preferences

RUN apt-get update && apt-get install -y --no-install-recommends git
RUN useradd -s /bin/bash -m vscode
RUN groupadd docker
RUN usermod -aG docker vscode

# Tercera etapa: Imagen final
FROM dev-envs as final

# Definir un volumen
VOLUME /var/run/docker.sock:/var/run/docker.sock

# Ejemplo: Copiar archivos Docker CLI y Compose
COPY --from=gloursdocker/docker / /

# Ejemplo: Establecer variables de entorno
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
