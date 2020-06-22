from selenium  import webdriver
import unittest
import HtmlTestRunner
from loguru import logger
class OrangeHRMTest(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")
        cls.driver.maximize_window()

    def test_homePageTitle(self):
        self.driver.get("https://opensource-demo.orangehrmlive.com")
        self.assertEqual("OrangeHRM",self.driver.title,"webpage is  not matching")

    def test_login(self):
        self.driver.get("https://opensource-demo.orangehrmlive.com")
        self.driver.find_element_by_name("txtUsername").send_keys("Admin")
        self.driver.find_element_by_name("txtPassword").send_keys("Admin")
        self.driver.find_element_by_name("Submit").click()
        self.assertEqual("OrangeHRM", self.driver.title, "webpage is  not matching")

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()
        logger.debug("Tests Completed....")

if __name__=='__main__':
    unittest.main(testRunner=HtmlTestRunner.HTMLTestRunner(output="..\\TestCaseReports"))
