import pytest

from fuel import convert
from fuel import gauge


def test_convert():
    assert convert("2/4") == 50
    assert convert("3/4") == 75
    assert convert("1/4") == 25
    assert convert("1/3") == 33

def test_gauge():
    assert gauge(1) == "E"
    assert gauge(50) == "50%"
    assert gauge(99) == "F"
    assert gauge(100) == "F"

def test_zero_division():
    with pytest.raises(ZeroDivisionError):
        convert("1/0")

def test_value_error():
    with pytest.raises(ValueError):
        convert("2/1")
