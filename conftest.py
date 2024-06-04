from pytest import fixture


def pytest_addoption(parser):
    parser.addoption("--image", action="store")
