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
                ->orderBy('department')
                ->groupBy('department')
                ->get()
                ->transform(function ($docs) {
                    return [
                        'department'=>$docs->department,
                        'sum'=>$docs->total
                    ];
                }),
            ]);
    }
    
}
