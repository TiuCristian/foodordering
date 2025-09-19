<?php

// routes/web.php
use App\Http\Controllers\Admin\AdminAuthController;
use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\Frontend\FrontendController;
use App\Http\Controllers\Frontend\DashboardController;
use App\Http\Controllers\Frontend\UserProfileController;

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', [FrontendController::class, 'index'])->name('home');

// Admin auth pages (only for guests)
Route::prefix('admin')->name('admin.')->middleware('guest')->group(function () {
    Route::get('login', [AdminAuthController::class, 'index'])->name('login');
    Route::get('forget-password', [AdminAuthController::class, 'forget-password'])->name('forget-password');
    // If you have POST login:
    // Route::post('login', [AdminAuthController::class, 'store'])->name('login.store');
});

// Admin protected pages
Route::prefix('admin')->name('admin.')->middleware(['auth', 'role:admin'])->group(function () {
    Route::get('dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');
});

// Regular user dashboard
Route::get('/dashboard', fn() => view('dashboard'))->middleware('auth')->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


Route::group(['middleware' => 'auth'], function () {
    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::put('profile', [UserProfileController::class, 'updateProfile'])->name('profile.update');
    Route::put('profile/password', [UserProfileController::class, 'updatePassword'])->name('profile.password.update');
    Route::post('profile/avatar', [UserProfileController::class, 'updateAvatar'])->name('profile.avatar.update');
    Route::put('profile', [UserProfileController::class, 'updateProfile'])->name('profile.update');
    Route::put('profile/password', [UserProfileController::class, 'updatePassword'])->name('profile.password.update');
    Route::post('address', [DashboardController::class, 'createAddress'])->name('address.store');
    Route::put('address/{id}/edit', [DashboardController::class, 'updateAddress'])->name('address.update');
    Route::delete('address/{id}', [DashboardController::class, 'destroyAddress'])->name('address.destroy');
});

require __DIR__ . '/auth.php';
