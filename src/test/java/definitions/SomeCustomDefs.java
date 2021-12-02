package definitions;

import io.cucumber.java.en.Given;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import static org.assertj.core.api.Assertions.*;
import static support.TestContext.getDriver;

public class SomeCustomDefs {
    @Given("I fill out first name {string} and last name {string}")
    public void iFillOutFirstNameAndLastName(final String fn, final String ln) {
        final WebElement wName = getDriver().findElement(By.xpath("//input[@id='name']"));
        wName.click();
        getDriver().findElement(By.xpath("//input[@id='firstName']")).sendKeys(fn);
        getDriver().findElement(By.xpath("//input[@id='lastName']")).sendKeys(ln);
        getDriver().findElement(By.xpath("//button[span/.='Save']")).click();
        assertThat(wName.getAttribute("value"))
                .isEqualTo(fn + " " + ln);
    }
}
