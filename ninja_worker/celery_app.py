from celery import Celery

app = Celery('ninja_worker')
app.config_from_object('ninja_worker.configuration')

app.conf.update(
    result_expires=3600,
)

if __name__ == '__main__':
    app.start()
