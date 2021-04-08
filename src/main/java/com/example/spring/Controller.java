package com.example.spring;

import org.springframework.http.CacheControl;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.ArrayList;
import java.util.List;

@RestController
class HelloController {

    @RequestMapping("/")
    public String home() {
        return "Greetings from Spring Boot!";
    }

    @GetMapping(path = "/json", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<String>> getJSON() {
        List<String> list = new ArrayList<>();
        list.add("One");
        list.add("Two");
        list.add("Three");
        return ResponseEntity
                .ok()
                .cacheControl(CacheControl.noCache())
                .body(list);
    }
}