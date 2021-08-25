# More infos under https://docs.pytest.org

import pytest

from src import visualization


@pytest.fixture
def my_fixture() -> str:
    """Creating a sample fixture.

    Returns:
        Sample Fixture
    """
    return "Fixture"


@pytest.mark.parametrize("input", range(3))
def test_visualization(input: int, my_fixture: str) -> None:
    """A Test for the visulization module.

    Args:
        input: Sample Input
        my_fixture: Sample Fixture
    """
    print(input)
    assert True
