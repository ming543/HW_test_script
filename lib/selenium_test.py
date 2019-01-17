import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
UserName = ('samlee')
UserPass = ('Aa0988228843')

driver = webdriver.Firefox(executable_path=r'/run/initramfs/memory/data/HW_test_script/tools/geckodriver')
driver.get("http://eip.efco.com.tw/tw/index.htm?lang=tw")

#elem = driver.find_element_by_xpath("//frame[@name='txtAccount']").send_keys("samlee")
frame = driver.find_element_by_xpath('//frame[@name="loginFrameData"]')
#driver.switch_to.frame(frame)
#elem = driver.find_element_by_xpath("//*[@name='txtAccount']")
#elem = driver.find_element_by_name('txtAccount')
elem.clear()
elem.send_keys("samlee")

elem2 = driver.find_element_by_xpath("//cla[@name='txtPassword']")
elem2.clear()
elem2.send_keys("Aa0988228843")
elem2.send_keys(Keys.RETURN)
time.sleep(5)
print(driver.title)
print(driver.page_source)

#time.sleep(5)
driver.close()