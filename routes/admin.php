<?php

use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Requests\Admin\ProfileUpdateRequest;

use App\Http\Controllers\Admin\PasswordUpdateRequest;
use Illuminate\Support\Facades\Route;

Route::get('dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');
Route::get('profile',   [ProfileController::class, 'index'])->name('profile');
Route::put('profile',   [ProfileController::class, 'updateProfile'])->name('profile.update');
Route::put('profile/password', [ProfileController::class, 'updatePassword'])->name('profile.password.update');