<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class Reports extends Model
{
    use SoftDeletes;

    public function account()
    {
        return $this->belongsTo(Account::class);
    }

    public function users()
    {
        return $this->belongsTo(User::class);
    }

    public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where('user_name', 'like', '%'.$search.'%')
            ->orWhere('department', 'like', '%'.$search.'%')
            ->orWhere('docs_name', 'like', '%'.$search.'%');
        })->when($filters['trashed'] ?? null, function ($query, $trashed) {
            if ($trashed === 'with') {
                $query->withTrashed();
            } elseif ($trashed === 'only') {
                $query->onlyTrashed();
            }
        })->when($filters['monthly'] ?? null, function ($query, $monthly) {
            $query->where('created_at',  'like', '%'.$monthly.'%');
        });
    }
}
