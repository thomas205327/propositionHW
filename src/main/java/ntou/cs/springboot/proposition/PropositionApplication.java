package ntou.cs.springboot.proposition;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class PropositionApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(PropositionApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(PropositionApplication.class);
    }
}
