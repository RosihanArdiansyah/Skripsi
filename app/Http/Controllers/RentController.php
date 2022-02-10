<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class RentController extends Controller
{
    public function index()
    {
        return Inertia::render('Guest/Rent');
    }
    
}
