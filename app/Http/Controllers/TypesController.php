<?php

namespace App\Http\Controllers;

use App\Models\Types;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class TypesController extends Controller
{
    public function index()
    {
    return Inertia::render('Types/Index', [
            'page' => Types::paginate(5),
            'filters' => Request::all('search', 'trashed'),
            'types' => Auth::user()->account->types()
                ->orderBy('name')
                ->filter(Request::only('search', 'trashed'))
                ->paginate(5)
                ->withQueryString()
                ->through(function ($Types) {
                    return [
                        'id' => $Types->id,
                        'name' => $Types->name,
                    ];
                }),
        ]);
    }

    public function create()
    {
        return Inertia::render('Types/Create');
    }

    public function store()
    {
        
        Request::validate([
                'name' => ['required', 'max:100'],
        ]);
     
        Auth::user()->account->types()->create([
            'name' => Request::get('name'),
        ]);

        return Redirect::route('types')->with('success', 'Dokumen ditambahkan');
    }

    public function edit(Types $Type)
    {
        return Inertia::render('Types/Edit', [
            'type' => [
                'id' => $Type->id,
                'name' => $Type->name,
            ],
        ]);
    }

    public function show(Types $Type)
    {
        
    }

    public function update(Types $Type)
    {
        Request::validate([
            'name' => ['required', 'max:100'],
        ]);

        $Type->update(Request::only('name'));

        return Redirect::back()->with('success', 'Dokumen berhasil diubah.');
    }

    public function destroy(Types $Type)
    {
        $Type->delete();

        return Redirect::back()->with('success', 'Dokumen dihapus.');
    }

    public function restore(Types $Type)
    {
        $Type->restore();

        return Redirect::back()->with('success', 'Dokumen dikembailkan.');
    } 
}
