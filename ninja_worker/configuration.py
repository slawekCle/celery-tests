import os


broker_url = os.getenv("BROKER_URL", "amqp://user:pass@rabbitmq:5672//")
result_backend = os.getenv("RESULT_BACKEND", "rpc://")

task_serializer = 'json'
result_serializer = 'json'
accept_content = ['json']
timezone = 'Europe/Oslo'
enable_utc = True
include = [
    'ninja_worker.tasks',
]