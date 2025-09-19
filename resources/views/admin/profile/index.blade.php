@extends('admin.layouts.master')

@section('content')
<style>
.image-preview {
    width: 250px;
    height: 250px;
    border: 2px dashed #ccc;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
}

#avatar-preview {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

#image-label {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: rgba(0,0,0,0.6);
    color: #fff;
    padding: 5px 10px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    text-align: center;
}
</style>
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
            <form action="{{ route('admin.profile.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="form-group">
                <div class="image-preview" id="image-preview">
                    <img id="avatar-preview"
                        src="{{ auth()->user()->avatar
                                ? asset(ltrim(auth()->user()->avatar, '/'))
                                : asset('uploads/default-avatar.png') }}"
                        alt="Avatar preview">
                    <label for="image-upload" id="image-label">Choose File</label>
                    <input type="file" name="avatar" id="image-upload" accept="image/*" hidden />
                    </div>
                </div>
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


@push('scripts')
    <script>
        $(document).ready(function(){
            $('.image-preview').css({
                'background-image': 'url({{ asset(auth()->user()->avatar) }})',
                'background-size': 'cover',
                'background-position': 'center center'
            })
        })
    </script>
@endpush

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function () {
  const input  = document.getElementById('image-upload');
  const img    = document.getElementById('avatar-preview');
  const label  = document.getElementById('image-label');

  if (!input || !img || !label) return;

  input.addEventListener('change', function () {
    const file = this.files && this.files[0];
    if (!file) return;

    // show instant preview
    const url = URL.createObjectURL(file);
    img.src = url;

    // hide label
    label.style.display = 'none';

    img.onload = () => URL.revokeObjectURL(url);
  });
});
</script>
@endpush
