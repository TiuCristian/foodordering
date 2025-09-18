<?php

namespace Database\Seeders;

use App\Models\User;                
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash; 

class UserSeeder extends Seeder
{
    public function run(): void
    {
        // idempotent (run safely multiple times)
        User::insert([
            [
                'name' => 'Admin',
                'email' => 'tiucrs@gmail.com',
                'role'  => 'admin',
                'password' => Hash::make('password'),
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'User',
                'email' => 'tiugeorgecristian@gmail.com',
                'role'  => 'user',
                'password' => Hash::make('password'),
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
