from bank import value

def main():
    test_value()

def test_value():
    assert value("Hello!") == 0
    assert value("Hey") == 20
    assert value("hey!") == 20
    assert value("cherry") == 100
    assert value("Yo") == 100
    assert value("Hello, there!") == 0
    assert value("hyped up!") == 20

if __name__ == "__main__":
    main()






