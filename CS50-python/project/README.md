# Investment Data Analysis
    #### Video Demo:  https://youtu.be/-5kD9j57nPQ?si=IZuq8OqstP6nNOCq
    #### Description:

    This project aims to create a simple but firm tool for analyzing investment data. The script collects user input, validates the data, saves data, and performs basic statistical analysis to provide insights into investment returns, in linear regression.

    The project consists of two main files.

    project.py is the core script responsible for collecting, validating, and analyzing investment data. It guides the user through the process, ensuring data integrity and providing useful statistical insights.

    test_project.py contains the test suite for the project, leveraging the pytest framework to verify the correctness and reliability of the functions in project.py.


    The project.py script is structured around several key functions.

    main(): This function serves as the entry point for the script. It orchestrates the entire workflow, from collecting user input to performing statistical analysis. It ensures that each step is executed in the correct order, providing a seamless user experience.

    ask_pairs(): This function prompts the user for the number of investment data pairs they wish to input. It ensures that the input is a valid integer and requires at least 5 pairs to proceed.

    get_input(num_pairs): This function collects the specified number of investment data pairs from the user. Each pair consists of an investment amount in millions and a return percentage. The function parses the input strings into numerical values, handling common input errors as well.

    validate(data): The validate function checks each data pair to ensure that the investment amount is between $0 and $3000 million and that the return percentage is between 0% and 1000%. Invalid entries are excluded from further analysis.
    save_as_file(valid_data): This function writes the validated data to a text file named investment_data.txt. The file is formatted as a table, clean view.

    statistics(valid_data): This function performs linear regression on the validated data, calculating the correlation coefficient and p-value. It uses the scipy.stats’ linregress to find out important and necessary statistical results of linear regression.

    The test_project.py file contains a suite of tests designed to verify the functionality of the project.py script.
    test_validate(): This test checks that the validate() function correctly filters out invalid data pairs. It provides a mix of valid and invalid data and verifies that only valid entries are retained.

    test_statistics(): This test ensures that the statistics() function calculates the correlation coefficient and p-value correctly. It verifies that the function returns the expected results for a set of valid data.

    In conclusion, with the user’s willingness to linear regress the dataset of input, it will find the linear regression data analysis of the given ones. They will be given with p-values and coefficient, which will also save the dataset into a clean txt file. These style will be assured through test_project.py, and make sure the directory is cleaned up as well.

