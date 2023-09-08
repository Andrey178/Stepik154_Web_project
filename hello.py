def hello(environ, start_response):
    status = '200 OK'
    headers = [
        ('Content-Type', 'text/plain')
    ]
    body = b'Hello, world!\n'

    if len(environ['QUERY_STRING']) > 0:
        body = (environ['QUERY_STRING'].replace('&', '\n')).encode('utf-8')

    start_response(status, headers)
    return [ body ]