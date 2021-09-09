<?php

namespace App\Http\Controllers;

use App\Models\Docs;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Request;
use Illuminate\Validation\Rule;
use Inertia\Inertia;
use DB;

class DashboardController extends Controller
{
    public function index()
    {
        return Inertia::render('Dashboard/Index',[
            'docs' => Auth::user()->account->docs()
            	->select('department',DB::raw('count(department) as total'))
                ->whereNotNull('department')
                ->orderBy('department') 
                ->groupBy('department')
                ->get()
                ->transform(function ($docs) {
                    return [
                        'department'=>$docs->department,
                        'sum'=>$docs->total
                    ];
                }),
            'reports' => Auth::user()->account->reports()
            	->select('created_at',DB::raw('count(created_at) as total'),DB::raw('DATE_FORMAT(created_at,"%M %Y") as months'))
                ->where("created_at", ">", now()->format('M'))
                ->orderBy('months') 
                ->groupBy('months')
                ->get()
                ->transform(function ($reports) {
                    return [
                        'month'=>$reports->months,
                        'sum'=>$reports->total
                    ];
                }),
            ]);
    }
    
}
