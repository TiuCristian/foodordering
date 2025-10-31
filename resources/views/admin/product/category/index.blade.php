@extends('admin.layouts.master')

@section('content')
    <section class="section">
        <div class="section-header">
            <h1>Product Categories</h1>
        </div>

        <div class="card card-primary">
            <div class="card-header">
                <h4>All Categories</h4>
                <div class="card-header-action">
                    <a href="{{ route('category.create') }}" class="btn btn-primary">
                        Create new
                    </a>
                </div>
            </div>
            <div class="card-body">
                {{ $dataTable->table() }}
            </div>
        </div>
    </section>
@endsection

@push('scripts')
    {{ $dataTable->scripts(attributes: ['type' => 'module']) }}

  

    <script>
        document.addEventListener('click', function (e) {
            if (e.target.closest('.delete-item')) {
                const btn = e.target.closest('.delete-item');
                const id = btn.getAttribute('data-id');

                if (!confirm('Delete this category?')) return;

                fetch("{{ url('admin/category') }}/" + id, {
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                        'Accept': 'application/json'
                    }
                })
                .then(r => r.json())
                .then(data => {
                    if (data.status === 'success') {
                        // reload datatable
                        $('#category-table').DataTable().ajax.reload();
                    } else {
                        alert(data.message || 'Something went wrong');
                    }
                })
                .catch(() => alert('Request failed'));
            }
        });
    </script>
@endpush

