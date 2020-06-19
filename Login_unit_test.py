from selenium import webdriver
import time
import unittest

class LoginTest(unittest.TestCase):

    @classmethod
    def setUpCalss(cls):
        cls.driver = webdriver.Chrome(executable_path="C:\chromedriver_win32\chromedriver")
        cls.driver.implicitly_wait(10)
        cls.driver.maximize_window()

    def test_login_valid(self):
        self.driver.get('https://opensource-demo.orangehrmlive.com/')

        self.driver.find_element_by_id("txtUsername").send_keys("Admin")
        self.driver.find_element_by_id("txtPassword").send_keys("admin123")
        self.driver.find_element_by_id("btnLogin").click()
        self.driver.find_element_by_id("welcome").click()
        self.driver.find_element_by_link_text("Logout").click()

        time.sleep(10)

    @classmethod
    def tearDownClass(cls):
        cls.driver.close()
        cls.driver.quit()
        print("Test Completed")
