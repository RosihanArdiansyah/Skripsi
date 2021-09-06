<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\URL;
use League\Glide\Server;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;


class Docs extends Model
{
    use SoftDeletes;

     public function filesUrl()
    {
        if ($this->files) {
            return Storage::url($this->files,[
                'Content-Disposition' => 'inline;']);
        }
    }

    public function docsReports()
    {
        return $this->hasMany(Reports::class);
    }

    public function typeDocs()
    {
        return $this->belongsTo(Types::class);
    }

     public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where('docs_name', 'like', '%'.$search.'%')
                ->orWhere('author', 'like', '%'.$search.'%')
                ->orWhere('types_id', 'like', '%'.$search.'%')
                ->orWhere('department', 'like', '%'.$search.'%');
        })->when($filters['trashed'] ?? null, function ($query, $trashed) {
            if ($trashed === 'with') {
                $query->withTrashed();
            } elseif ($trashed === 'only') {
                $query->onlyTrashed();
            }
        })->when($filters['search'] ?? null, function ($query, $types) {
            $query->where('types_id', 'like', '%'.$types.'%');
        });
    } 
}
