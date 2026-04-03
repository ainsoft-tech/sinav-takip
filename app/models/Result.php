<?php

namespace App\Models;

class Result {
    public function saveAnswer($studentId, $examId, $answer) {
        // Logic to save the answer of a student for a specific exam
    }

    public function getStudentExamResults($studentId, $examId) {
        // Logic to retrieve the exam results for a specific student
    }

    public function getExamStatistics($examId) {
        // Logic to gather statistics about a specific exam
    }

    public function delete($resultId) {
        // Logic to delete a specific exam result
    }
}