<?php

use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Requests\Admin\ProfileUpdateRequest;

use App\Http\Controllers\Admin\PasswordUpdateRequest;
use Illuminate\Support\Facades\Route;

// Route::middleware(['role:admin'])->group(function () {
// Route::get('/admin/dashboard', [AdminDashboardController::class, 'index'])
// ->name('admin.dashboard');
// });

// Route::group(['prefix' => 'admin', 'as' => 'admin.' ], function () {
//     // Route::get('dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');
//     Route::get('profile', [ProfileController::class, 'index'])->name('profile');
// });

// Route::get('dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');
// Route::get('profile', [ProfileController::class, 'index'])->name('profile');

Route::get('dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');
Route::get('profile',   [ProfileController::class, 'index'])->name('profile');
Route::put('profile',   [ProfileController::class, 'updateProfile'])->name('profile.update');
Route::put('profile/password', [ProfileController::class, 'updatePassword'])->name('profile.password.update');