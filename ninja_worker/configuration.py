broker_url = "amqp://user:pass@localhost:5672//"
result_backend = 'rpc://'

task_serializer = 'json'
result_serializer = 'json'
accept_content = ['json']
timezone = 'Europe/Oslo'
enable_utc = True
include = [
    'ninja_worker.tasks',
]