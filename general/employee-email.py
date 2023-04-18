import pyautogui
import openpyxl
import time

workbook = openpyxl.load_workbook('employee_data.xlsx')
sheet = workbook.active

for row in sheet.iter_rows(min_row=2, values_only=True):
    employee_name = row[0]
    employee_email = row[1]

    # Click on the "To" field in the email service and enter the employee email
    pyautogui.click(100, 100)  # replace with actual coordinates
    pyautogui.typewrite(employee_email)

    # Click on the "Subject" field and enter the employee name
    pyautogui.press('tab')
    pyautogui.typewrite(f"Welcome {employee_name}")

    # Click on the email body and enter the message
    pyautogui.press('tab', presses=2)
    pyautogui.typewrite(f"Dear {employee_name}, welcome to our company!")

    # Send the email
    pyautogui.hotkey('ctrl', 'enter')

    # Wait for a few seconds before moving on to the next employee
    time.sleep(5)
