public class TemperatureCovert 
{
    public static Decimal FahrenheitToCelsius(Decimal fh)
    {
        decimal cs=(fh-32)*5/9;
        System.debug('Temperature in Celsius of  '+ fh +'F is  '+  cs.setScale(2));
        return cs.setScale(2);
    }
}