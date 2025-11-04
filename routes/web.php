<?php

// routes/web.php
use App\Http\Controllers\Admin\AdminAuthController;
use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\WhyChooseUsController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ProductGalleryController;
use App\Http\Controllers\Admin\ProductOptionController;
use App\Http\Controllers\Admin\ProductReviewController;
use App\Http\Controllers\Admin\ProductSizeController;
use App\Http\Controllers\Admin\SettingsController;
use App\Http\Controllers\Frontend\FrontendController;
use App\Http\Controllers\Frontend\DashboardController;
use App\Http\Controllers\Frontend\UserProfileController;
// use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;


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

// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });


Route::group(['middleware' => 'auth'], function () {
    
    // Route::get('dashboard',        [DashboardController::class, 'index'])->name('dashboard');
    Route::put('profile',          [UserProfileController::class, 'updateProfile'])->name('profile.update');
    Route::put('profile/password', [UserProfileController::class, 'updatePassword'])->name('profile.password.update');
    Route::post('profile/avatar',  [UserProfileController::class, 'updateAvatar'])->name('profile.avatar.update');
    Route::put('profile',          [UserProfileController::class, 'updateProfile'])->name('profile.update');
    Route::put('profile/password', [UserProfileController::class, 'updatePassword'])->name('profile.password.update');
    Route::post('address',         [DashboardController::class, 'createAddress'])->name('address.store');
    Route::put('address/{id}/edit',[DashboardController::class, 'updateAddress'])->name('address.update');
    Route::delete('address/{id}',  [DashboardController::class, 'destroyAddress'])->name('address.destroy');

    Route::resource('slider', SliderController::class);

    Route::resource('why-choose-us', WhyChooseUsController::class);
    // Route::put('why-choose-title-update', [WhyChooseUsController::class, 'updateTitle'])->name('why-choose-title.update');
    Route::match(['get', 'put'], 'why-choose-title-update', [WhyChooseUsController::class, 'updateTitle'])
        ->name('why-choose-title.update');

    //Product Cat Routes
    Route::resource('category', CategoryController::class);
    
    //Product Routes
    // Route::resource('product', ProductController::class);
    Route::resource('product', ProductController::class)->except(['show']); // drop show to avoid name clash

    //Product Gallery Routes
    Route::get('product-gallery/{product}', [ProductGalleryController::class, 'index'])->name('product-gallery.index');
    Route::resource('product-gallery', ProductGalleryController::class);

    //Product Size Routes
    Route::get('product-size/{product}', [ProductSizeController::class, 'index'])->name('product-size.show-index');
    Route::resource('product-size', ProductSizeController::class);


    //Product Options Routes
    Route::resource('product-option', ProductOptionController::class);


    //Settings Route
    Route::get('settings', [SettingsController::class, 'index'])->name('settings.index');
    Route::put('/general-settings', [SettingsController::class, 'UpdateGeneralSettings'])->name('general-settings.update');
    Route::put('/pusher-settings', [SettingsController::class, 'UpdatePusherSettings'])->name('pusher-settings.update');
    Route::put('/mail-settings', [SettingsController::class, 'UpdateMailSettings'])->name('mail-settings.update');
    Route::put('/logo-settings', [SettingsController::class, 'UpdateLogoSettings'])->name('logo-settings.update');
    Route::put('/appearance-settings', [SettingsController::class, 'UpdateAppearanceSettings'])->name('appearance-settings.update');
    Route::put('/seo-settings', [SettingsController::class, 'UpdateSeoSettings'])->name('seo-settings.update');

    //Product Review Routes
    Route::get('product-reviews', [ProductReviewController::class, 'index'])->name('product-reviews.index');
    Route::post('product-reviews', [ProductReviewController::class, 'updateStatus'])->name('product-reviews.update');
    Route::delete('product-reviews/{id}', [ProductReviewController::class, 'destroy'])->name('product-reviews.destroy');
});

require __DIR__ . '/auth.php';


Route::get('/', [FrontendController::class, 'index'])->name('home');

//Show Product Details Page
Route::get('product/{slug}', [FrontendController::class, 'showProduct'])->name('product.show');
// Route::get('product/{slug}', [FrontendController::class, 'showProduct'])
//     ->where('slug', '^(?!create$|edit$).+')
//     ->name('product.show');