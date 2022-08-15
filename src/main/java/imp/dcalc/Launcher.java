package imp.dcalc;

import java.io.IOException;
import java.util.Comparator;
import java.util.Properties;

import static java.lang.String.format;
import static java.lang.String.valueOf;

public class Launcher {

    public static void main(String[] args) throws IOException {
        final Properties p = new Properties();
        p.load(Launcher.class.getResourceAsStream("/git.properties"));
        p.putAll(System.getProperties());
        p.entrySet()
                .stream().sorted(Comparator.comparing(e -> valueOf(e.getKey())))
                .forEach(e -> System.out.println(format("%s=%s", e.getKey(), e.getValue())));
    }
}
