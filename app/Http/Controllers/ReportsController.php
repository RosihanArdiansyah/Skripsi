<?php

namespace App\Http\Controllers;

use App\Models\Reports;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Request;
use Illuminate\Validation\Rule;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class ReportsController extends Controller
{
    public function index()
    {
        setlocale(LC_TIME, 'Indonesian');
        return Inertia::render('Reports/Index', [
            'page' => Reports::paginate(5),
            'filters' => Request::all('search', 'trashed','monthly'),
            'reports' => Auth::user()->account->reports()
                ->orderBy('created_at')
                ->filter(Request::only('search', 'trashed','monthly')) 
                ->paginate(5)
                ->withQueryString()
                ->through(function ($report) {
                    return [
                        'id' => $report->id,
                        'user_name' => $report->user_name,
                        'department' => $report->department,
                        'doc_name' => $report->doc_name,
                        'created_at' => $report->created_at->formatLocalized('%A, %d %B %Y'),
                        'deleted_at' => $report->deleted_at,
                    ]; 
                }),
        ]);
    }

    public function show(Reports $report)
    {
        setlocale(LC_TIME, 'Indonesian');
        return Inertia::render('Reports/Edit', [
            'report' => [
                'id' => $report->id,
                'user_name' => $report->user_name,
                'department' => $report->department,
                'doc_name' => $report->doc_name,
                'created_at' => $report->created_at->formatLocalized('%A, %d %B %Y %H:%M'),
            ],
        ]);   
    }

    public function rMonth()
    {
        DB::statement('SET lc_time_names = "id_ID"');
        return Inertia::render('Reports/Monthly', [
            'page' => Reports::paginate(5),
            'filters' => Request::all('search', 'trashed'),
            'reports' => Auth::user()->account->reports()
                ->select('created_at',DB::raw('count(created_at) as total'),DB::raw('DATE_FORMAT(created_at,"%M %Y") as months'))
                ->where("created_at", ">", now()->format('M'))
                ->orderBy('months') 
                ->groupBy('months')
                ->get()
                // ->paginate(5)
                // ->withQueryString()
                ->transform(function ($report) {
                    return [
                        'month'=>$report->months,
                        'sum'=>$report->total
                    ]; 
                }),
        ]);
    }

    // public function create()
    // {
    //     return Inertia::render('Reports/Create');
    // }

    public function store()
    {
        $doc = Request::get('docs_id');
        Auth::user()->account->reports()->create(
            Request::validate([
                'docs_id' => ['nullable', Rule::exists('docs', 'id')->where(function ($query) {
                    $query->where('account_id', Auth::user()->account_id);
                })],
                'users_id' => ['nullable', Rule::exists('users', 'id')->where(function ($query) {
                    $query->where('account_id', Auth::user()->account_id);
                })],
                'user_name' => ['required', 'max:50'],
                'doc_name' => ['nullable', Rule::exists('docs', 'docs_name')->where(function ($query) {
                    $query->where('account_id', Auth::user()->account_id);
                })],
                'department' => ['nullable', Rule::exists('users', 'department')->where(function ($query) {
                    $query->where('account_id', Auth::user()->account_id);
                })],

             ])
        );

        return Redirect::route('docs.show',$doc);
    }

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
