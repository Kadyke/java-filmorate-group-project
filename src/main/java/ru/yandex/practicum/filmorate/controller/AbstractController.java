package ru.yandex.practicum.filmorate.controller;

import org.springframework.web.bind.annotation.*;
import ru.yandex.practicum.filmorate.model.Entity;
import ru.yandex.practicum.filmorate.service.Service;

import javax.validation.Valid;
import javax.validation.constraints.Positive;
import java.util.List;

public abstract class AbstractController<T extends Entity> implements Controller<T> {

    private final Service<T> service;

    protected AbstractController(Service<T> service) {
        this.service = service;
    }

    @GetMapping("{id}")
    public T get(@PathVariable @Positive Long id) {
        return service.findById(id);
    }

    @GetMapping
    public List<T> getAll() {
        return service.findAll();
    }

    @PostMapping
    public T add(@Valid @RequestBody T t) {
        return service.create(t);
    }

    @PutMapping
    public T update(@Valid @RequestBody T t) {
        return service.update(t);
    }
}