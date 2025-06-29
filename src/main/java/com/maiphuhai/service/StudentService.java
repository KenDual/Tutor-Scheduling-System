
package com.maiphuhai.service;

import com.maiphuhai.model.Student;
import com.maiphuhai.repository.StudentRepository;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public Optional<Student> findById(int id) {
        return studentRepository.findById(id);
    }
}