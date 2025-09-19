<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\Frontend\UserProfileUpdateRequest;
use App\Http\Requests\Frontend\ProfilePasswordUpdateRequest;

use Illuminate\Http\RedirectResponse;
use App\Traits\FileUploadTrait;
use Auth;

class UserProfileController extends Controller
{
    //
    use FileUploadTrait;

    function updateProfile(UserProfileUpdateRequest $request): RedirectResponse
    {
        $user = Auth::user();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->save();

        toastr()->success('Profile Updated Successfully');

        return redirect()->back();
    }

    function updatePassword(ProfilePasswordUpdateRequest $request): RedirectResponse
    {
        $user = Auth::user();
        $user->password = bcrypt($request->password);
        $user->save();
        toastr()->success('Password Updated Successfully');

        return redirect()->back();
    }

    function updateAvatar(Request $request)
    {
        /** handle image file */
        $imagePath = $this->uploadImage($request, 'avatar');

        $user = Auth::user();
        $user->avatar = $imagePath;
        $user->save();

        toastr()->success('Profile Image Updated Successfully');
        
        return redirect()->back();
        // return response(['status' => 'success', 'message' => 'Avatar Updated Successfully']);
    }
    
}
