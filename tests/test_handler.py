from lambda_hello_world import index


def test_handler():
    assert index.handler() == "Hello, world!"
