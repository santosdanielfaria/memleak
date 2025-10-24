package com.example.memoryleak;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
@RestController
public class MemoryLeakApplication {

    private final List<byte[]> heap = new ArrayList<>();

    @GetMapping("/leak")
    public String leak(@RequestParam(defaultValue = "5") int mb) {
        heap.add(new byte[mb * 1024 * 1024]);
        return "Allocated ~" + heap.size() * mb + " MB total.";
    }

    @GetMapping("/reset")
    public String reset() {
        heap.clear();
        System.gc();
        return "Heap cleared and GC requested.";
    }

    @GetMapping("/health")
    public String health() {
        return "OK";
    }

    public static void main(String[] args) {
        SpringApplication.run(MemoryLeakApplication.class, args);
    }
}
