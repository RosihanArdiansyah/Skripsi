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
            'page' => Docs::paginate(5),
            'filters' => Request::all('search', 'trashed'),
            'docs' => Auth::user()->account->docs()
                ->orderBy('docs_name')
                ->filter(Request::only('search', 'trashed'))
                ->paginate(5)
                ->withQueryString()
                ->through(function ($docs) {
                    return [
                        'id' => $docs->id,
                        'docs_name' => $docs->docs_name,
                        'author'=>$docs->author,
                        'department'=>$docs->department,
                        'NIM'=>$docs->NIM,
                        'year'=>$docs->year,
                        'deleted_at' => $docs->deleted_at,
                        'pdf'=> $docs->files,
                    ];
                }),
        ]);
    }

    public function searchIndex($doc)
    {
    return Inertia::render('Documents/Index', [
            'page' => Docs::paginate(5),
            'src' => ['val' => $doc],
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
                        'NIM'=>$docs->NIM,
                        'year'=>$docs->year,
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
                'docs_name' => ['required', 'max:256'],
                'author' => ['required', 'max:100'],
                'NIM' => ['required', 'max:100'],
                'year' => ['required', 'max:4'],
                'department' => ['required', 'max:100'],
                'pdf' => ['nullable', 'file'],
        ]);

        $name = str_replace(' ','_',Request::get('author'));
        $nim = Request::get('NIM');
        if (Request::file('pdf')) {
            $docName = Request::file('pdf')->getClientOriginalExtension();
        }
     
        Auth::user()->account->docs()->create([
            'docs_name' => Request::get('docs_name'),
            'author' => Request::get('author'),
            'NIM' => Request::get('NIM'),
            'year' => Request::get('year'),
            'department' => Request::get('department'),
            'files' => Request::file('pdf') ? Request::file('pdf')->storePubliclyAs('docs',$nim.'_'.$name.'.'.$docName) : null,
        ]);

        return Redirect::route('docs')->with('success', 'Dokumen ditambahkan');
    }

    public function edit(Docs $doc)
    {
        return Inertia::render('Documents/Edit', [
            'doc' => [
                'id' => $doc->id,
                'docs_name' => $doc->docs_name,
                'author'=>$doc->author,
                'department'=>$doc->department,
                'NIM'=>$doc->NIM,
                'year'=>$doc->year,
                'deleted_at' => $doc->deleted_at,
                'pdf'=> $doc->files,
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
            'docs_name' => ['required', 'max:256'],
            'author' => ['required', 'max:100'],
            'NIM' => ['required', 'max:100'],
            'year' => ['required', 'max:4'],
            'department' => ['required', 'max:100'],
            'pdf' => ['nullable', 'file'],
        ]);

        $name = str_replace(' ','_',Request::get('author'));
        $nim = Request::get('NIM');

        $doc->update(Request::only('docs_name','author','department','NIM','year'));

        if (Request::file('pdf')) {
            $docName = Request::file('pdf')->getClientOriginalExtension();
            
            $doc->update([ 'files' => Request::file('pdf') ? Request::file('pdf')->storePubliclyAs('public/docs',$nim.'_'.$name.'.'.$docName) : null]) ;
        }

        return Redirect::back()->with('success', 'Dokumen berhasil diubah.');
    }

    public function destroy(Docs $doc)
    {
        $doc->delete();

        return Redirect::back()->with('success', 'Dokumen dihapus.');
    }

    public function restore(Docs $doc)
    {
        $doc->restore();

        return Redirect::back()->with('success', 'Dokumen dikembailkan.');
    } 
}
