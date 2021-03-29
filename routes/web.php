<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\ContactsController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ImagesController;
use App\Http\Controllers\OrganizationsController;
use App\Http\Controllers\ReportsController;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\DocsController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Auth

Route::get('login', [LoginController::class, 'showLoginForm'])
    ->name('login')
    ->middleware('guest');

Route::post('login', [LoginController::class, 'login'])
    ->name('login.attempt')
    ->middleware('guest');

Route::post('logout', [LoginController::class, 'logout'])
    ->name('logout');

// Dashboard

Route::get('/', [DashboardController::class, 'index'])
    ->name('dashboard')
    ->middleware('auth');

// Users

Route::get('users', [UsersController::class, 'index'])
    ->name('users')
    ->middleware('remember', 'auth');

Route::get('users/create', [UsersController::class, 'create'])
    ->name('users.create')
    ->middleware('auth');

Route::post('users', [UsersController::class, 'store'])
    ->name('users.store')
    ->middleware('auth');

Route::get('users/{user}/edit', [UsersController::class, 'edit'])
    ->name('users.edit')
    ->middleware('auth');

Route::put('users/{user}', [UsersController::class, 'update'])
    ->name('users.update')
    ->middleware('auth');

Route::delete('users/{user}', [UsersController::class, 'destroy'])
    ->name('users.destroy')
    ->middleware('auth');

Route::put('users/{user}/restore', [UsersController::class, 'restore'])
    ->name('users.restore')
    ->middleware('auth');

//Documents

Route::get('docs', [DocsController::class, 'index'])
    ->name('docs')
    ->middleware('remember', 'auth');

Route::get('docs/create', [DocsController::class, 'create'])
    ->name('docs.create')
    ->middleware('auth');

Route::post('docs', [DocsController::class, 'store'])
    ->name('docs.store')
    ->middleware('auth');

Route::get('docs/{doc}/edit', [DocsController::class, 'edit'])
    ->name('docs.edit')
    ->middleware('auth');

Route::get('docs/{doc}/show', [DocsController::class, 'show'])
    ->name('docs.show')
    ->middleware('auth');

Route::put('docs/{doc}', [DocsController::class, 'update'])
    ->name('docs.update')
    ->middleware('auth');

Route::delete('docs/{doc}', [DocsController::class, 'destroy'])
    ->name('docs.destroy')
    ->middleware('auth');

Route::put('docs/{doc}/restore', [DocsController::class, 'restore'])
    ->name('docs.restore')
    ->middleware('auth');

// Reports

Route::get('reports', [ReportsController::class, 'index'])
    ->name('reports')
    ->middleware('auth');

// Images

Route::get('/img/{path}', [ImagesController::class, 'show'])->where('path', '.*');

// 500 error

Route::get('500', function () {
    // Force debug mode for this endpoint in the demo environment
    if (App::environment('demo')) {
        Config::set('app.debug', true);
    }

    echo $fail;
});
