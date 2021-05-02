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
                        'author'=>$docs->author,
                        'department'=>$docs->department,
                        'deleted_at' => $docs->deleted_at,
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
        
        Request::validate([
                'docs_name' => ['required', 'max:100'],
                'author' => ['required', 'max:100'],
                'department' => ['required', 'max:100'],
                'pdf' => ['nullable', 'file'],
        ]);

        if (Request::file('pdf')) {
            $docName = Request::file('pdf')->getClientOriginalName();
        }
     
        Auth::user()->account->docs()->create([
            'docs_name' => Request::get('docs_name'),
            'author' => Request::get('author'),
            'department' => Request::get('department'),
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
                'author'=>$doc->author,
                'department'=>$doc->department,
                'deleted_at' => $doc->deleted_at,
                'filePdf' => $doc->files,
            ],
        ]);
    }

      public function show(Docs $doc)
    {
        Storage::disk('local');
        return Inertia::render('Documents/PDFViewer', [
            'doc' => [
                'id' => $doc->id,
                'docs_name' => $doc->docs_name,
                'filePdf' => $doc->filesUrl(),
            ],
        ]);
    }

    public function update(Docs $doc)
    {
        

        Request::validate([
             'docs_name' => ['required', 'max:100'],
             'author' => ['required', 'max:100'],
             'department' => ['required', 'max:100'],
             'pdf' => ['nullable', 'file'],
        ]);



        $doc->update(Request::only('docs_name','author','department'));

        if (Request::file('pdf')) {
            $docName = Request::file('pdf')->getClientOriginalName();
            
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
