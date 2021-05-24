# Chained commands
def bind_chained(key, *commands):
    config.bind(key, ' ;; '.join(commands))

