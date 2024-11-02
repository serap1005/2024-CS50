import sys
import requests
{
  "time": {
    "updated": "Jul 26, 2024 05:20:59 UTC",
    "updatedISO": "2024-07-26T05:20:59+00:00",
    "updateduk": "Jul 26, 2024 at 06:20 BST"
  },
  "disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org",
  "chartName": "Bitcoin",
  "bpi": {
    "USD": {
      "code": "USD",
      "symbol": "&#36;",
      "rate": "66,946.11",
      "description": "United States Dollar",
      "rate_float": 66946.1101
    },
    "GBP": {
      "code": "GBP",
      "symbol": "&pound;",
      "rate": "52,042.032",
      "description": "British Pound Sterling",
      "rate_float": 52042.0315
    },
    "EUR": {
      "code": "EUR",
      "symbol": "&euro;",
      "rate": "61,652.146",
      "description": "Euro",
      "rate_float": 61652.1456
    }
  }
}

if len(sys.argv)==1:
    print("Missing command-line argument")
    sys.exit(1)
elif len(sys.argv)==2:
    while True:
        try:
            i=float(sys.argv[1])
            if i>0:
                response = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")
                data = response.json()
                bit_price = i*data['bpi']['USD']['rate_float']
                break
            else:
                False
        except ValueError:
            print("Command-line argument is not a number")
            sys.exit(1)

print(f"${bit_price:,.4f}")




