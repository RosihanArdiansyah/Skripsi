<?php

namespace App\Http\Controllers;

use App\Models\Reports;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class ReportsController extends Controller
{
    public function index()
    {
        return Inertia::render('Reports/Index', [
            'page' => Reports::paginate(5),
            'filters' => Request::all('search', 'trashed'),
            'reports' => Auth::user()->account->reports()
                ->orderBy('user_name')
                ->filter(Request::only('search', 'trashed'))
                ->paginate(5)
                ->withQueryString()
                ->through(function ($report) {
                    return [
                        'id' => $report->id,
                        'user_name' => $report->user_name,
                        'department' => $report->department,
                        'doc_name' => $report->doc_name,
                        'created_at' => $report->created_at,
                        'deleted_at' => $report->deleted_at,
                    ];
                }),
        ]);
    }

    public function show(Reports $report)
    {
        return Inertia::render('Reports/Edit', [
            'report' => [
                'id' => $report->id,
                'user_name' => $report->user_name,
                'department' => $report->department,
                'doc_name' => $report->doc_name,
                'created_at' => $report->created_at,
            ],
        ]);   
    }

    // public function create()
    // {
    //     return Inertia::render('Reports/Create');
    // }

    // public function store()
    // {
        
    //     Request::validate([
    //             'name' => ['required', 'max:100'],
    //     ]);
     
    //     Auth::user()->account->types()->create([
    //         'name' => Request::get('name'),
    //     ]);

    //     return Redirect::route('types')->with('success', 'Dokumen ditambahkan');
    // }

    public function destroy(Reports $report)
    {
        $report->delete();

        return Redirect::back()->with('success', 'Dokumen dihapus.');
    }

    public function restore(Reports $report)
    {
        $report->restore();

        return Redirect::back()->with('success', 'Dokumen dikembailkan.');
    } 
}
