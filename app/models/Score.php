<?php

namespace App\Models;

class Score {
    private $scores = [];
    
    // Save a student score
    public function saveScore($studentId, $score) {
        $this->scores[$studentId] = $score;
    }
    
    // Get a student's score
    public function getScore($studentId) {
        return isset($this->scores[$studentId]) ? $this->scores[$studentId] : null;
    }
    
    // Get all scores for an exam
    public function getExamScores($examId) {
        // This should ideally fetch scores from database based on exam ID
        return array_filter($this->scores, function($score, $studentId) use ($examId) {
            // Placeholder logic, implement logic based on examination criteria
            return true; 
        }, ARRAY_FILTER_USE_BOTH);
    }
    
    // Update rankings based on scores
    public function updateRankings() {
        arsort($this->scores);
        return array_keys($this->scores);
    }
    
    // Get top N scores
    public function getTopScores($n) {
        return array_slice($this->scores, 0, $n, true);
    }
}