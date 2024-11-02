from numb3rs import validate


def test_validate():
    assert validate("255.255.255.255")==True
    assert validate("512.412.512.421")==False
    assert validate("dog")==False
    assert validate("1.1.1.1")==True
    assert validate("199.911.288.883")==False
