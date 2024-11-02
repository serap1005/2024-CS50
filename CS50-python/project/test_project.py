import pytest
import numpy as np
from project.project import validate, statistics

def test_validate():
    test_data=[
        (1000,10),
        (294,72),
        (400,30),
        (200,-300),
        (-90,10),
        (2000,1110),
        (1340,20)

    ]

    expected=[
        (1000,10),
        (294,72),
        (400,30),
        (1340,20)
    ]

    result=validate(test_data)
    assert result==expected

def test_statistics():
    valid_data=[
        (1000,10),
        (2000,20),
        (3000,30)
    ]

    result=statistics(valid_data)
    assert result is not None

    r_value, p_value=result
    assert round(r_value,4)==1.0000
    assert round(p_value,4)==0.0000


