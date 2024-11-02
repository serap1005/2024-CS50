import numpy as np
from scipy.stats import linregress

def main():
    num_pairs=ask_pairs()
    data=get_input(num_pairs)
    valid_data=validate(data)
    save_as_file(valid_data)
    statistics(valid_data)

def ask_pairs():
    while True:
        try:
            num_pairs=int(input("Enter the number of pairs to input: "))
            if num_pairs < 5:
                print("Number of pairs should be at least 5.")
                continue
            return num_pairs
        except ValueError:
            print("Invalid input. Please enter a valid integer greater than 5.")
        except EOFError:
            print("Input interrupted. Exiting...")
            exit(0)
        print(f"You will now enter {num_pairs} pairs of findings. Format is $x, y%.")


def get_input(num_pairs):
    ###get  inputs
    inputs=[]

    for i in range(num_pairs):
        while True:
            try:
                pair_input=input(f"Enter pair {i+1} of investment findings: ")
                x_str, y_str=pair_input.split(",")

                x=int(x_str.strip().lstrip("$"))
                y=int(y_str.strip().rstrip("%"))

                inputs.append((x,y))
                break
            except ValueError:
                print("Invalid input. Please follow the format of $x,y%.")
            except EOFError:
                print("Input interrupted. Exiting...")
                exit(0)
    return inputs

def validate(data):
    ###check validity x is in millions till 3000, and y can go up to 1000.
    valid_data=[]
    for x,y in data:
        if 0<=x<=3000 and 0<=y<=1000:
            valid_data.append((x,y))
        else:
            print(f"Invalid data encountered: (${x},{y}%)/")
            print(f"Check Range. Investment should be between $0m and $3000m. Return on Investment should be between 0% and 1000%.")
    return valid_data

def save_as_file(valid_data):

    ###append to table
    with open('investment_data.txt', 'w') as file:
        file.write(f"{'Investment':<15}{'Return on Investment (%)':<25}\n")
        file.write('-'*40+'\n')
        for x,y in valid_data:
            file.write(f"${x:<14}{y:25}%\n")
    print("Data successfully saved to 'investment_data.txt'.")


def statistics(valid_data):
    ###calculate p value and coeff
    if len(valid_data)<2:
        print("No valid data to calculate statistics.")
        return

    table=np.array(valid_data)
    x=table[:,0]
    y=table[:,1]

    slope, intercept, r_value, p_value, std_err= linregress(x,y)
    print(f"Coefficient (r): {r_value:.4f}")
    print(f"P-value: {p_value:.4f}")
    return r_value, p_value


if __name__ == "__main__":
    main()

