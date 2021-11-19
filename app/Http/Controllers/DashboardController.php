<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        DB::statement('SET lc_time_names = "id_ID"');
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
            // 'reports' => Auth::user()->account->reports()
            // 	->select('created_at',DB::raw('count(created_at) as total'),DB::raw('DATE_FORMAT(created_at,"%M %Y") as months'))
            //     ->where("created_at", ">", now()->format('M'))
            //     ->orderBy('months') 
            //     ->groupBy('months')
            //     ->get()
            //     ->transform(function ($reports) {
            //         return [
            //             'month'=>$reports->months,
            //             'sum'=>$reports->total
            //         ];
            //     }),
            'user' => Auth::user()->account->users()
            	->select('status',DB::raw('count(status) as online'))
                ->where('status',1)
                ->get()
                ->transform(function ($docs) {
                    return [
                        'online'=>$docs->online
                    ];
                }),
            ]);
    }
    
}
