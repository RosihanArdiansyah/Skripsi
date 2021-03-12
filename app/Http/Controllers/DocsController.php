<?php

namespace App\Http\Controllers;

use App\Models\Docs;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class DocsController extends Controller
{
     public function index()
    {
     return Inertia::render('Documents/Index', [
            'filters' => Request::all('search', 'trashed'),
            'docs' => Auth::user()->account->docs()
                ->orderBy('docs_name')
                ->filter(Request::only('search', 'trashed'))
                ->paginate()
                ->withQueryString()
                ->through(function ($docs) {
                    return [
                        'id' => $docs->id,
                        'docs_name' => $docs->docs_name,
                        'deleted_at' => $docs->deleted_at,
                    ];
                }),
        ]);
    }

    public function create()
    {
        return Inertia::render('Documents/Create');
    }

    public function store()
    {
        Request::validate([
                'docs_name' => ['required', 'max:100'],
                'coverImg' => ['nullable', 'image'],
                'pdf' => ['nullable', 'file'],
        ]);
     
        Auth::user()->account->docs()->create([
            'docs_name' => Request::get('docs_name'),
            'cover' => Request::file('coverImg') ? Request::file('coverImg')->store('docs') : null,
            'files' => Request::file('pdf') ? Request::file('pdf')->store('docs') : null,
        ]);

        return Redirect::route('docs')->with('success', 'doc created.');
    }

    public function edit(Docs $doc)
    {
        return Inertia::render('Documents/Edit', [
            'doc' => [
                'id' => $doc->id,
                'docs_name' => $doc->docs_name,
                'deleted_at' => $doc->deleted_at,
            ],
        ]);
    }

    public function update(Docs $doc)
    {
        $doc->update(
            Request::validate([
                'docs_name' => ['required', 'max:100'],
                'cover' => ['nullable', 'image'],
                'files' => ['nullable', 'file'],
            ])
        );

        return Redirect::back()->with('success', 'doc updated.');
    }

    public function destroy(Docs $doc)
    {
        $doc->delete();

        return Redirect::back()->with('success', 'doc deleted.');
    }

    public function restore(Docs $doc)
    {
        $doc->restore();

        return Redirect::back()->with('success', 'doc restored.');
    } 
}
