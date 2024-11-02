from twttr import shorten

def main():
    test_shorten()

def test_shorten():
    assert shorten("apple") == "ppl"
    assert shorten("banana") == "bnn"
    assert shorten("banana3") == "bnn3"
    assert shorten("cherry") == "chrry"
    assert shorten("dat,e") == "dt,"
    assert shorten("elephant") == "lphnt"
    assert shorten("igloo") == "gl"
    assert shorten("OrangE") == "rng"
    assert shorten("umbrella") == "mbrll"

if __name__ == "__main__":
    main()
