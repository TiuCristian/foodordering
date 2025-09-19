<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ProfileUpdateRequest;
use App\Http\Requests\Admin\PasswordUpdateRequest; // <-- add this

use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Traits\FileUploadTrait;

class ProfileController extends Controller
{
    use FileUploadTrait;
    public function index(): View
    {
        return view('admin.profile.index');
    }

    public function updateProfile(ProfileUpdateRequest $request): RedirectResponse
    {
        $imagePath = $this->uploadImage($request, 'avatar');
        // $user = $request->user();          // current auth user
        $user = Auth::user();          // current auth user
        $user->fill($request->only('name', 'email'));
        $user->avatar = isset($imagePath) ? $imagePath : $user->avatar;
        $user->save();

        toastr('Updated successfuly!', 'success');

        return back()->with('status', 'Profile updated!');
    }

    public function updatePassword(PasswordUpdateRequest $request): RedirectResponse
    {
        $user = Auth::user();

        // update password
        $user->update([
            'password' => Hash::make($request->password),
        ]);

        return back()->with('success', 'Password updated successfully!');
    }
}
