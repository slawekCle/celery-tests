FROM python:3.12-slim-trixie

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

RUN curl -LsSf https://astral.sh/uv/install.sh | UV_INSTALL_DIR=/usr/local/bin sh
#ADD https://astral.sh/uv/install.sh /uv-installer.sh
#RUN sh /uv-installer.sh && rm /uv-installer.sh

# Nie buforuj wyjścia Pythona (logi od razu lecą na stdout/stderr)
ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

COPY pyproject.toml uv.lock ./

# ENV PATH="/root/.local/bin:/opt/venv/bin:$PATH"

RUN uv sync --locked

# Kopiujemy kod aplikacji
COPY ninja_worker/ /app/

# Domyślna komenda – uruchom program
CMD ["uv", "celkery", "-A", "ninja_worker.celery_app", "worker", "-l", "INFO"]