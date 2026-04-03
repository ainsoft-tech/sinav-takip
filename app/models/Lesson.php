<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    // Define the table associated with the model
    protected $table = 'lessons';

    // Define the fillable fields
    protected $fillable = ['title', 'description', 'duration'];

    // Create a new lesson
    public static function createLesson($data)
    {
        return self::create($data);
    }

    // Read a lesson by ID
    public static function readLesson($id)
    {
        return self::find($id);
    }

    // Update a lesson
    public static function updateLesson($id, $data)
    {
        $lesson = self::find($id);
        if ($lesson) {
            $lesson->update($data);
            return $lesson;
        }
        return null;
    }

    // Delete a lesson
    public static function deleteLesson($id)
    {
        return self::destroy($id);
    }
}
