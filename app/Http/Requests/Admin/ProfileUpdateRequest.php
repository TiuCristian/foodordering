<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProfileUpdateRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true; // adjust if you gate this
    }

    public function rules(): array
    {
        return [
            'name'  => ['required', 'string', 'max:50'],
            'email' => [
                'required',
                'email',
                'max:200',
                Rule::unique('users', 'email')->ignore($this->user()->id), // ignore current user
            ],
        ];
    }
}
