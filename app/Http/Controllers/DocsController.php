<?php

namespace App\Http\Controllers;

use App\Models\Docs;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Response;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;
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
                        'coverImg' => $docs->coverUrl(['w' => 100, 'h' => 160, 'center']),
                        'pdf'=> $docs->files,
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
        $imgName = Request::file('coverImg')->getClientOriginalName();
        $docName = Request::file('pdf')->getClientOriginalName();
        Request::validate([
                'docs_name' => ['required', 'max:100'],
                'coverImg' => ['nullable', 'image'],
                'pdf' => ['nullable', 'file'],
        ]);
     
        Auth::user()->account->docs()->create([
            'docs_name' => Request::get('docs_name'),
            'cover' => Request::file('coverImg') ? Request::file('coverImg')->storePubliclyAs('docs',$imgName) : null,
            'files' => Request::file('pdf') ? Request::file('pdf')->storePubliclyAs('docs',$docName) : null,
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
                'coverImg' => $doc->coverUrl(['w' => 60, 'h' => 60, 'fit' => 'crop']),
                'filePdf' => $doc->files,
            ],
        ]);
    }

     public function show(Docs $doc)
    {
        Storage::disk('local');
        return Inertia::render('Documents/Show', [
            'doc' => [
                'id' => $doc->id,
                'docs_name' => $doc->docs_name,
                'filePdf' => $doc->filesUrl(),
            ],
        ]);
    }

    public function update(Docs $doc)
    {
        $imgName = Request::file('coverImg')->getClientOriginalName();
        $docName = Request::file('pdf')->getClientOriginalName();

        Request::validate([
             'docs_name' => ['required', 'max:100'],
             'coverImg' => ['nullable', 'image'],
             'pdf' => ['nullable', 'file'],
        ]);

        $doc->update(Request::only('docs_name'));

        if (Request::file('coverImg')) {
            $doc->update(['cover' => Request::file('coverImg') ? Request::file('coverImg')->storePubliclyAs('docs',$imgName) : null]) ;
        }

        if (Request::file('pdf')) {
            $doc->update([ 'files' => Request::file('pdf') ? Request::file('pdf')->storePubliclyAs('public/docs',$docName) : null]) ;
        }

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
