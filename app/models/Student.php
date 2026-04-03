<?php
class Student {
    private $db;

    public function __construct($database) {
        $this->db = $database;
    }

    // Create a new student record
    public function create($name, $email) {
        $stmt = $this->db->prepare("INSERT INTO students (name, email) VALUES (?, ?)");
        return $stmt->execute([$name, $email]);
    }

    // Read student record by ID
    public function read($id) {
        $stmt = $this->db->prepare("SELECT * FROM students WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    // Update a student record
    public function update($id, $name, $email) {
        $stmt = $this->db->prepare("UPDATE students SET name = ?, email = ? WHERE id = ?");
        return $stmt->execute([$name, $email, $id]);
    }

    // Delete a student record
    public function delete($id) {
        $stmt = $this->db->prepare("DELETE FROM students WHERE id = ?");
        return $stmt->execute([$id]);
    }
}