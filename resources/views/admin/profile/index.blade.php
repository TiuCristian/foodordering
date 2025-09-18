@extends('admin.layouts.master')

@section('content')
<section class="section">
    <div class="section-header">
        <h1>Profile</h1>
    </div> 
    <!-- closed correctly -->

    <div class="section-body">
        <div class="card card-primary">
            <div class="card-header">
                <h4>Update User Settings</h4>
                <div class="card-header-action">
                    <a href="#" class="btn btn-primary">
                        View All
                    </a>
                </div>
            </div>
        </div> 

        <div class="card-body">
            <form action="{{ route('admin.profile.update') }}" method="POST">
                @csrf
                @method('PUT')

                <div>
                    <label>Name</label>
                    <input class="form-control" type="text" name="name" value="{{ old('name', auth()->user()->name) }}">
                    @error('name') <div class="text-danger">{{ $message }}</div> @enderror
                </div>

                <div>
                    <label>Email</label>
                    <input class="form-control" type="email" name="email" value="{{ old('email', auth()->user()->email) }}">
                    @error('email') <div class="text-danger">{{ $message }}</div> @enderror
                </div>
                <br>
                <button class="btn btn-primary" type="submit">Update</button>
            </form>
        </div>

        <div class="card card-primary">
            <div class="card-header">
                <h4>Update Password</h4>
                <div class="card-header-action">
                    <a href="#" class="btn btn-primary">
                        View All
                    </a>
                </div>
            </div>
        </div> 

        <div class="card-body">
            <form action="{{ route('admin.profile.password.update') }}" method="POST">
                @csrf
                @method('PUT')

                <div class="form-group">
                    <label>Current Password</label>
                    <input type="password" class="form-control" name="current_password" required>
                    @error('current_password') <span class="text-danger">{{ $message }}</span> @enderror
                </div>

                <div class="form-group">
                    <label>New Password</label>
                    <input type="password" class="form-control" name="password" required>
                    @error('password') <span class="text-danger">{{ $message }}</span> @enderror
                </div>

                <div class="form-group">
                    <label>Confirm New Password</label>
                    <input type="password" class="form-control" name="password_confirmation" required>
                </div>

                <button class="btn btn-primary" type="submit">Save</button>
            </form>

        </div>
    </div>

</section>
@endsection