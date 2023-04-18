import csv
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep

# open the CSV file containing the data to be entered
with open('data.csv') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    
    # open the web page where the data will be entered
    driver = webdriver.Chrome()
    driver.get('http://192.168.1.1:6000')
    
    # iterate over each row of the CSV file
    for row in csv_reader:
        # find the input elements on the web page by their IDs
        first_name = driver.find_element_by_id('first-name')
        last_name = driver.find_element_by_id('last-name')
        email = driver.find_element_by_id('email')
        
        # enter the data from the current row of the CSV file into the input elements
        first_name.send_keys(row['First Name'])
        last_name.send_keys(row['Last Name'])
        email.send_keys(row['Email'])
        
        # submit the form
        submit_button = driver.find_element_by_id('submit-button')
        submit_button.click()
        
        # wait for the success message to appear on the page
        success_message = driver.find_element_by_id('success-message')
        while not success_message.is_displayed():
            sleep(1)
        
        # clear the input elements for the next row of data
        first_name.clear()
        last_name.clear()
        email.clear()
        
    # close the web driver
    driver.quit()
