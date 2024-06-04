import pytest
import subprocess
import testinfra


@pytest.fixture(scope="session")
def host(request):
    image = request.config.getoption("--image")
    # build local ./Dockerfile
    # subprocess.check_call(['docker', 'build', '-t', 'myimage', '.'])
    # run a container
    docker_id = subprocess.check_output(["docker", "run", "-d", image]).decode().strip()
    # return a testinfra connection to the container
    yield testinfra.get_host("docker://" + docker_id)
    # at the end of the test suite, destroy the container
    subprocess.check_call(["docker", "rm", "-f", docker_id])


def test_dig_package(host):
    "Check dig is installed"
    assert host.package("bind-tools").is_installed


def test_dig_works(host):
    "Check dig works"
    assert host.run("dig localhost").succeeded
