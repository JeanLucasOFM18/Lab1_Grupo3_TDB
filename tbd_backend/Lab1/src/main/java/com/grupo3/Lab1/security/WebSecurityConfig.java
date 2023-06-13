package com.grupo3.Lab1.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
public class WebSecurityConfig {


    @Autowired
    private JwtRequestFilter jwtRequestFilter;

    @Bean
    SecurityFilterChain web(HttpSecurity http) throws Exception {
        http
                .csrf().disable() // (2)
                .authorizeHttpRequests((authorize) -> authorize

                        .requestMatchers("/register/**").permitAll()
                        .requestMatchers("/login/**").permitAll()
                        .requestMatchers("/usuario/**").permitAll()
                        .requestMatchers("/eme_habilidad/**").permitAll()
                        .requestMatchers("/emergencias/**").permitAll()
                        .requestMatchers("/estados_tarea/**").permitAll()
                        .requestMatchers("/habilidades/**").permitAll()
                        .requestMatchers("/institucion/**").permitAll()
                        .requestMatchers("/ranking/**").permitAll()
                        .requestMatchers("/tarea_habilidad/**").permitAll()
                        .requestMatchers("/tareas/**").permitAll()
                        .requestMatchers("/vol_habilidad/**").permitAll()
                        .requestMatchers("/voluntario/**").permitAll()
                        .requestMatchers("/reporte/**").permitAll()
                        .anyRequest().authenticated()

                        // Para testear Spring Security en backend eliminar bloque de código de arriba y reemplazar por bloque de abajo.
                        /*
                        .requestMatchers("/register/**").permitAll()
                        .requestMatchers("/login/**").permitAll()
                        .requestMatchers("/usuario/**").hasRole("ADMIN")
                        .requestMatchers("/eme_habilidad/**").hasRole("ADMIN")
                        .requestMatchers("/emergencias/**").hasRole("ADMIN")
                        .requestMatchers("/estados_tarea/**").hasRole("ADMIN")
                        .requestMatchers("/habilidades/**").hasRole("ADMIN")
                        .requestMatchers("/institucion/**").hasRole("ADMIN")
                        .requestMatchers("/ranking/**").hasRole("ADMIN")
                        .requestMatchers("/tarea_habilidad/**").hasRole("ADMIN")
                        .requestMatchers("/tareas/**").hasRole("ADMIN")
                        .requestMatchers("/vol_habilidad/**").hasRole("ADMIN")
                        .requestMatchers("/voluntario/**").hasRole("ADMIN")
                        .requestMatchers("/reporte/**").hasRole("ADMIN")
                        .anyRequest().authenticated()
                        */

                )
                .cors(cors -> cors.disable())
                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class)
                .sessionManagement((session) -> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                );
        ;
        return http.build();
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    AuthenticationManager authenticationManager(AuthenticationConfiguration
                                                        authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

}