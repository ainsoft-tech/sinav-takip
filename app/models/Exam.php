<?php

class Exam {
    private $db;
    private $table = 'exams';

    public function __construct($database) {
        $this->db = $database;
    }

    // Create
    public function create($data) {
        // Code to save exam in the database
    }

    // Read
    public function read($id) {
        // Code to read an exam by ID
    }

    // Get All
    public function getAll() {
        // Code to get all exams
    }

    // Update
    public function update($id, $data) {
        // Code to update an exam by ID
    }

    // Delete
    public function delete($id) {
        // Code to delete an exam by ID
    }

    // Add Answer Key
    public function addAnswerKey($examId, $answerKey) {
        // Code to add answer key for a specific exam
    }

    // Get Answer Key
    public function getAnswerKey($examId) {
        // Code to get answer key for a specific exam
    }
}
