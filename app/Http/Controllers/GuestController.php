<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use App\Models\Docs;
use App\Models\Types;
use Illuminate\Support\Facades\Request;

class GuestController extends Controller
{
    // 
    public function index()
    {
    return Inertia::render('Guest/Guest', [
            'page' => Docs::paginate(5),
            'filters' => Request::all('search', 'trashed','types'),
            'types' => Types::orderBy('name')
                ->get()
                ->map
                ->only('id', 'name'),
            'docs' => Docs::with('typeDocs')
                ->orderBy('docs_name')
                ->filter(Request::only('search', 'trashed','types'))
                // ->where('types_id',1)
                ->paginate(5)
                ->withQueryString()
                ->through(function ($docs) {
                    return [
                        'id' => $docs->id,
                        'docs_name' => $docs->docs_name,
                        'types_id' => $docs->types_id,
                        'author'=>$docs->author,
                        'publisher'=>$docs->publisher,
                        'department'=>$docs->department,
                        'NIM'=>$docs->NIM,
                        'year'=>$docs->year,
                        'stok_buku'=>$docs->stok_buku,
                        'status'=>$docs->status
                    ];
                }),
        ]);
    }
}
