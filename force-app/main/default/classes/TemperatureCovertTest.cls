@isTest
public class TemperatureCovertTest
{  
	@isTest static void testWarmTemp()
    {
        decimal celsius=TemperatureCovert.FahrenheitToCelsius(70);
        System.assertEquals(21.11, celsius);
    }
    @isTest static void testFreezingPoint()
    {
        decimal celsius=TemperatureCovert.FahrenheitToCelsius(32);
        System.assertEquals(0, celsius);
    }
    @isTest static void testBoilingPoint()
    {
        decimal celsius=TemperatureCovert.FahrenheitToCelsius(212);
        System.assertEquals(100, celsius,'Boiling Point Temp is not expected');
    }
    @isTest static void testNegativeTemp()
    {
        decimal celsius=TemperatureCovert.FahrenheitToCelsius(-10);
        System.assertEquals(-23.33, celsius);
    }
}