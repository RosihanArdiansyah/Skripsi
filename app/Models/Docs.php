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

    public function coverUrl(array $attributes)
    {
        if ($this->cover) {
            return URL::to(App::make(Server::class)->fromPath($this->cover, $attributes));
        }
    }

     public function filesUrl()
    {
        if ($this->files) {
            $filename = Storage::path($this->files);
            return Storage::url($this->files,[
                'Content-Disposition' => 'inline;']);
        }
    }

     public function scopeFilter($query, array $filters)
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where('docs_name', 'like', '%'.$search.'%');
        })->when($filters['trashed'] ?? null, function ($query, $trashed) {
            if ($trashed === 'with') {
                $query->withTrashed();
            } elseif ($trashed === 'only') {
                $query->onlyTrashed();
            }
        });
    } 
}
